class CopiesController < ApplicationController
  def index
    @copies = Copy.all
  end

  def show
    @copy = Copy.find(params[:id])
  end
end
