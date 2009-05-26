class UsersController < ApplicationController
	include InteligentController
	define_model :user

	protected
		def create_conditions_from_params
			sql = "1=1"
			values = {}
			if params[:id]
				sql << " and id = :id"
				values[:id] = params[:id]
			end
			[sql, values]
		end
end
