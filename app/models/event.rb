class Event < ActiveRecord::Base
  #Relationships
  belongs_to :contact
  belongs_to :company
  belongs_to :creator, :polymorphic => true
  belongs_to :changer, :polymorphic => true
  
  #Validations
  validates_presence_of :title, :description
  
  #names scopes
  named_scope :latest, :order => "created_at desc", :conditions => {}
  named_scope :by_contact, lambda { |contact|
  	{ :conditions => ["contact_id = ?", contact.id]}
  }
  named_scope :by_company_except_contat, lambda { |company, contact|
  	{ :conditions => ["company_id = ? and contact_id != ?", company.id, contact.id]}
  }
end
