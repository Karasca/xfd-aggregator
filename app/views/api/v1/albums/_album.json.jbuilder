json.id album.id
json.name album.name
json.genres album.genres, :name
json.image album.folder.url
json.events album.events, :name, :date, :location
json.circle album.circle.name
json.crossfades album.crossfades, :link
