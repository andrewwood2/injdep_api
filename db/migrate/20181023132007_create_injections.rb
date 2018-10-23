class CreateInjections < ActiveRecord::Migration[5.2]
  def change
    create_table :injections do |t|
      t.string :user_id
      t.json :site
      t.numeric :time
      t.string :medtype

      t.timestamps
    end
  end
end
