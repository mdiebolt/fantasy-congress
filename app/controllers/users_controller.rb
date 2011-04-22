class UsersController < ApplicationController
  before_filter :require_current_user, :only => [:edit, :update]

  REGISTERED_FLASH = "Account registered!"

  def new
    @user = User.new

    email = session.delete(:email) || ''

    user.email ||= email
    user.display_name = email[0..((email.index('@') || 0) - 1)]
  end

  def create
    @user = User.new(params[:user])

    @user.save do |result|
      if result
        respond_to do |format|
          format.html do
            @registered = true
            redirect_to user, :notice => REGISTERED_FLASH
          end
          format.json { render :json => {:status => "ok"} }
        end
      else
        respond_to do |format|
          format.html { render :action => :new }
          format.json do
            render :json => {
              :status => "error",
              :errors => user.errors.full_messages
            }
          end
        end
      end
    end
  end

  def show
  end

  private

  def collection
    users = User.all

    @collection ||= users.order("id DESC")
  end

  def require_current_user
    unless current_user?
      redirect_to root_url, :notice => "You can only edit your own account"
    end
  end

  def current_user?
    current_user == user
  end
  helper_method :current_user?

  def user
    return @user if defined?(@user)

    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find params[:id]
    end
  end
  helper_method :user

  def users
    collection
  end
  helper_method :users
end
