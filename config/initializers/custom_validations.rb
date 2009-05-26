module ActiveRecord::Validations::ClassMethods
	def validates_as_http_url(*attr_names)
		configuration = { :message => "Precisa ser uma URL válida", :on => :save }
		configuration.update(attr_names.extract_options!)
		configuration[:with] = /^http:\/\/[a-z:\-_AZ0-9\.]*\.[A-Za-z]{2,4}\/.*$/
		attr_names << configuration
		validates_format_of *attr_names
	end
	
	def validates_as_email(*attr_names)
		configuration = { :message => "Precisa ser um email válido", :on => :save }
		configuration.update(attr_names.extract_options!)
		configuration[:with] = /^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$/
		attr_names << configuration
		validates_format_of *attr_names
	end
end
