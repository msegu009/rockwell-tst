class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(sessions_params[:email])
    # If the user exists AND the password entered is correct.
  	if user && user.authenticate(sessions_params[:password_digest])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
  		session[:user_id] = user.id
  		redirect_to '/'
  	else
    # If user's login doesn't work, send them back to the login form.
      flash[:login_errors] = "Invalid login credentials"
      redirect_to '/login'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/login'
  end

  private
  def sessions_params
    params.require(:session).permit(:email, :password_digest)
  end
end
