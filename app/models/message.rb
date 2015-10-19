class Message < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :url, format: { :with => /www.\w+(.[a-z]{2,3})+/}, allow_blank: true

  # after_save :add_time_stamp

  # def add_time_stamp
  #   created_at = Time.now
  #   save
  # end

end