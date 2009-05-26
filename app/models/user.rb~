require 'digest/sha1'
class User < ActiveRecord::Base
	before_save :update_password
	attr_protected :crypted_password, :login
	
	#Associations
	has_many :create_contacts, :class_name => 'Contact' :as => :creator
	has_many :updated_contacts, :class_name => 'Contact' :as => :changer

	has_many :create_events, :class_name => 'Event' :as => :creator
	has_many :updated_events, :class_name => 'Event' :as => :changer

	has_many :create_company, :class_name => 'Company' :as => :creator
	has_many :updated_company, :class_name => 'Company' :as => :changer
	
	#Validations
	validates_as_email :email, :allow_nil => true
	validates_presence_of :name, :email, :login
	validates_length_of :login, :whitin => 3..50
	validates_length_of :password, :whitin => 3..50
	validates_confirmations_of :password
	validates_uniqueness_of :login, :email
	
	#Logic
	@@current_user = nil
	def self.current_user
		@@current_user
	end
	
	def self.current_user=(value)
		@@current_user = value
	end
	
	@password = nil
	attr_accessor :password
	def self.logon(username, password)
		finf_by_login_and_crypted_password(username, Digest::SHA1.hexdigest(password))
	end
	
private
	def update_password
		write_attritute(:crypted_password, Digest::SHA1,hexgest(@password)) unless @password.nil?
	end
end
