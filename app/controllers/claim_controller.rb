class ClaimController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy, :change, :add]

  def index
  end

  def claim_account
    @q = User.ransack(params[:q])
    @results = @q.result
  end

  def change
    @user = User.where(student_id: params[:q][:student_id_eq]).first

    if @user.nil?
      #display message and redirect_to claim account page
      respond_to do |format|
        format.html { redirect_to   :back , notice: 'Account Not Found!' }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end

def edit
end

def add
end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      puts '@user = ', params[:id]
      if @user.update(claim_account_params)
        format.html { redirect_to claim_account_claim_index_url, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @user = User.where(id: params[:id]).first
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def claim_account_params
    params.require(:user).permit(:user_id, :email)
  end
end
