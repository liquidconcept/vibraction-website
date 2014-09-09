# encoding: utf-8
require 'csv'

class AdminsController < ApplicationController
  before_filter :authenticate_user!

  layout 'admin'

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end
