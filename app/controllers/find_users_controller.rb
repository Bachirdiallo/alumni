class FindUsersController < ApplicationController
  before_action :set_find_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /find_users
  # GET /find_users.json
  @new_place = 0
  def index
      @search_results = User.ransack(params[:q])
      @users = @search_results.result.includes(:graduations)
  end

  def file_content
    @users = User.where(city: params[:city], country: params[:country]).includes(:graduations)

    if current_user.city != params[:city]
      @new_place = 1
      flash.now[:notice] = 'Message sent!'
      redirect_to user_profiles_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_find_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def find_user_params
      params(:find_user).require(:campu_id_eq, :faculty_id_eq, :programme_id_eq, :batch_id_eq)
    end
end
