# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ngos = Ngo.limit(4)
    @experiences = Experience.limit(4)
    @referrers = ReferrerInfo.limit(4)
  end
end
