class Visit < ActiveRecord::Base

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, short_url_id: shortened_url.id)
  end

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl
end
