class SessionsController < ApplicationController
  
  def new
  end

  def lender_login
    @lender = lender.find_by_email(params[:email])
    if @lender && @lender.authenticate(params[:password])
      redirect_to "/lenders/index#{@lender.id}"
    else 
      flash[:errors] = ["Invalid Email/ Password Combination"]
      redirect_to "/lenders"
    end
  end

  def borrower_login
    @borrower = borrower.find_by_email(params[:email])
    if @borrower && @borrower.authenticate(params[:password])
      redirect_to "/borrower/#{@borrower.id}"
    else 
      flash[:errors] = ["Invalid Email/ Password Combination"]
      redirect_to "/borrowers"
    end
  end

  def destroy
    reset_session
    redirect_to "/sessions/new"
  end
end
