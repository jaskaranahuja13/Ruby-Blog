class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :comment
  belongs_to :user
end
