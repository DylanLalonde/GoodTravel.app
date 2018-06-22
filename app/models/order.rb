# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_cents

end
