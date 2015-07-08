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
        format.html { redirect_to   claim_account_pages_path , notice: 'Account Not Found!' }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end



  def update_email
    respond_to do |format|
      if @email.update(calim_account_params)
        format.html { redirect_to pages_path, notice: 'Email was successfully added.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
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
