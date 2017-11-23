class Session < ApplicationRecord
  include DigestMatcher

  belongs_to :user
end
