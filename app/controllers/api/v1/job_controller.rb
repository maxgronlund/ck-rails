class Api::V1::JobController < ApplicationController
  include ApiHelper
  before_action :validateJWT
  before_action :responseFormat

  def index
    today = Chronic.parse('today')
    category = params[:cat]
    query = params[:query]
    key = ""

    if !category
      category = "0"
      key +="0"
    else
      key +=category
    end
    location = params[:loc]
    if !location
      location = "0"
      key +="0"
    else
      key +=location
    end
    if !query
      query = ""
      key +="all"
    else
      key +=query
    end

    jobs = get_cache(key)
    if jobs.nil?
      @response[:data] = Job.all
      set_cache(key,@response[:data])
    else
      @response[:data] = jobs
    end
    @response[:status] = 200
    render :json => @response.to_json
  end

end
