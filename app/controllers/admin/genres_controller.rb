 class Admin::GenresController < ApplicationController

  def index
    @genre_new = AdminGenre.new
    @genres = AdminGenre.all
  end

  def create
    @genre_new = AdminGenre.new(admin_genre_params)
    if @genre_new.save
      redirect_to admin_genres_path
    else
      @genres = AdminGenre.all
      render :index
    end
  end

  def destroy
    @genre = AdminGenre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

private
 def admin_genre_params
   params.require(:admin_genre).permit(:name)
 end
 end