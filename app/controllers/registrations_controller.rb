class RegistrationsController <  Devise::RegistrationsController

  def new
    #super

    @user= User.new


  end

  def create

    @user = User.new(user_params)
    if  @user.save
      flash[:notice]="details saved successfully"
      redirect_to users_path(@user)
    else
      render 'new'
    end

  end
  def edit

    end
  private
  def user_params
    params.require(:user).permit( :name, :email,:password,:password_confirmation)
  end

end

