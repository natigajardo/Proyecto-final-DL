class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])

      if @user.update(user_params)
        format.html { redirect_to homeadmin_path, notice: 'User was successfully updated.' }
      else
        format.html { redirect_to homeadmin_path, notice: "No se pudo guardar tus datos" }
      end
    end
  end 

  private 

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

end