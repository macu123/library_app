class CopiesController < ApplicationController
  before_action :require_admin
  def index
    @copies = Copy.all
  end

  def show
    @copy = Copy.find(params[:id])
  end
end
