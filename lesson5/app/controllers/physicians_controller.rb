class PhysiciansController < ApplicationController
  def index
    @physician = Physician.all
  end
    
  def show
    @physician = Physician.find(params[:id])
  end
  
  def new
    @physician = Physician.new
  end
  
  def create
    @physician = Physician.new(params_physician)
    if @physician.save
      redirect_to @physician
    else
      render :new
    end
  end
  
  def edit
    @physician = Physician.find(params[:id])
  end
  
  def update
    @physician = Physician.find(params[:id])
    if @physician.update(params_physician)
      redirect_to @physician
    else
      render :edit
    end
  end
  
  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy
    redirect_to physicians_path
  end
   
  private
  def params_physician
    params.require(:physician).permit(:first_name, :last_name, :phone_number, :level) 
  end
end
