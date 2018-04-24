class BorrowersController < ApplicationController
    
    def create
        @borrower = Borrower.new borrower_params
        if @borrower.save
        else
          flash[:errors] = @borrower.errors.full_messages
        end
        redirect_to "/borrower/new"
      end

  def index
    if session[:borrower_id]
      redirect_to current_borrower
    else
      redirect_to '/sessions/new'
    end
  end
  
  private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end