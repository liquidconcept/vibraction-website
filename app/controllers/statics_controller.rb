class StaticsController < ApplicationController
  def show
    @page = params[:page]
    @page = 'home' if @page.nil?
  end
end
