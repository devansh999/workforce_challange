class ShiftsController < ApplicationController
	def index
    @shifts = Shift.all
  end

  def create
    
    user = User.find_by(name: shift_params[:employee_name])
    @shift = Shift.new(shift_params.merge({user_id: user&.id}))

    if @shift.save
      redirect_to @shifts, notice: "Successfully created organisation"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def shift_params
    params.permit(:employee_name, :finish, :break_length).merge({start: params.permit(:start_date)[:start_date] + " " + params.permit(:start_time)[:start_time]})
  end
end
