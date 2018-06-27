# frozen_string_literal: true

class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: [:show]

  def index
    if params[:query].present?
      @experience = policy_scope(Experience).order(created_at: :desc)
      @experiences = Experience.search_by_name_and_description_and_category("%#{params[:query]}%")
    else
      @experiences = policy_scope(Experience).order(created_at: :desc)
      @experiences = Experience.where.not(latitude: nil, longitude: nil)

      # Map stuff:
      @markers = @experiences.map do |experience|
        {
          lat: experience.latitude,
          lng: experience.longitude,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end
  end

  def new
    @locations = Location.all
    @experience = Experience.new

    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params.except("location"))
    @experience.host_info = HostInfo.last
    @experience.location = Location.find_by_id(experience_params["location"].to_i)

    authorize @experience
    if @experience.save!
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end


  def show
    @ngos = Ngo.all
    @experience = Experience.find(params[:id])
    # @ngo = Ngo.find(@experience.featured_ngo)
    @markers = [ { lat: @experience.latitude, lng: @experience.longitude } ]
    @review = Review.new
  end

private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def experience_params
    params.require(:experience).permit(:name, :category, :smdescription, :lgdescription, :location, :price, :photo)
    end
end
