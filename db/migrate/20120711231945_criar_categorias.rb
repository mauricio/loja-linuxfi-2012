class CriarCategorias < ActiveRecord::Migration

  def up
    create_table :categorias do |t|
      t.string :nome, :null => false
    end

    add_index :categorias, :nome, :unique => true

    add_column :produtos, :categoria_id, :integer

    add_index :produtos, :categoria_id
  end

  def down
    drop_table :categorias
    remove_column :produtos, :categoria_id
  end
end
