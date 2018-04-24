class LendersController < ApplicationController

  def new
  end

  def create
    @lender = Lender.new lender_params
    if @lender.save
      redirect_to "/lender/new"
    else
      flash[:errors] = @lender.errors.full_messages
      redirect_to "/sessions/new"
    end
  end

  def index
    if session[:lender_id]
      redirect_to current_lender
    else
      redirect_to '/sessions/new'
    end
  end
  
  private
    def lender_params
      params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end