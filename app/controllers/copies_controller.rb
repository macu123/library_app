class CopiesController < ApplicationController
  before_action :require_admin
  def index
    @copies = Copy.paginate(:page => params[:page])
  end

  def show
    @copy = Copy.find(params[:id])
  end
end
