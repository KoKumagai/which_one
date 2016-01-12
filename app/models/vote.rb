class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  validates :vote_type, presence: true
  validate :votable
  validate :check_number

  private
    def votable
      unless user && user.votable_for?(survey)
        errors.add(:base)
      end
    end

    def check_number
      unless vote_type == 1 || vote_type == 2
        errors.add(:vote_type)
      end
    end
end
