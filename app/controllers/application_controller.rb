class ApplicationController < ActionController::Base
	def index
    @shifts = Shift.all
  end
end
