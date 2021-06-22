class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to public_member_path(@member.id), notice:"登録情報を変更しました。"
    else
      render :edit
    end
  end

  def secession_view
    @member = current_member
    @member.update(is_active: false)
    # セッション情報を削除
    reset_session
    redirect_to top_path, notice: "またのご利用をお待ちしております。"
  end

   private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
  end
end
