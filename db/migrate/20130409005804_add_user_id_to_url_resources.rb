class AddUserIdToUrlResources < ActiveRecord::Migration
  def change
    add_column :url_resources, :user_id, :integer
  end
end
