# frozen_string_literal: true

class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: [:show]

  def index
    if params[:query].present?
      @experiences = Experience.search_by_name_and_description_and_category("%#{params[:query]}%")
    else
      @experiences = Experience.all
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
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end


  def show
    @experience = Experience.find(params[:id])
    @ngo = Ngo.find(@experience.featured_ngo)
    @markers = [ { lat: @experience.latitude, lng: @experience.longitude } ]
    @review = Review.new
  end

private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
