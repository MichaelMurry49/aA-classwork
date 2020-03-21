# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
users = User.create([
    { username: 'Isaac Yoon' }, 
    { username: 'Frodo Baggins' }, 
    { username: 'Joseph Deng' },
    { username: 'Helen Yu' },
    { username: 'Vanessa Chen' }
])

Artwork.destroy_all
artworks = Artwork.create([
    {title: 'This is not a pipe', image_url:'wwww.myart.com', artist_id: users.first.id }, 
    {title: 'Pokemon: Charizard', image_url:'wwww.myart.com', artist_id: users.first.id },
    {title: 'Pokemon: Mewtwo', image_url:'wwww.myart.com', artist_id: users[2].id },
    {title: "Dante's Inferno", image_url:'wwww.myart.com', artist_id: users[2].id },
    {title: "A Heartbreaking Work of Staggering Genius", image_url:'wwww.myart.com', artist_id: users[2].id },
    {title: "Riddles", image_url:'wwww.myart.com', artist_id: users[3].id },
    {title: 'Something else', image_url:'wwww.somethingelse.com', artist_id: users.last.id },
    {title: 'Just another art', image_url:'wwww.justanotherart.com', artist_id: users.last.id }
])

ArtworkShare.destroy_all
artworkshares = ArtworkShare.create([ 
    {artwork_id: artworks.first.id, viewer_id: users[2].id },
    {artwork_id: artworks.first.id, viewer_id: users[3].id },
    {artwork_id: artworks.first.id, viewer_id: users.last.id },
    {artwork_id: artworks.last.id, viewer_id: users[2].id }
])