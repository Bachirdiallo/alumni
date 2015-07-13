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
      redirect_to claim_index_path
    else
      #display message and redirect_to claim account page
      respond_to do |format|
        format.html { redirect_to   :back , notice: 'Account Not Found!' }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def calim_account_params
    params[:claim]
  end
end
