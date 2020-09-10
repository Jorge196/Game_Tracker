class Games < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name 
      t.string :genre 
      t.integer :year 
    end 
  end
end
