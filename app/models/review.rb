class Review < ApplicationRecord
  validates :text_body, :presence => true
  belongs_to :destination
end
