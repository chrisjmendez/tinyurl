class Visit < ApplicationRecord
  belongs_to :link, dependent: :destroy
end
