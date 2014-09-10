class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :firstname, :lastname, :street, :npa, :city, :email, :phone, :message, :cours, :date

  # ===============
  # = validations =
  # ===============

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :street
  validates_presence_of :npa
  validates_presence_of :city
  validates_presence_of :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :phone
  validates_presence_of :message

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
