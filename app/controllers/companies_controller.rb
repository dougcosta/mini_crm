class CompaniesController < ApplicationController
	include InteligentController
	define_model :company

	protected
		def create_conditions_from_params
			sql = "1=1"
			values = {}
			if params[:id]
				sql << " and id = :id"
				values[:id] = params[:id]
			end
			if params[:user_id]
				sql << " and (creator_id = :user_id or changer_id = :user_id)"
				values[:user_id] = params[:user_id]
			end
			[sql, values]
		end
end
