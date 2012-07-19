class CriarUsuarios < ActiveRecord::Migration

  def up
    create_table :usuarios do |t|
      t.string :email, :null => false
      t.boolean :administrador, :default => false, :null => false
      t.string :nome, :null => false
      t.string :salt, :null => false
      t.string :senha_em_hash, :null => false
      t.datetime :ultimo_acesso_em
      t.timestamps
    end

    add_index :usuarios, :email, :unique => true
    add_index :usuarios, :ultimo_acesso_em

    add_column :pedidos, :usuario_id, :integer, :null => true
    add_index :pedidos, :usuario_id
  end

  def down
    drop_table :usuarios
    remove_column :pedidos, :usuario_id
  end

end