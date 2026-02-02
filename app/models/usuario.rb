class Usuario < ActiveRecord::Base
  attr_accessible :email, :senha, :username

  validates :email, presence: true, uniqueness: true
  validates :senha, presence: true
  validates :username, presence: true, uniqueness: true
end