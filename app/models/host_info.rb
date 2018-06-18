class HostInfo < ApplicationRecord
  belongs_to :user
  has_many :experiences
end
