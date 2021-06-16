class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :reject_member, only: [:create], if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admin_orders_path
  #   when Member
  #     public_member_path(current_member)
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   if resource == :member
  #     public_root_path
  #   elsif resource == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana])
  end

  def reject_member
    return if params[:admin]

    @member = Member.find_by(email: params[:member][:email].downcase)
    if @member && !@member.is_active
      flash[:error] = "退会済みです。"
      redirect_to new_member_session_path
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
