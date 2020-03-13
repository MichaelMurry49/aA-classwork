class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, presence: true, uniqueness: true
  
  def self.random_code
    short_url = SecureRandom.urlsafe_base64(long_url)
  end
end