class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    new_movie = Movie.create(title: params.fetch("title"), year: params.fetch("year"), duration: params.fetch("duration"), description: params.fetch("description"), image: params.fetch("image"), director_id: params.fetch("director_id"))
    redirect_to("/movies")
  end
end
