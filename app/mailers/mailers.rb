# encoding: utf-8

class Mailers < ActionMailer::Base

  def contact(contact)
    @contact = contact
    mail(to: 'ludovic.turmel@gmail.com', subject: "Vibraction Website contact", from: @contact.email) do |format|
       format.html { render 'mailers/contact' }
    end
  end

end
