class StaticController < ApplicationController
  def show
    @page = params[:static]
    render @page
  end
end