require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@users)
      end
    end
  end

  def send_users_csv(users)
    csv_data = CSV.generate do |csv|
      header = %w(ID 名前 スカウト 案件紹介 広告配信 メルマガ 運営連絡 作成日時 更新日時)
      csv << header
      users.each do |user|
        values = [
          user.id
          user.name,
          user.scout_email_notification == true ? '受け取る' : 'NG',
          user.introduction_project_email == true ? '受け取る' : 'NG',
          user.advertisement_delivery == true ? '受け取る' : 'NG',
          user.email_magazine == true ? '受け取る' : 'NG',
          user.contact_from_manager == true ? '受け取る' : 'NG',
          user.created_at,
          user.updated_at
        ]
        csv << values
      end
    end
    send_data(csv_data, filename: "users.csv")
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :scout_email_notification, :introduction_project_email, :advertisement_delivery, :email_magazine, :contact_from_manager)
    end
end
