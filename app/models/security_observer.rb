class SecurityObserver < ActiveRecord::Observer
	observe :company, :contact, :event
	
	def before_create(model)
		set_creator(model)
	end
	
	def before_save(model)
		set_changer(model)
	end

private
	def set_creator(model)
		model.creator = User.current_user
	end	
	def set_changer(model)
		model.changer = User.current_user
	end
end
