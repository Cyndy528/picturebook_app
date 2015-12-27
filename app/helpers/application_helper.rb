module ApplicationHelper

	def flash_class(type)
		case type
		when 'alert'
			"alert-notice"
		when 'notice'
			"alert-success"
		else
			""
		end 
	end 
end 