require 'rails_helper'


describe MoviesController, type: :controller do
    context 'when movie has director' do
        it 'renders same director page' do
            movie_1 = Movie.create(:title => "Kya Hai ye", :director => "Harshul")
            movie_2 = Movie.create(:title => "Kuch Bhi", :director => "Harshul")
            get :searchByDirector, :id => movie_1
            expect(response).to render_template("searchByDirector")
            get :searchByDirector, :id => movie_2
            expect(response).to render_template("searchByDirector")
            assigns(:movies).should eq([movie_1, movie_2])
        end
    end

    context 'when movie has no director' do
        it 'renders index page' do
            movie_1 = Movie.create(:title => "I want to go back")
            get :searchByDirector, :id => movie_1
            expect(response).to redirect_to(root_path)
            expect(flash[:notice]).to eq("\'I want to go back\' has no director info")
        end
    end
end 