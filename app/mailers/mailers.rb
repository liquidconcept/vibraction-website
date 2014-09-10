# encoding: utf-8

class Mailers < ActionMailer::Base

  def contact(contact)
    @contact = contact
    mail(to: 'ludovic.turmel@liquid-concept.ch', subject: "Vibraction Website contact", from: @contact.email)
  end

end
