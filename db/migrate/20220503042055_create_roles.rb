class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string "movie_role"
      t.integer "movie_id"
      t.integer "actor_id"

      t.timestamps
    end
  end
end
