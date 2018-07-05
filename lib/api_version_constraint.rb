class ApiVersionConstraint
	def initialize(options)
		@version = options[:version]
	end

	def matches?(req)
		req.headers['Accept'].include?("application/vnd.taskmanager.v#{@version}")
	end
end