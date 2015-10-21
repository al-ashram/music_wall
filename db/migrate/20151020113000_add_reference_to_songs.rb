class AddReferenceToSongs <ActiveRecord::Migration
  def change
    change_table(:songs) do |t|
      t.references :users
    end
  end
end