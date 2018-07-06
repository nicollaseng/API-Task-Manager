class ApiVersionConstraint
	def initialize(options)
		@version = options[:version]
	end

	def matches?(req)
		req.headers['Accept'].include?("application/vnd.task-manager.v#{@version}")
	end
end