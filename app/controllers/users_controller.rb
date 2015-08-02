class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change]

  def index
     @user = User.where(nil)
     respond_to do |format|
      format.html
      format.json { render json:  @user }
    end
  end
  def new
    @user = User.new
    respond_to do |format|
      format.html 
      format.json { render json:  @user }
    end 
  end
  def create
    @user_params = params[:user]
    puts 'email ' + @user_params[:email]
    user = User.find_or_create_by!(email: @user_params[:email]) do |user|
        user.password = @user_params[:password]
        user.password_confirmation = @user_params[:password_confirmation]
        user.admin!
    end
    respond_to do |format|
      format.html{ redirect_to users_path, :notice => 'User was created!' }
      format.json { render json:  @user }
    end 
  end 

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-edit-their-account-without-providing-a-password
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
  end
  def add
  end
  def edit
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

     def needs_password?(user, params)
      params[:password].present?
    end
end
