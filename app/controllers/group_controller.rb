class GroupController < ApplicationController
	def index
	end
	def create
		group = Group.new
		group.name = params[:name]
		group.no_of_members = params[:no_of_members].to_i
		group.user_id = current_user.id
		group.save!
		i=2
		group_usr = GroupUser.new
		group_usr.group_id = group.id
		group_usr.user_id = current_user.id
		group_usr.save!
		while i<=group.no_of_members do
			d = "user_"+i.to_s
			user = User.where(:email=>params[d.to_sym]).first
			if !user.nil?
				id = user.id
				group_usr = GroupUser.new
				group_usr.group_id = group.id
				group_usr.user_id = id
				group_usr.save!
			end
			i=i+1
		end
		
		redirect_to :action=> 'groups'
	end
	def groups
		@all_groups = current_user.groups
	end
	def info
		@group = Group.where(:id=>params[:id]).first
		@group_users = @group.group_users
	end
	def other
		# @groups=current_user.group_users
		# @all_groups=Group.where(:group_id => @groups.group_id)
		# select * from groups inner join group_users on
		#  group_users.group_id=groups.id where group_users.user_id =2;
		#  Group.
		@all_groups= Group.select("*").joins(:group_users).where(:user_id => current_user.id)
	end
end
