class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, uniqueness: true, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(short_url: code)
      ShortenedUrl.random_code
    else
      code
    end
  end

  def self.create_instance(user_object, long_url)
    ShortenedUrl.create!(user_id: user_object.id,
      short_url: ShortenedUrl.random_code, long_url: long_url)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :users
end
