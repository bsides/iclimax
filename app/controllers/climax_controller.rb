class ClimaxController < ActionController::Base
	def index

		setup_guildname = 'Infinity Clímax'
		setup_server = 'Goldrinn'
		setup_locale = 'pt_BR'

		api = Battlenet.new
		Battlenet.locale = "pt_BR"
		
		@guild = api.guild setup_server, setup_guildname, :fields => "members"

		@chars = @guild['members']
		@guild_members = @chars.size


		respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @climax }
	  end

	end
end