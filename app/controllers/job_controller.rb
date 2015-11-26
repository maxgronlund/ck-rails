class JobController < ApplicationController
	include SessionHelper
	before_action :ensureAdmin
	layout "admin"

	def list
		@current = User.find(session[:user_id])
		@section = "Jobs"
		@active = "jobs"
		@alljobs = User.all
		@chronic = Chronic
	end

	def new
		@current = User.find(session[:user_id])
		@section = "Jobs"
		@active = "jobs"
		@categories = Category.all.order(:category_name)
		@salaries = Salary.all
		@states = State.all
		@users = User.where('user_role = ?' , 'company')
	end

	def submit
		hashid = Hashids.new('carikerjaan indonesia',8)
		currentJob = Job.create({
			job_name: params[:jobblue][:name],
			job_description: params[:jobblue][:description],
			salary_id: params[:jobblue][:salary],
			category_id: params[:jobblue][:category],
			job_start: Chronic.parse(params[:jobblue][:start]),
			job_valid: Chronic.parse(params[:jobblue][:valid]),
			state_id: params[:jobblue][:state],
			city_id: params[:jobblue][:city],
			user_id: params[:jobblue][:publisher],
			job_is_fake: false,
			job_status: 'OK',
			flag: 'active'
		});

		job = Job.find(currentJob.id)
		job.job_hash_id = hashid.encode(currentJob.id)
		job.save;

		diff = TimeDifference.between(job.job_start , job.job_valid).in_days
		price = diff*5000

		currentPayment = Payment.create({
				job_id: currentJob.id,
				payment_status: 'unpaid',
				payment_price: price,
				payment_days: diff,
				user_id: session[:user_id],
				payment_approval: false
		})

		pay = Payment.find(currentPayment.id)
		pay.payment_hash_id = hashid.encode(currentPayment.id)
		pay.save

		PaymentLog.create({
			payment_id: currentPayment.id,
			payment_state: 'issued',
			issuer: session[:user_id],
			issued_at: Time.now,
			created_at: Time.now,
			updated_at: Time.now
		})

		clear_api_cache

		redirect_to('/admin/jobs')

		# redirect_to('/admin/jobs')
	end

	def edit
		ids = params[:ids]
		@section = "Jobs"
		@active = "jobs"
		@currentJob = Job.where(:job_hash_id => ids).first
		@current = User.find(session[:user_id])
		@categories = Category.all.order(:category_name)
		@salaries = Salary.all
		@states = State.all
		@cities = City.where(:state_id => @currentJob.state_id)
		@users = User.where('user_role = ?' , 'company')
	end

	def update
		ids = params[:ids]
		@currentJob = Job.where(:job_hash_id => ids).first
		@currentJob.job_name = params[:jobblue][:name]
		@currentJob.job_description = params[:jobblue][:description]
		@currentJob.category_id = params[:jobblue][:category]
		@currentJob.salary_id = params[:jobblue][:salary]
		@currentJob.state_id = params[:jobblue][:state]
		@currentJob.city_id = params[:jobblue][:city]
		@currentJob.user_id = params[:jobblue][:publisher]
		@currentJob.job_start = Chronic.parse(params[:jobblue][:start])
		@currentJob.job_valid = Chronic.parse(params[:jobblue][:valid])
		@currentJob.save

		clear_api_cache

		redirect_to '/admin/jobs'
	end

end
