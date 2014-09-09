# encoding: utf-8
require 'csv'

class AdminsController < ApplicationController
  before_filter :authenticate_user!

  layout 'admin'

  def show
  end

  def import
    Agenda.import(params[:file])
    redirect_to admin_path, notice: "Agenda mise à jour"
  end
end
