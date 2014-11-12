class Ticket < ActiveRecord::Base
  validates :title, presence: :true
  validates :description, presence: true, length: { minimum: 10, message: "Description must be longer than 10 characters." }
  belongs_to :project
  belongs_to :user
end
