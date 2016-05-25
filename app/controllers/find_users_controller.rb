class FindUsersController < ApplicationController
  before_action :set_find_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /find_users
  # GET /find_users.json

  def index
     @search_results = User.ransack(params[:f])

     if !params[:f].nil?
       current_city = params[:f][:current_city]
       @query = User.ransack(graduations_faculty_id_eq: params[:f][:faculty], graduations_batch_id_eq: params[:f][:batch],
       graduations_programme_id_eq: params[:f][:programme], graduations_campu_id_eq: params[:f][:campus])
       if current_city == "1"
         @users = @query.result.where(city: params[:city], country: params[:country])
       else
         @users = @query.result
       end
     end

     respond_to do |format|
       format.html
       format.js
     end
   end

  def map_view
    @users = User.where(city: params[:city], country: params[:country])
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
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
