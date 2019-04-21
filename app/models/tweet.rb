class Tweet < ApplicationRecord

  with_options presence: true do
    validates :content
  end

  with_options length: { in: 1..140 } do
    validates :content
  end


end
