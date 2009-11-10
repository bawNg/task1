class CoveragePeriodsController < ApplicationController
  def index
    @coverage_periods = CoveragePeriod.all
  end
  
  def show
    @coverage_period = CoveragePeriod.find(params[:id])
  end
  
  def new
    @coverage_period = CoveragePeriod.new
  end
  
  def create
    @coverage_period = CoveragePeriod.new(params[:coverage_period])
    if @coverage_period.save
      flash[:notice] = "Successfully created coverage period."
      redirect_to @coverage_period
    else
      render :action => 'new'
    end
  end
  
  def edit
    @coverage_period = CoveragePeriod.find(params[:id])
  end
  
  def update
    @coverage_period = CoveragePeriod.find(params[:id])
    if @coverage_period.update_attributes(params[:coverage_period])
      flash[:notice] = "Successfully updated coverage period."
      redirect_to @coverage_period
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @coverage_period = CoveragePeriod.find(params[:id])
    @coverage_period.destroy
    flash[:notice] = "Successfully destroyed coverage period."
    redirect_to coverage_periods_url
  end
end
