class Company < ActiveRecord::Base
  #Relationships
  belongs_to :main_contact, :class_name => "Contact"
  belongs_to :owner, :class_name => "Contact", :dependent => :destroy
  belongs_to :creator, :polymorphic => true
  belongs_to :changer, :polymorphic => true
  
  has_many :employees, :class_name => "Contact", :dependent => :destroy
  
  #Validations
  validates_presence_of :name, :message => "O nome da empresa é obrigatório"
  validates_length_of :name, :in => 2..100, :message => "O nome de uma empresa precisa ter entre 2 e 100 letras"
  validates_uniqueness_of :name
  validates_presence_of :address, :message => "Você precisa iformar o endereço da empresa"
  validates_as_http_url :home_page, :if => lambda { |rec| rec.home_page}
  validates_each 	:owner, :main_contact,
  								:allow_nil => true do |record, attrib, value|
  									record.errors.add attrib, "precisa ser um empregado existente" unless record.employees.index(value)
									end

end
