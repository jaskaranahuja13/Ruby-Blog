class Post < ApplicationRecord
  acts_as_votable
  has_many :replies , dependent: :destroy

  # validates :title,presence: true,length: {maximum: 5,maximum:50}
  # validates :body , prence:true ,length: {maximum: 5,maximum: 50}
  belongs_to :user
  has_many :comments, dependent: :destroy
end
