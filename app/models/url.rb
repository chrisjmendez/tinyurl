require 'uri'

class Url < ApplicationRecord
  belongs_to :link, dependent: :destroy
  
  validates :original,
            :presence => true,
            :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, 
												 :multiline => true,
												 :message => "Plase enter a valid URL." },
            :uniqueness => { :case_sensitive => false }
 
#	validates :original, url: true  
end
