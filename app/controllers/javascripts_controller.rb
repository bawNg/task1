class JavascriptsController < ApplicationController
  def cities
    @cities = []
    10.times { |i| @cities += [params["state"] + i.to_s] } unless params["state"] == "Alaska"
  end
end
