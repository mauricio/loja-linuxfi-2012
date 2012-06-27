class CriarProdutos < ActiveRecord::Migration
  def up
    create_table :produtos do |t|
      t.string :nome, :null => false
      t.text :descricao
      t.decimal :preco, :precision => 10,
          :scale => 2, :null => false
    end
  end

  def down
    drop_table :produtos
  end
end
