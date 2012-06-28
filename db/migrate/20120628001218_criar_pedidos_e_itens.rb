class CriarPedidosEItens < ActiveRecord::Migration
  def up
    create_table :pedidos do |t|
      t.string :estado,
          :default => 'carrinho',
          :null => false
      t.timestamps
    end

    create_table :itens do |t|
      t.integer :pedido_id, :null => false
      t.integer :produto_id, :null => false
      t.integer :quantidade, :null => false
      t.timestamps
    end

    add_index :itens, :pedido_id
  end

  def down
    drop_table :pedidos
    drop_table :itens
  end

end
