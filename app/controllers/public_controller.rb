class PublicController < ApplicationController
  layout "public"

  def register
    @states = State.all

  end

  def signup
    hashid = Hashids.new('carikerjaan indonesia',8)

    @currentUser = User.create({
      user_name: params[:register][:name],
      user_email: params[:register][:email],
      password: params[:register][:password],
      user_role: params[:register][:role],
      user_state: params[:register][:state],
      user_city: params[:register][:city]
    })

    @currentUser.user_hash_id = hashid.encode(@currentUser.id)
    @currentUser.save

    redirect_to '/'
  end
end
