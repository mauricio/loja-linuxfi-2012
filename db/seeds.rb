# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Usuario.create!(
  :nome => 'José',
  :email => 'jose@mail.com',
  :senha => '123456',
  :senha_confirmation => '123456',
  :termos_e_condicoes => '1'
)

admin = Usuario.new(
  :nome => 'Admin',
  :email => 'admin@mail.com',
  :senha => '123456',
  :senha_confirmation => '123456',
  :termos_e_condicoes => '1'
)
admin.administrador = true
admin.save!

dvds = Categoria.create( :nome => 'DVDs')
livros = Categoria.create( :nome => 'Livros' )
carros = Categoria.create( :nome => 'Carros' )

Produto.create( [ {
    :nome => 'Senhor dos Anéis: Retorno do Rei',
    :descricao => 'Filme',
    :preco => 90,
    :categoria_id => dvds.id
  },
  {
    :nome => 'Na estrada',
    :descricao => 'Livro desse',
    :preco => 40,
    :categoria_id => livros.id
  },
  {
    :nome => 'Fusca',
    :descricao => 'Da Volkswagen',
    :preco => 1000,
    :categoria_id => carros.id
  } ] )