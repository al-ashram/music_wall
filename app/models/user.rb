class User < ActiveRecord::Base
  has_many :songs
  validates :first_name, presence: true, length: { maximum: 20}
  validates :last_name, presence: true, length: { maximum: 20}
  validates :password, presence: true, length: { maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { :with=> /\b\w+@{1}\w+(\.[a-z]{2,3})+\b/}
end