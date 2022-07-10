class ShiftsController < ApplicationController
	def index
    @shifts = Shift.all
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shifts, notice: "Successfully created organisation"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def shift_params
    params.require(:shift).permit(:employee_name, :start, :finish, :break_length)
  end
end
