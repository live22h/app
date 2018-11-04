class UserMessage < ApplicationRecord
  belongs_to :mail_theme
  belongs_to :branch
end
