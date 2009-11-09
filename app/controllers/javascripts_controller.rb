class JavascriptsController < ApplicationController
  def cities
    @cities = Carmen::city_names(params[:state]) || [] 
  end
end
