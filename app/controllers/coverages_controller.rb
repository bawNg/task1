class CoveragesController < ApplicationController
  def index
    @coverages = Coverage.all
  end
  
  def show
    @coverage = Coverage.find(params[:id])
  end
  
  def new
    @coverage = Coverage.new
  end
  
  def create
    @coverage = Coverage.new(params[:coverage])
    if @coverage.save
      flash[:notice] = "Successfully created coverage."
      redirect_to @coverage
    else
      render :action => 'new'
    end
  end
  
  def edit
    @coverage = Coverage.find(params[:id])
  end
  
  def update
    @coverage = Coverage.find(params[:id])
    if @coverage.update_attributes(params[:coverage])
      flash[:notice] = "Successfully updated coverage."
      redirect_to @coverage
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @coverage = Coverage.find(params[:id])
    @coverage.destroy
    flash[:notice] = "Successfully destroyed coverage."
    redirect_to coverages_url
  end
end
