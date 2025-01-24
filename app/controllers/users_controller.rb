class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :balance, :history]

  # GET /users
  def index
    users = User.all
    render json: users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users/:id/balance
  def balance
    render json: @user, status: :ok
  end

  # GET /users/:id/history
  def history
    redemptions = @user.redemptions.includes(:reward).order(redeemed_at: :desc)
    history_data = redemptions.map do |redemption|
      {
        id: redemption.id,
        reward: redemption.reward.name,
        points: redemption.reward.points,
        date: redemption.redeemed_at
      }
    end
    render json: history_data, status: :ok
  end

  private

  # Find user by ID, with error handling for not found users
  def set_user
    @user = User.find_by(id: params[:id])
    return render json: { error: "User not found" }, status: :not_found if @user.nil?
  end

  # Strong parameters
  def user_params
    params.require(:user).permit(:name, :points)
  end
end
