class CompanyJobsController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def list
    @current = User.find(session[:user_id])
    @section = "Jobs"
    @active = "jobs"
    @jobs = Job.find_by_sql('select * from jobs inner join users on users.id = jobs.user_id where users.id = \''+session[:user_id].to_s+'\' and jobs.flag = \'active\'')
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
                                job_start: Chronic.parse(params[:job][:start]),
                                job_valid: Chronic.parse(params[:job][:valid]),
                                job_state: params[:job][:state],
                                job_city: params[:job][:city],
                                user_id: session[:user_id],
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
                                        payment_creator: session[:user_id],
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
                      });
    flash[:success] = "Jobs successfully created."
    redirect_to('/company/jobs')

  end

  def edit
    @current = User.find(session[:user_id])
    @section = "Jobs"
    @active = "jobs"

    job_id = params[:ids]

    @currentJob = Job.where(:job_hash_id => job_id).first
    if @currentJob.payment.payment_status == 'paid'
      flash[:warning] = "Jobs has been paid, can\'t be edited.'"
      redirect_to '/company/jobs'
    else
      @categories = Category.all.order(:category_name)
      @salaries = Salary.all
      @states = State.all
      @cities = City.where(:state_id => @currentJob.job_state)
    end
  end

  def update
    ids = params[:ids]
    @currentJob = Job.where(:job_hash_id => ids).first
    @currentJob.job_name = params[:job][:name]
    @currentJob.job_description = params[:job][:description]
    @currentJob.job_category = params[:job][:category]
    @currentJob.job_salary = params[:job][:salary]
    @currentJob.job_state = params[:job][:state]
    @currentJob.job_city = params[:job][:city]
    @currentJob.job_start = Chronic.parse(params[:job][:start])
    @currentJob.job_valid = Chronic.parse(params[:job][:valid])
    @currentJob.save
    flash[:success] = "Jobs successfully updated."
    redirect_to '/company/jobs'
  end

  def delete
    ids = params[:ids]
    @currentJob = Job.where(:job_hash_id => ids).first
    @currentJob.flag = 'deleted'
    @currentJob.save
    flash[:success] = "Jobs successfully deleted."
    redirect_to '/company/jobs'
  end

end
