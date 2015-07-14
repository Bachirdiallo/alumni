class ClaimController < ApplicationController


  student_id = User.new

  def index
    #@users =  User.find(student_id)
  end

  def update_email(id)
    @users = User.find(id)
  end

  def claim_account
    @q = User.ransack(params[:q])
    @results = @q.result

    student_id = @results.map{|x| x.id}
    puts "the id", student_id
    update_email(@student_id)
    puts "the id", @id
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


  # Never trust parameters from the scary internet, only allow the white list through.
  def claim_account_params
    params[:claim]
  end

end
