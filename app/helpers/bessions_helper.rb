module BessionsHelper

	def tsign_in(template)
		cookies.permanent[:remember_token] = template.remember_token
		self.current_template = template
	end

	def tsigned_in?
    	!current_template.nil?
	end

	def current_template=(template)
    	@current_template = template
 	end

 	def current_template
    	@current_template ||= Template.find_by_remember_token(cookies[:remember_token])
	end

	def tsign_out
    	self.current_template = nil
    	cookies.delete(:remember_token)
	end
end