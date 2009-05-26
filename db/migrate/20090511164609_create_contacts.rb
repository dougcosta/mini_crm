class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.date :since
      t.string :email
      t.string :email1
      t.string :email2
      t.string :home_page
      t.text :description
      t.string :address
      t.string :address2
      t.belongs_to :company

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
