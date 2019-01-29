# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :img_url, presence: true
  validates :title, uniqueness: {scope: :artist_id, message: "Author can't use the same name twice"}
  belongs_to :artist, foreign_key: :artist_id, class_name: :User, dependent: :destroy
  has_many :artwork_shares
  has_many :shared_viewers, through: :artwork_shares, source: :viewer
end
