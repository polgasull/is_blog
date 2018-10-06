class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
