class Link < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: true

  def change_read_status
    if self.read == "f"
      self.update_attribute("read", "t")
    else
      self.update_attribute("read", "f")
    end
  end

  def self.sort_alphabetically(user)
    where("user_id = #{user.id}")
    .order("links.title")
  end
end
