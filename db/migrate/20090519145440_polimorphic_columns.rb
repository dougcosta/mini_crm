class PolimorphicColumns < ActiveRecord::Migration
  def self.up
  	change_table :companies do |t|
			t.string :creator_type
			t.string :changer_type
  	end
  	
  	change_table :contacts do |t|
			t.string :creator_type
			t.string :changer_type
  	end

  	change_table :events do |t|
			t.string :creator_type
			t.string :changer_type
  	end

  end

  def self.down
  	change_table :companies do |t|
			t.remove :creator_type
			t.remove :changer_type
  	end
  	
  	change_table :contacts do |t|
			t.remove :creator_type
			t.remove :changer_type
  	end
  	
  	change_table :events do |t|
			t.remove :creator_type
			t.remove :changer_type
  	end
  end
end
