class Contact < ApplicationMailer
	def send_email to, from, title, content
		mail from: from, 
			   to: to, 
		  subject: title,
		  	 body: content
	end
end
