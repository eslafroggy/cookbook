class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :instruction

      t.timestamps
    end
  end
end
