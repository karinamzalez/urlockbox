class AddReadToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :read, :string, :default => false
  end
end
