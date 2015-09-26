class AjaxController < ApplicationController

  def citylist
    stateid = params[:state]
    @cities = City.where(:city_state => stateid)
    @response = "<select class=\"form-control\" name\"job[city]\">"

    @cities.each do |c|
      @response += "<option value=\""+c.id.to_s+"\">"+c.city_name+"</option>"
    end

    @response +="</select>"

    render :json => @response

  end

end
