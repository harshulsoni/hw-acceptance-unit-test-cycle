require 'rails_helper'


describe MoviesController, type: :controller do
    context 'Root Path is called' do
        it 'renders home page' do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    context 'when show is called' do
        it 'renders movie data' do
            movie_1 = Movie.create(:title => "Kya Hai ye", :director => "Harshul")
            get :show, :id => movie_1
            expect(response).to render_template("show")
        end
    end
    
    context 'Sort is called' do
        it 'renders home page with sorting' do
            get :index, params: { :sort => 'release_date' }
            expect(response).to render_template("index")
        end
    end
    
    context 'Create Movie and the destroy' do
        it 'renders delete message' do
            movie_1 = Movie.create(:title => "Kya Hai ye", :director => "Harshul")
            get :destroy, :id => movie_1
            expect(response).to redirect_to(movies_path)
            expect(flash[:notice]).to eq("Movie \'Kya Hai ye\' deleted.")
        end
    end
    
    context 'Find movies before release date' do
        it 'renders searchByReleasedDate' do
            movie_1 = Movie.create(:title => "Kya Hai ye", :director => "Harshul", :release_date => "1968-04-06 00:00:00 UTC")
            get :searchByReleasedDate, :id => movie_1, :type => "before"
            expect(response).to render_template("searchByReleasedDate")
        end
    end

    context 'Released Date on home clicked' do
        it 'renders index' do
            movie_1 = Movie.create(:title => "Kya Hai ye", :director => "Harshul", :release_date => "1968-04-06 00:00:00 UTC")
            get :searchByReleasedDate, :id => movie_1, :type => "before"
            expect(response).to render_template("searchByReleasedDate")
        end
    end
    
    context 'Released Date on home clicked' do
        it 'should hilite release date header' do
          get :index, { sort: 'release_date'}
          expect(assigns(:date_header)).to eql('hilite')
        end
    end
    
    context "Released Date on home clicked" do
        it "sorts by title" do
            get :index, sort: "title"
        end
    end
end 