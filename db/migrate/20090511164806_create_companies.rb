class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :home_page
      t.belongs_to :main_contact
      t.belongs_to :owner

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
