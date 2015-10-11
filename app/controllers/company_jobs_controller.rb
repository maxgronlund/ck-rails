class CompanyJobsController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def list
    @current = User.find(session[:user_id])
    @jobs = Job.find_by_sql('select * from jobs inner join users on users.id = jobs.user_id where users.id = \''+session[:user_id].to_s+'\'')
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

    redirect_to('/company/jobs')

  end

end
