class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :results
  has_many :users, through: :results

  has_many :questions, dependent: :destroy

  def self.titles_by_category(category)
    Test.joins(:category)
    .where(categories: { title: category })
    .order(title: :desc).pluck(:title)
  end

end
