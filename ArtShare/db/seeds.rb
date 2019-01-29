# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction {
  User.destroy_all

  user1 = User.create!(username: 'Picasso')
  user2 = User.create!(username: 'Da Vinci')
  user3 = User.create!(username: 'Hokusai')

  Artwork.destroy_all

  art1 = Artwork.create!(title: 'Girl Before a Mirror', img_url: 'https://www.pablopicasso.org/images/paintings/girl-before-a-mirror.jpg', artist_id: user1.id)
  art2 = Artwork.create!(title: 'Mona Lisa', img_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/450px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: user2.id)
  art3 = Artwork.create!(title: 'Great Wave Off Kanagawa', img_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tsunami_by_hokusai_19th_century.jpg/525px-Tsunami_by_hokusai_19th_century.jpg', artist_id: user3.id)

  ArtworkShare.destroy_all

  views1 = ArtworkShare.create!(viewer_id: user1.id, artwork_id: art2.id)
  views2 = ArtworkShare.create!(viewer_id: user2.id, artwork_id: art3.id)
  views3 = ArtworkShare.create!(viewer_id: user3.id, artwork_id: art1.id)
}