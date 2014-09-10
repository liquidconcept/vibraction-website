class StaticsController < ApplicationController
  def show
    @page = params[:page]
    @page = 'home' if @page.nil?
    @agendas = Agenda.order(:number && :group)
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      flash[:notice] = "Votre message a été envoyé"
      Mailers.contact(@contact).deliver

      @contact = Contact.new
      render "statics/_contact.html.erb"
    else
      flash[:error] = "Erreur ! Compléter le fomulaire"
      render "statics/_contact.html.erb"
    end
  end

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :street, :npa, :city, :email, :phone, :message, :cours, :date)
  end
end
