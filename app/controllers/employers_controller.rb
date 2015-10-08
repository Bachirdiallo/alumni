class EmployersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:show, :edit, :update, :destroy, :search]

  # GET /employers
  # GET /employers.json
  def index
    @user = User.new
  end

  def search
    @search = Graduation.ransack(params[:q])
    @users = @search.result(:distinct => true).includes(:user).where("users.is_job_seeker is  true").references(:users).paginate(:page => params[:page], :per_page => 5)
  end
  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @user = User.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers
  # POST /employers.json
  def create
    @user = User.new(user_params)
    @user.is_employer = true
    @user.is_graduate = false
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to  employers_path, notice: 'Your account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @user.update(employer_params)
        format.html { redirect_to @user, notice: 'Employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to employers_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :student_id, :email, :password, :password_confirmation, :avatar)
    end
end
