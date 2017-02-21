class JsonToDatabase < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.string :name
      t.string :email
      t.datetime :date
      t.string :sha
      t.string :author
      t.string :repo
    end
  end
end