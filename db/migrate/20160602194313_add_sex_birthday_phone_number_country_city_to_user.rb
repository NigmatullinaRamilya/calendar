class AddSexBirthdayPhoneNumberCountryCityToUser < ActiveRecord::Migration
  def change
  	add_column :users, :sex, :string
  	add_column :users, :birthday, :datetime
  	add_column :users, :phone_number, :string
  	add_column :users, :country, :string
  	add_column :users, :city, :string
  end
end
