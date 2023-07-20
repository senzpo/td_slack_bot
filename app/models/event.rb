# frozen_string_literal: true

class Event < ApplicationRecord
  enum entity: { gitlab: 'gitlab', bitbucket: 'bitbucket' }
  validates :entity_id, presence: true
  validates :entity, presence: true
  validates :status, presence: true
  validates :created_at, presence: true
end
