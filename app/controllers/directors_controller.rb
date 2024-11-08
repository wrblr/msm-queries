class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest
    @ordered_list_desc = Director.where.not({ :dob => nil }).order({ :dob => :desc })
    @youngest_dir = @ordered_list_desc.at(0)
    @youngest_dir_bday = @youngest_dir.dob.strftime("%B %e, %Y")

    render({ :template => "director_templates/youngest"})
  end
  
  def eldest
    @ordered_list_asc = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @oldest_dir = @ordered_list_asc.at(0)
    @oldest_dir_bday = @oldest_dir.dob.strftime("%B %e, %Y")

    render({ :template => "director_templates/oldest"})
  end

end
