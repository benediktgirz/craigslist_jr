class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.belongs_to :post
      t.belongs_to :category
      t.timestamps
    end
  end
end
