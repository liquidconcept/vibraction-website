class ContactParam
  include Singleton

  def self.build(params)
    instance.build(params)
  end

  def build(params)
    params.require(:contact).permit(:firstname, :lastname, :street, :npa, :city, :email, :phone, :message, :cours, :date)
  end
end
