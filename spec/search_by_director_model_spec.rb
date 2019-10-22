require 'rails_helper'

describe Movie, '.search_by_director' do
    it 'finds movies with the same director' do
        movie_1 = Movie.create(:title => "You're Rejected", :director => "Isaac Zhang")
        movie_2 = Movie.create(:title => "No Internship for you", :director => "Isaac Zhang")

        result = movie_1.search_by_director

        expect(result).to include(movie_2)
    end

    it 'does not find movies with different directors' do
        movie_1 = Movie.create(:title => "You're Rejected", :director => "Google")
        movie_2 = Movie.create(:title => "No Internship for you", :director => "Facebook")

        result = movie_1.search_by_director

        expect(result).not_to include(movie_2)
    end
end 