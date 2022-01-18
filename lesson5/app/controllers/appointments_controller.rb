class AppointmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @appointment.save
      redirect_to appointments_path(@appointment)
    else
      render :new
    end
  end

  def new
    @patient = Patient.all
    @physician = Physician.all
  end

  def edit
    @patient = Patient.all
    @physician = Physician.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :new
    end
  end
  
  def destroy
    @appointment.destroy
    redirect_to appointment_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:physician_id, :patient_id, :appointment_date)
  end
end
