class User < ApplicationRecord

  attr_accessor :password
  has_many :entries, dependent: :destroy, foreign_key: :author_id

  validates :name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
