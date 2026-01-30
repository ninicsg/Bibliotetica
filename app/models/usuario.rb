class Usuario < ActiveRecord::Base
  attr_accessible :email, :senha

  validates :email, presence: true, uniqueness: true
  validates :senha, presence: true
end