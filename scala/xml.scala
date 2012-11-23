val movies =
  <movies>
    <movie genre="action">Pirates of the Caribbean</movie>
    <movie genre="fairytale">Edward Scissorhands</movie>
  </movies>

println(movies.text)

val movieNodes = movies \ "movie"
println(movieNodes(0))

val genre = movieNodes(0) \ "@genre"
println(genre)
