class Homevisit < ActiveRecord::Base
  belongs_to :client

  validates :date_of_departure, presence: true #uniqueness: { scope: :client_id }
  validates :date_of_return, presence: true
  validates :client_id, presence: true
end
