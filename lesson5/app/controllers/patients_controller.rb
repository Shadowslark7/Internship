class PatientsController < ApplicationController
  def index
    @patient = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params_patient)
    if @patient.save 
      redirect_to @patient
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(params_patient)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

  private
  def params_patient
    params.require(:patient).permit(:first_name,:last_name, :age, :email) 
  end
end
