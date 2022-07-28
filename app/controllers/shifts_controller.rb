class ShiftsController < ApplicationController
	def index
    @users = current_user.organisation&.users
    @shifts = Shift.where(user_id: @users&.pluck(:id))
  end

  def create
    user = User.find_by(id: params[:employee_id])
    @shift = Shift.new(shift_params.merge({user_id: user&.id, employee_name: user&.name}))

    if @shift.save
      render json: {
        employee_name: @shift.employee_name,
        start_date: @shift.start.strftime("%m/ %d/ %y"),
        start_time: @shift.start.strftime("%I:%M %p"),
        finish: @shift.finish.strftime("%I:%M %p"),
        break_length: @shift.break_length,
        cost: @shift.cost,
        hours_worked: @shift.hours_worked,
        id: @shift.id
      }
    else
      render json: {message: @shift.errors.full_messages.join("<br>") }, status: :unprocessable_entity
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to @shifts, notice: "Successfully updated shift"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path, status: :see_other, notice: "Successfully destroyed organisation"
  end

  def search
    @shifts = Shift.where(employee_name: params[:employee_name])
  end

  private

  def shift_params
    start_date = params.permit(:start_date)[:start_date]
    start_time = params.permit(:start_time)[:start_time]
    finish = params.permit(:finish)[:finish]
    params.permit(:finish, :break_length).merge({start: start_date + " " + start_time }).merge({finish: start_date + " " + finish })

  end
end
