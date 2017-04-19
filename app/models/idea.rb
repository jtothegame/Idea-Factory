class Idea < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  before_validation :capitalize_title

  private

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

end
