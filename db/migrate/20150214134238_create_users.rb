class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, :null => false
      t.string :provider, :null => false
      t.string :name
      t.string :email
      t.string :place
      t.string :picture
      t.string :link
      t.text :interests
      t.text :languages
      t.boolean :active_local
      t.string :day0
      t.string :day1
      t.string :day2
      t.string :day3
      t.string :day4
      t.string :day5
      t.string :day6
      t.string :day7
      t.timestamps
    end
  end
end
