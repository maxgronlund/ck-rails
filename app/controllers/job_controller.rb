class JobController < ApplicationController
	layout "admin"

	def list
		@current = User.find(session[:user_id])
		@section = "Jobs"
		@active = "jobs"
		@jobs = Job.all
	end

	def new
		@current = User.find(session[:user_id])
		@section = "Jobs"
		@active = "jobs"
		@categories = Category.all.order(:category_name)
		@salaries = Salary.all
		@states = State.all
	end

	def submit
		hashid = Hashids.new('carikerjaan indonesia',8)
		currentJob = Job.create({
			job_name: params[:job][:name],
			job_description: params[:job][:description],
			job_salary: params[:job][:salary],
			job_category: params[:job][:category],
			job_start: params[:job][:start],
			job_valid: params[:job][:valid],
			job_state: params[:job][:state],
			job_city: params[:job][:city],
			job_creator: session[:user_id],
			job_is_fake: false,
			job_status: 'OK',
		});

		job = Job.find(currentJob.id)
		job.job_hash_id = hashid.encode(currentJob.id)
		job.save;

		redirect_to('/admin/jobs')

		# redirect_to('/admin/jobs')
	end

end
