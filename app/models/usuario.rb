class Usuario < ActiveRecord::Base

  GENERATOR = UUID.new

  attr_accessor :senha, :termos_e_condicoes

  validates_presence_of :nome

  validates :email, :presence => true, :uniqueness => true
  validates :senha,
      :confirmation => true,
      :length => { :within => 4..40 },
      :if => :senha_necessaria?

  validates_acceptance_of :termos_e_condicoes, :if => :new_record?

  validates_presence_of :senha_em_hash, :if => :senha_necessaria?

  attr_accessible :nome,
      :email,
      :senha,
      :senha_confirmation,
      :termos_e_condicoes

  before_validation :hashear_senha

  def senha_necessaria?
    self.senha_em_hash.blank? || !self.senha.blank?
  end

  def senha_correta?( _senha )
    self.senha_em_hash == Usuario.hashear( _senha, self.salt )
  end

  def self.hashear( senha, salt )
    Digest::SHA1.hexdigest( "#{senha}-%$\#@-#{salt}" )
  end

  def self.autenticar( email, senha )
    usuario = Usuario.where( :email => email ).first
    usuario if usuario && usuario.senha_correta?( senha )
  end

  protected

  def hashear_senha
    return true if self.senha.blank?
    if self.new_record?
      self.salt =
          Digest::SHA1.hexdigest("--#{GENERATOR.generate}--#{self.email}--#{self.nome}")
    end
    self.senha_em_hash = Usuario.hashear(self.senha, self.salt)
  end

end