class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def search_by_director
    Movie.where(director: self.director)
  end
  
  def search_by_releaseDate(type)
    if type=="after"
      return Movie.where('release_date > ?', self.release_date)
    else
      return Movie.where('release_date < ?', self.release_date)
    end
  end
end
