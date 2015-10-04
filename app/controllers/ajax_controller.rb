class AjaxController < ApplicationController

  def citylist
    stateid = params[:state]
    @cities = City.where(:state_id => stateid)
    @response = "<select class=\"form-control\" name\"job[city]\">"

    @cities.each do |c|
      @response += "<option value=\""+c.id.to_s+"\">"+c.city_name+"</option>"
    end

    @response +="</select>"

    render :json => @response

  end

  def paybyid
    ids = params[:ids]

    # contoh nih buat API
    # @pay = User.joins('LEFT OUTER JOIN jobs on users.id = jobs.user_id LEFT OUTER JOIN payments on jobs.id = payments.job_id')
    # render :json => @pay.to_json(:include => { :jobs => { :include => :payment}})

    paydata   = Payment.where(:payment_hash_id => ids).first
    jobdata   = Job.find(paydata.job_id)
    userdata  = User.find(jobdata.user_id)
    str = "<tr>"
    str += "<td>"+paydata.payment_hash_id+"</td>"
    str += "<td class=\"time\">"+paydata.created_at.to_s+"</td>"
    str += "<td>"+jobdata.job_name+"</td>"
    str += "<td>"+userdata.user_name+"</td>"
    str += "<td>"+paydata.payment_price.to_s+"</td>"
    str += "<td>
                            <div class=\"dropdown\">
                              <button class=\"btn btn-white btn-sm dropdown-toggle\" type=\"button\" id=\"dropdownMenu2\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"true\">
                                Action
                                <span class=\"caret\"></span>
                              </button>
                              <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenu2\">
                                <li><a href=\"/admin/payments/"+paydata.payment_hash_id+"\">Details</a></li>
                                <li class=\"\"><a href=\"/admin/payments/edit/"+paydata.payment_hash_id+"\">Accept</a></li>
    <li><a href=\"/admin/payments/delete/"+paydata.payment_hash_id+"\">Decline</a></li>
    </ul>
                            </div>
    </td>"
    str +="</tr>"


    render :json => str.to_json()

  end

  def paybydate
    #params
    start = params[:start]
  end

end
