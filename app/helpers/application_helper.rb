module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "BewerbungsClip.com"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

 #  def sign_in(user)
 #    cookies.permanent[:remember_token] = user.remember_token
 #    self.current_user = user
 #  end

 #  def signed_in?
 #    !current_user.nil?
 #  end

 #  def current_user=(user)
 #    @current_user = user
 #  end

 #  def current_user
 #    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
 #  end

 #  def current_user?(user)
 #    user == current_user
 #  end

 #  def sign_out
 #    self.current_user = nil
 #    cookies.delete(:remember_token)
 #  end

	# def tsign_in(template)
	# 	cookies.permanent[:remember_token] = template.remember_token
	# 	self.current_template = template
	# end

	# def tsigned_in?
 #    	!current_template.nil?
	# end

	# def current_template=(template)
 #    	@current_template = template
 # 	end

 # 	def current_template
 #    	@current_template ||= Template.find_by_remember_token(cookies[:remember_token])
	# end

	# def tsign_out
 #    	self.current_template = nil
 #    	cookies.delete(:remember_token)
	# end

end