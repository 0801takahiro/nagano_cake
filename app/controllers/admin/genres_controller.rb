class Admin::GenresController < ApplicationController
    def index
        @genre = Genre.new
        @genres = Genre.all
    end
    
    def create
        @genres = Genre.all
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to admin_genres_path
    end
    
    def edit
        @genres = Genre.all
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
           redirect_to admin_genre_path(@genre.id)
        else
           render :edit
        end
    end
    
    
    
end
