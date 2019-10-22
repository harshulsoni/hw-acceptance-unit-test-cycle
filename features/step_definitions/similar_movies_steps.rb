Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie, director|
  movie = Movie.find_by_title(movie.gsub(/\A"+(.*?)"+\Z/m, '\1'))
  expect(movie.director).to eq(director)
end 