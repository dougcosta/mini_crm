class Security < ActiveRecord::Migration
  def self.up
  	change_table :users do |t|
  		t.remove :password
  		t.string :crypted_password, :limit => 40
  	end
  	change_table :companies do |t|
  		t.belongs_to :creator
  		t.belongs_to :changer
  	end
  	change_table :contacts do |t|
  		t.belongs_to :creator
  		t.belongs_to :changer
  	end
  	change_table :events do |t|
  		t.belongs_to :creator
  		t.belongs_to :changer
  	end
  end

  def self.down
	  change_table :users do |t|
  		t.string :password
  		t.remove :crypted_password
  	end
  	change_table :companies do |t|
  		t.remove_belongs_to :creator
  		t.remove_belongs_to :changer
  	end
  	change_table :contacts do |t|
  		t.remove_belongs_to :creator
  		t.remove_belongs_to :changer
  	end
  	change_table :events do |t|
  		t.remove_belongs_to :creator
  		t.remove_belongs_to :changer
  	end
  end
end
