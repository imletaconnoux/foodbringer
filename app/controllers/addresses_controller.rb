class AddressesController < ApplicationController

  def new

    @address = Address.new
  end

  def create

  end


  def edit
    @address = Address.find(params[:id])

  end

  def updated
  

  end

end
