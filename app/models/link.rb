class Link < ApplicationRecord
  validates :url, presence: true, :url => true
  validates :title, presence: true
end
