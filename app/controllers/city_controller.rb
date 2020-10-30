# frozen_string_literal: true

class CityController < ApplicationController
  def index
    @city = City.all
  end

  def show
   
    @city = City.find(params[:id])
  end
end
