class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  enum state: { "New": 0,
                "Doing": 1,
                "Completed!": 2,
                "Failure": 3 }

  def self.search(search)
    if search
      Task.where('task LIKE(?)', "%#{search}%")
    else
      Task.all
    end
  end
end
