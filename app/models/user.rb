class User < ApplicationRecord
  has_many :results

  has_many :tests, through: :results

  def info_passing_test(level)
    Test.joins(:results)
    .where("results.user_id = #{ self.id } and tests.level = #{ level }")
  end
end
