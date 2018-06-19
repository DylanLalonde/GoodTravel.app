# frozen_string_literal: true

class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end
end
