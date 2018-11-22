class Branchadmin < ApplicationRecord
  belongs_to :branch
  belongs_to :user
end
