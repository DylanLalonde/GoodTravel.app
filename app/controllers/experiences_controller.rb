# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def index
    @experience = Experience.all
  end
end
