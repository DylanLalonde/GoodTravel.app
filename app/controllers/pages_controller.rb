# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
    @ngos = Ngo.all
    @experiences = Experience.limit(4)
    @referrers = ReferrerInfo.limit(4)
    @current_page = "home"
  end
end
