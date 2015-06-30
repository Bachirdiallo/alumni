class PagesController < ApplicationController
  def index
  end

  def claim_account
    @q = User.ransack(params[:q])
    @results = @q.result
    return @results
  end

def claim_action_result
  @user = claim_account
  if @user.count == 1
    #do somethibg
    redirect_to '/users/password/new'
  else
    #display message and redirect_to claim account page
    respond_to do |format|
      format.html { redirect_to claim_account_path, notice: 'Account Not Found!' }
      format.json { render :show, status: :created, location: @user }
    end
  end
end


  # Never trust parameters from the scary internet, only allow the white list through.
  def calim_account_params
    params.require(:calim_account).permit(:student_id, :id_number)
  end
end
