class MailerController < ApplicationController
	def compose
	end
	def inbox
		@inbox = Message.where(:receiver_id=>current_user.id).reverse
	end
	def sent_mails
		@sent_mails = Message.find_by_sql("select m1.* from messages m1 left outer join messages m2 on (m1.ticket_id = m2.ticket_id and m1.id < m2.id) where m2.id is null;")
		#@sent_mails = Message.where(:sender_id=>current_user.id).reverse
	end
	def create_mail
		ticket_id = 0
		if !params[:ticket_id].nil? && params[:ticket_id]!=0
			ticket_id = params[:ticket_id].to_i
		else
			ticket_id = Message.maximum("ticket_id").to_i+1
		end
		to = params[:email]
		message_body = params[:message]
		sender_id = current_user.id 
		user = User.where(:email=>to).first
		if !user.nil?
			receiver_id = user.id
			chat = Message.new
			chat.sender_id = sender_id
			chat.receiver_id = receiver_id
			chat.message = message_body
			chat.ticket_id = ticket_id
			chat.save!
		else
			#here no receive id exists.so don't send mail
		end
		 redirect_to action: 'sent_mails'
	end
	def history
		@id = params[:ticket_id]
		@chat_history = Message.where(:ticket_id=>@id).reverse
		if @chat_history.first.receiver_id == current_user.id
			@rec_id = @chat_history.first.sender_id
		else
			@rec_id = @chat_history.first.receiver_id
		end
		puts "%"*50
		puts @chat_history.inspect
		puts "%"*50
		@ticket_id = @chat_history.first.ticket_id
	end
end
