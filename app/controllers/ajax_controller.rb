class AjaxController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token

  def citylist
    stateid = params[:state]
    @cities = City.where(:state_id => stateid)
    @response = "<select class=\"form-control\" name=\"job[city]\">"

    @cities.each do |c|
      @response += "<option value=\""+c.id.to_s+"\">"+c.city_name+"</option>"
    end

    @response +="</select>"

    render :json => @response

  end

  def citylistusr
    stateid = params[:state]
    @cities = City.where(:state_id => stateid)
    @response = "<select class=\"form-control\" name=\"user[city]\">"

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
    str += "<td class=\"\">"+paydata.created_at.to_s+"</td>"
    str += "<td>"+jobdata.job_name+"</td>"
    str += "<td>"+userdata.user_name+"</td>"
    str += "<td class=\"price\">"+paydata.payment_price.to_s+"</td>"
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
    to = params[:to]
    status = params[:status]

    if start == '' || to == '' || status == ''
      str = "<tr><td colspan=\"6\">Invalid Parameter </td></tr>"
      render :json => str.to_json()
    elsif status == 'all'
      @data = Payment.find_by_sql('select payments.payment_hash_id , payments.created_at , jobs.job_name , users.user_name , payments.payment_price from payments inner join jobs on jobs.id = payments.job_id inner join users on jobs.user_id = users.id where payments.created_at > \''+start+'\' and payments.created_at < \''+to+'\'')

      str = "<tr>"
      @data.each do |d|
        str += "<td>"+d.payment_hash_id+"</td>"
        str += "<td class=\"\">"+d.created_at.to_s+"</td>"
        str += "<td>"+d.job_name+"</td>"
        str += "<td>"+d.user_name+"</td>"
        str += "<td class=\"price\">"+d.payment_price.to_s+"</td>"
        str += "<td>
                            <div class=\"dropdown\">
                              <button class=\"btn btn-white btn-sm dropdown-toggle\" type=\"button\" id=\"dropdownMenu2\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"true\">
                                Action
                                <span class=\"caret\"></span>
                              </button>
                              <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenu2\">
                                <li><a href=\"/admin/payments/"+d.payment_hash_id+"\">Details</a></li>
                                <li class=\"\"><a href=\"/admin/payments/edit/"+d.payment_hash_id+"/approve\">Accept</a></li>
    <li><a href=\"/admin/payments/delete/"+d.payment_hash_id+"/decline\">Decline</a></li>
    </ul>
                            </div>
    </td></tr>"
      end

      str += "</tr>"
      if @data.length == 0
        str = "<tr><td colspan=\"6\">No Data </td></tr>"
      end
      render :json => str.to_json()
    else
      @data = Payment.find_by_sql('select payments.payment_hash_id , payments.created_at , jobs.job_name , users.user_name , payments.payment_price from payments inner join jobs on jobs.id = payments.job_id inner join users on jobs.user_id = users.id where payments.created_at > \''+start+'\' and payments.created_at < \''+to+'\' and payments.payment_status = \''+status+'\'')

      str = "<tr>"
      @data.each do |d|
        str += "<td>"+d.payment_hash_id+"</td>"
        str += "<td class=\"time\">"+d.created_at.to_s+"</td>"
        str += "<td>"+d.job_name+"</td>"
        str += "<td>"+d.user_name+"</td>"
        str += "<td class=\"price\">"+d.payment_price.to_s+"</td>"
        str += "<td>
                            <div class=\"dropdown\">
                              <button class=\"btn btn-white btn-sm dropdown-toggle\" type=\"button\" id=\"dropdownMenu2\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"true\">
                                Action
                                <span class=\"caret\"></span>
                              </button>
                              <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenu2\">
                                <li><a href=\"/admin/payments/"+d.payment_hash_id+"\">Details</a></li>
                                <li class=\"\"><a href=\"/admin/payments/edit/"+d.payment_hash_id+"/approve\">Accept</a></li>
    <li><a href=\"/admin/payments/delete/"+d.payment_hash_id+"/decline\">Decline</a></li>
    </ul>
                            </div>
    </td></tr>"
      end

      str += "</tr>"
      if @data.length == 0
        str = "<tr><td colspan=\"6\">No Data </td></tr>"
      end
      render :json => str.to_json()
    end



  end

  def addExp

    currentExp = UserExperience.create({
                                           started: params[:exp][:exp_start],
                                           ends: params[:exp][:exp_end],
                                           instance: params[:exp][:instance],
                                           position: params[:exp][:position],
                                           user_id: params[:exp][:user_id]
                                       })

    html = "<div class=\"feed-element\" id=\"exp"+currentExp.id.to_s+"\">
    <div class=\"\">
        Worked at <strong>"+currentExp.instance+"</strong> as <strong>"+currentExp.position+"</strong>
    <small class=\"text-muted\"><span class=\"time\">"+currentExp.started.to_s+"</span> - <span class=\"time\">"+currentExp.ends.to_s+"</span></small>
    <a onclick=\"delExp('"+currentExp.id.to_s+"')\" class=\"label label-danger\"><i class=\"fa fa-trash\"></i></a>
    </div></div>"

    render :json => html.to_json()
  end

  def delExp
    UserExperience.destroy(params[:ids])

    msg = "exp deleted"
    render :json => msg.to_json()
  end

  def ajaxcityregister
    @cities = City.where(:state_id => params[:ids])
    html = "<div class=\"form-group\"><select class=\"form-control\" name=\"register[city]\">"
    @cities.each do |c|
      html+= "<option value=\""+c.id.to_s+"\">"+c.city_name+"</option>"
    end
    html+="</select>"
    render :json => html.to_json()
  end

end
