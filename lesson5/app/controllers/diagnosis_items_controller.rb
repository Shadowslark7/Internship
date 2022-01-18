class DiagnosisItemsController < ApplicationController
  load_and_authorize_resource
  
  def create
    if @diagnosis_item.save
      redirect_to diagnosis_item_path(@diagnosis_item)
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
    if @diagnosis_item.update(diagnosis_item_params)
      redirect_to @diagnosis_item
    else
      render :new
    end
  end
    
  def destroy
    @diagnosis_item.destroy
    redirect_to diagnosis_items_path
  end

  private
  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:content, :physician_id, :patient_id)
  end
end
