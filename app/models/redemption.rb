class Redemption < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  before_create :set_redeemed_at

  private

  def set_redeemed_at
    self.redeemed_at ||= Time.current 
  end
end
