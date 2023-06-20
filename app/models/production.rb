class Production < ApplicationRecord
    has_many :crew_members
    validates :title, presence: true
    validate :no_more_musicals
  
    def no_more_musicals
      if genre.downcase == "musical"
        errors.add(:genre, "Sorry, don't add more musicals")
      end
    end
  
    def title_director
      "#{title}: #{director}"
    end
  end
  