class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :first_word, presence: true
  validates :second_word, presence: true
  validates :comparison_word, presence: true
  validates :sentence_type, presence: true
  validates :category, presence: true
  validate :check_sentence_type
  validate :check_category

  SENTENCE_TYPE = { 1 => 'General verb', 2 => 'Be verb' }
  CATEGORY = { 1 => 'Person', 2 => 'Politics', 3 => 'Sport',
               4 => 'Technology', 5 => 'Interest', 6 => 'Funny',
               7 => 'Anime', 8 => 'Game', 9 => 'Adult', 10 => 'Other' }

  private
    def check_sentence_type
      unless SENTENCE_TYPE.has_key? sentence_type
        errors.add(:sentence_type, 'Invalid')
      end
    end

    def check_category
      unless CATEGORY.has_key? category
        errors.add(:category, 'Invalid')
      end
    end
end
