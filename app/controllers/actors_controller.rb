class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    new_actor = Actor.create(name: params.fetch("name"), dob: params.fetch("dob"), bio: params.fetch("bio"), image: params.fetch("image"), created_at: Time.current)
    redirect_to("/actors")
  end
end
