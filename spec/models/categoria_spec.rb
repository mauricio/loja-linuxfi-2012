# encoding: utf-8
require( File.absolute_path( File.join( File.dirname(__FILE__), '..', 'spec_helper' ) ) )

describe Categoria do

  context 'in validations' do

    it 'should validate the presence of nome' do
      should validate_presence_of( :nome )
    end

    context 'com categoria salva no banco' do

      before do
        @categoria = FactoryGirl.create(:categoria)
      end

      it { should validate_uniqueness_of( :nome ) }

    end

  end

end