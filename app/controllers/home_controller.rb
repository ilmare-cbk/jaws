class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:chatting]

  def index
  end
  
  def members
  end

  def chatting
  	@chattings = Chatting.all
  end
  
  def write_chat
    Pusher.trigger('chat_room', 'new_msg', {
      msg: params[:message],
      user_id: current_user.id,
      username: current_user.username,
      time: Time.now.in_time_zone(9).strftime("%Y/%m/%d \n %a %p %I:%M:%S")
    })    
    chatting = Chatting.new
    chatting.user_id = current_user.id
    chatting.content = params[:message]
    chatting.written_time = Time.now.in_time_zone(9).strftime("%Y/%m/%d \n %a %p %I:%M:%S")
    chatting.save
    
    render :text => ""
  end

  def write_email
  end

  def email_send
      to = params[:to]
      from = params[:from]
      title = params[:title]
      content = params[:content]
      Contact.send_email(to, from, title, content).deliver_now
      redirect_to '/home/members'
  end

  

end
