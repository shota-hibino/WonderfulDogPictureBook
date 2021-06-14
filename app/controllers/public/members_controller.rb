class Public::MembersController < ApplicationController
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

  def hide
    @member = current_member
    @member.update(withdrawal_flag: true)
    # セッション情報を削除
    reset_session
    redirect_to public_top_path, notice: "またのご利用をお待ちしております。"
  end

  def secession_view
  end

  def secession
  end

   private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
  end
end
