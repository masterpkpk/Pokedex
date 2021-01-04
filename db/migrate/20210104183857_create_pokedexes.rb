class CreatePokedexes < ActiveRecord::Migration
  def change
    create_table :pokedexes do |t|

      t.timestamps null: false
    end
  end
end
