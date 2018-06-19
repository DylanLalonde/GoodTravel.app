# frozen_string_literal: true

class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: [:show]

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @ngo = Ngo.find(@experience.featured_ngo)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
