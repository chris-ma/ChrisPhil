class AddUidToYoutubes < ActiveRecord::Migration
  def change
    add_column :youtubes, :uid, :string
    add_index :youtubes, :uid
  end
end
