class Client < ActiveRecord::Base
  has_many :homevisits

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
