# frozen_string_literal: true

class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: [:show]

  def index
    @experiences = Experience.all
    @experiences = Experience.where.not(latitude: nil, longitude: nil)

    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @ngo = Ngo.find(@experience.featured_ngo)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
