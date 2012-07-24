class AdicionarLinguaAUsuarios < ActiveRecord::Migration

  def up
    add_column :usuarios,
        :lingua,
        :string,
        :default => 'pt-BR',
        :null => false
  end

  def down
    remove_column :usuarios, :lingua
  end

end