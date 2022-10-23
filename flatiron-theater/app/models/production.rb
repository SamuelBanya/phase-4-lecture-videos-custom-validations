class Production < ApplicationRecord
    has_many :crew_members

    validates :title, presence: true

    # Custom Validations:
    # NOTE: In order to use custom validations, you have to use the
    # singular 'validate' attribute:
    validate :no_more_musicals

    def no_more_musicals
        if genre.downcase == "musical"
            errors.add(:genre, "Sorry no more musicals!")
        end
    end

    def title_director
        "#{title}: #{director}"
    end
end
