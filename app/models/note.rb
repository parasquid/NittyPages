class Note < ApplicationRecord
  serialize :body

  def to_param() = date
end
