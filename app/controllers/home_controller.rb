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
end
