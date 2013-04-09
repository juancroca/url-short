class CreateUrlResources < ActiveRecord::Migration
  def change
    create_table :url_resources do |t|
      t.string :url_string
      t.text   :browsers
      t.string :token
      t.timestamps
    end
    add_index :url_resources, :token, :unique => true
  end
end
