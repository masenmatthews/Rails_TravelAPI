class Destination < ApplicationRecord
  validates :country, :region, :city, :presence => true
  def self.search(country)
    matches = []
    Destination.all.each do |single_record|
      if single_record.country == country
        matches.push(single_record)
      end
    end
      return matches
  end
end
