class ClaimController < ApplicationController

  def index
    @user = update_email
  end

  def claim_account
    @q = User.ransack(params[:q])
    @results = @q.result
    return @results
  end

  def update_email
    email = User.where(student_id: params[:q])
    return email.update(:email: claim_account_params)
  end

  def claim_action_result
    @user = claim_account
    if @user.count == 1
      redirect_to claim_index_path
    else
      #display message and redirect_to claim account page
      respond_to do |format|
        format.html { redirect_to   claim_account_pages_path , notice: 'Account Not Found!' }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def claim_account_params
    params[:claim]
  end

end
