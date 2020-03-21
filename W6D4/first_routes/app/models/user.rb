# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks, dependent: :destroy,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :artwork_shares, dependent: :destroy,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare
    
    has_many :shared_artwork,
        through: :artwork_shares,
        source: :artwork
    
    has_many :comments, dependent: :destroy,
        foreign_key: :user_id,
        class_name: :Comment

    
end
