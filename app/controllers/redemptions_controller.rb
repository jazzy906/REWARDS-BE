# app/controllers/redemptions_controller.rb
class RedemptionsController < ApplicationController
  def create
    user = User.find(redemption_params[:user_id])
    reward = Reward.find(redemption_params[:reward_id])

    if user.points >= reward.points
      ActiveRecord::Base.transaction do
        user.update!(points: user.points - reward.points) 
        @redemption = Redemption.create!(
          user_id: user.id,
          reward_id: reward.id,
          redeemed_at: Time.current
        )
      end
      render json: { message: "Reward redeemed successfully!", redemption: @redemption }, status: :created
    else
      render json: { error: "Insufficient points to redeem the reward." }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def redemption_params
    params.require(:redemption).permit(:user_id, :reward_id)
  end
end
