class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointmant.new(appointments_params)
    if @appointment.save
      redirect_to appointments_path(@appointment)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @patient = Patient.all
    @physician = Physician.all
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @patient = Patient.all
    @physician = Physician.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(params_appointment)
      redirect_to @appointments
    else
      render :new
    end
  end
  
  def destroy
    @appointment = Appointments.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointments_params
    params.require(:appointment).permit(:physician_id, :patient_id, :appointment_date)
  end
end
