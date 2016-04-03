class AddCannotBeSharedToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :cannot_be_shared, :boolean,:default => false
  end
end
