# frozen_string_literal: true

class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
  attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end


  def create?
    true
  end

end