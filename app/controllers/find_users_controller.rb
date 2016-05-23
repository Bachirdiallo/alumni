class FindUsersController < ApplicationController
  before_action :set_find_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /find_users
  # GET /find_users.json

  def index
     @search_results = User.ransack(params[:f])
     @users = @search_results.result

     if !params[:f].nil?
       current_city = params[:f][:current_city]
       if current_city == "1"
         @users = @search_results.result.where(city: params[:city], country: params[:country])
         puts '#####',@users.count
       else
         @query = User.ransack(graduations_faculty_id_eq: params[:f][:faculty], graduations_batch_id_eq: params[:f][:batch],
         graduations_programme_id_eq: params[:f][:programme], graduations_campu_id_eq: params[:f][:campus])
         @users = @query.result
         puts '#####',@users.count
       end
     end

     respond_to do |format|
       format.html
       format.js
     end
   end

  def map_view
  end

  def geo_locate
    @search_results = User.ransack(params[:q])
    #@user = @search_results.result
  #    is_current_city = params[:q][:is_current_city]
    @users = @search_results.result
    puts '####', @users.count
    if !params[:country].nil?
      puts 'NILiiiiiiiiiiiiiiiiiiii'
    else
      respond_to do |format|
        format.html{@users}
        format.js{
          #is_current_city = params[:q][:is_current_city]
          @users = User.where(city: params[:city], country: params[:country])}
          render {@users}
      end
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
