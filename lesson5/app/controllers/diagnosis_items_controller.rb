class DiagnosisItemsController < ApplicationController
  def index
    @diagnosis_items = DiagnosisItem.all
  end
  
  def create
    @diagnosis_item = DiagnosisItem.new(diagnosis_item_params)
    if @diagnosis_item.save
      redirect_to diagnosis_item_path(@diagnosis_item)
    else
      render :new
    end
  end

  def show
    @diagnosis_item = DiagnosisItem.find(params[:id])
  end
  
  def new
    @diagnosis_item = DiagnosisItem.new
    @patient = Patient.all
    @physician = Physician.all
  end
  
  def edit
    @diagnosis_item = DiagnosisItem.find(params[:id])
    @patient = Patient.all
    @physician = Physician.all
  end
  
  def update
    @diagnosis_item = DiagnosisItem.find(params[:id])
    if @diagnosis_item.update(params_diagnosis_item)
      redirect_to @diagnosis_item
    else
      render :new
    end
  end
    
  def destroy
    @diagnosis_item = DiagnosisItem.find(params[:id])
    @diagnosis_item.destroy
    redirect_to diagnosis_items_path
  end

  private

  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:content, :physician_id, :patient_id)
  end
end
