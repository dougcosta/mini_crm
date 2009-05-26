module InteligentController
	def self.include(base)
		base.extend ClassMethods
	end
	
	module ClassMethods
		def define_model(model_name)
			module_eval do
				define_method :model_class do
					model_name.to_s.capitalize.constantize
				end
				define_method :singular_variable do
					"@" + model_name.to_s
				end
				define_method :plural_variable do
					"@" + model_name.to_s.pluralize
				end
				define_method :singular_symbol do
					model_name
				end
			end
		end
	end
	
	def index
		instance_variable_set plural_variable, model_class.find(:all, :conditions => create_conditions_from_params)
		
		respond_to do |format|
			format.html #index.html.erb
			format.xml { render :xml => instance_variable_get(plural_variable) }
			format.js
		end
	end

	def show
		instance_variable_set singular_variable, model_class.find(:first, :conditions => create_conditions_from_params)
		
		respond_to do |format|
			format.html #index.html.erb
			format.xml { render :xml => instance_variable_get(singular_variable) }
			format.js
		end
	end
	
	def new
		instance_variable_set singular_variable, model_class.new
		
		respond_to do |format|
			format.html #index.html.erb
			format.xml { render :xml => instance_variable_get(singular_variable) }
			format.js
		end
	end
	
	def edit
		instance_variable_set singular_variable, model_class.find(:first, :conditions => create_conditions_from_params)		
	end
	
	def create
		create_instance_from_params
		
		respond_to |format|
			if instance_variable_get(singular_variable).save
				flash[:notice] = 'Registro criado com sucesso.'
				format.html { redirect_to(instance_variable_get(singular_variable)) }
				format.xml { render :xml => instance_variable_get(singular_variable), :status => :created, :location => instance_variable_get(singular_variable) }
				format.js
			else
				format.html { render :action => "new" }
				format.xml { render :xml => instance_variable_get(singular_variable).errors, :status => :unprocessable_entity }
				format.js
			end
	end
	
	def update
		edit
		
		respond_to do |format|
			if instance_variable_get(singular_variable).update_attributes(params[singular_simbol])
				flash[:notice] = 'Registro atualizado com sucesso.'
				format.html { redirect_to(instance_variable_get(singular_variable)) }
				format.xml { head :ok }
				format.js
			else
				format.html { render :action => "edit" }
				format.xml { render :xml => instance_variable_get(singular_variable).errors, :status => :unprocessable_entity }
				format.js
			end
		end
	end
	
	def destroy
		edit
		instance_variable_get(singular_variable).destroy
		respond_to do |format|
			format.html { redirect_to(:action => "index") }
			format.xml { head :ok }
			format.js
		end
	end
	
	protected
	def create_instance_from_params
		instance_variable_set singular_variable, model_class.new(params[singular_symbol])
	end
end
