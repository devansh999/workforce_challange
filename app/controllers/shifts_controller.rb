class ShiftsController < ApplicationController
	def index
    @users = current_user.organisation.users
    @shifts = Shift.where(user_id: @users.pluck(:id))
  end

  def create

    user = User.find_by(name: shift_params[:employee_name])
    @shift = Shift.new(shift_params.merge({user_id: user&.id}))

    if @shift.save
      render json: {
        employee_name: @shift.employee_name,
        start_date: @shift.start.strftime("%m/ %d/ %y"),
        start_time: @shift.start.strftime("%H:%M"),
        finish: @shift.finish,
        break_length: @shift.break_length,
        cost: @shift.cost,
        hours_worked: @shift.hours_worked
      }
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def shift_params
    params.permit(:employee_name, :finish, :break_length).merge({start: params.permit(:start_date)[:start_date] + " " + params.permit(:start_time)[:start_time]})
  end
end
