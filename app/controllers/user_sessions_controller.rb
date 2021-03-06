class UserSessionsController < ApplicationController
  def new
    render "combo_form"
  end

  def create
    if params[:user_session][:login] == "yes"
      # Default to remember me
      @user_session = UserSession.new((params[:user_session] || {}).merge(:remember_me => true))
      @user_session.save do |result|
        if result
          new_user = @user_session.user.login_count == 1

          respond_to do |format|
            format.html do
              flash[:notice] = "Login successful!"
              redirect_back_or_default user_path(current_user)
            end
            format.json { render :json => {:status => "ok"} }
          end
        else
          respond_to do |format|
            format.html { render "combo_form" }
            format.json do
              render :json => {
                :status => "error",
                :errors => @user_session.errors.full_messages
              }
            end
          end
        end
      end
    else
      session[:email] = params[:user_session][:email]

      redirect_to new_user_path
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy if @user_session

    redirect_to root_url, :notice => "Successfully logged out."
  end
end
