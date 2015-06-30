class FindUsersController < ApplicationController
  before_action :set_find_user, only: [:show, :edit, :update, :destroy, :locate_users]

  # GET /find_users
  # GET /find_users.json
  def index
    @users = Graduation.search(params[:q])
    @search_results = @users.result

    if params[:search].present?
      @locations = User.near(current_user.current_sign_in_ip, 50, :order => :distance)
    else
      @locations = User.all
    end
  end

  def locate_users
    if params[:search].present?
      @locations = User.near(current_user.current_sign_in_ip, 50, :order => :distance)
    else
      @locations = User.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_find_user
      @user = Graduation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def find_user_params
      params(:find_user).require(:campu_id_eq, :faculty_id_eq, :programme_id_eq, :batch_id_eq)
    end
end
