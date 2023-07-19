class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :bookmarks?

  private

  def bookmarks?
    return unless bookmarks.any?

    raise ActiveRecord::InvalidForeignKey
  end
end

# raise ActiveRecord::RecordNotDestroyed, "Cannot delete movie with associated bookmarks"
