class Public::ContactsController < ApplicationController

#問い合わせフォーム
 def new
  @contact = Contact.new
 end

#確認画面
# 送信完了後画面を表示させない処理
# validateエラーの場合newに戻る
 def confirm
  if params[:contact].blank?
   redirect_to new_contact_path
   return
  end
  
  @contact = Contact.new(contact_params)
  
  if @contact.invalid?
   render :new
  end
  
 end

# 送信完了画面
 def finish
  @contact = Contact.find(params[:id])
 end

# 問い合わせ送信後、管理者にメールを送る
 def create
  @contact = Contact.new(contact_params)
  if @contact.save
    ContactMailer.send_mail(@contact).deliver
    redirect_to finish_contact_path(@contact)
  else
    render :new
  end
 end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

end
