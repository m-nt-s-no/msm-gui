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

  def update
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)
    @the_movie.title = params.fetch("title")
    @the_movie.year = params.fetch("year")
    @the_movie.duration = params.fetch("duration")
    @the_movie.description = params.fetch("description")
    @the_movie.image = params.fetch("image")
    @the_movie.director_id = params.fetch("director_id")
    @the_movie.updated_at = Time.current
    @the_movie.save
    redirect_to("/movies/#{@the_movie.id}")
  end

  def delete
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end
end
