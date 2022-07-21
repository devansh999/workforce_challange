class OrganisationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :join, :leave]
  before_action :init_organization, only: [:index, :new]

  def index
    @organisations = Organisation.all
  end

  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      redirect_to @organisation, notice: "Successfully created organisation"
    else
      @organisations = Organisation.all
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation, notice: "Successfully updated organisation"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organisation.destroy
    redirect_to root_path, status: :see_other, notice: "Successfully destroyed organisation"
  end

  def join
    current_user.update(organisation_id: params[:id])

    redirect_to root_path, status: :see_other, notice: "Successfully Joined organisation"
  end

  def leave
    current_user.update(organisation_id: nil)
    Shift.where(user_id: current_user.id).delete_all

    redirect_to root_path, status: :see_other, notice: "Successfully Left organisation"
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def set_organization

    @organisation = Organisation.find(params[:id])
  end

  def init_organization
    @organisation = Organisation.new
  end

end
