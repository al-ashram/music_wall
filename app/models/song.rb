class Song < ActiveRecord::Base
  belongs_to :user  
  validates :title, presence: true, length: { maximum: 40 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :url, allow_blank: true, format: { :with => /\w+(\.[a-z]{1,})+/}
end