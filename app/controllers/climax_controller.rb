class ClimaxController < ActionController::Base

	# Setup constants
	CONFIG_GUILDNAME = 'Infinity Clímax'
	CONFIG_SERVER = 'Goldrinn'
	CONFIG_LOCALE = 'pt_BR'

	# Start the API and localizing it
	@@api = Battlenet.new
	Battlenet.locale = CONFIG_LOCALE

	# Some global utilities

	# Class colors
	C_DEATHKNIGHT = 'c41f3b'
	C_DRUID				= 'ff7d0a'
	C_HUNTER			= 'abd473'
	C_MAGE				= '69ccf0'
	C_PALADIN			= 'f58cba'
	C_PRIEST			= 'ffffff'
	C_ROGUE				= 'fff569'
	C_SHAMAN			= '2459ff'
	C_WARLOCK			= '9482c9'
	C_WARRIOR			= 'c79c6e'
	C_MONK				= '00ffba'

	# Get all members of a guild with their detailed info
	# return: name, realm, battlegroup, class, race, gender, level, achievementPoints, thumbnail, guild, spec (name, role, backgroundImage, icon, description, order)
	@@roster = @@api.guild CONFIG_SERVER, CONFIG_GUILDNAME, :fields => "members"
	@@roster = @@roster['members']
	



	def index

		@thumb 	= 'http://us.battle.net/static-render/us/'
		@icon56	= 'http://media.blizzard.com/wow/icons/36/'
		@icon36	= 'http://media.blizzard.com/wow/icons/36/'
		@icon18	= 'http://media.blizzard.com/wow/icons/18/'

		@chars = @@roster

		respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @chars }
	  end

	end

	def apply

		@thumb 	= 'http://us.battle.net/static-render/us/'
		@icon56	= 'http://media.blizzard.com/wow/icons/36/'
		@icon36	= 'http://media.blizzard.com/wow/icons/36/'
		@icon18	= 'http://media.blizzard.com/wow/icons/18/'

		#@procura = Climax.procura(params[:procura])

		@theChar = params[:procura].nil? ? 'Pau' : params[:procura]
		#@theChar = @procura

		@@profile = @@api.character CONFIG_SERVER, @theChar, :fields => "stats,talents"
		@@profile_stats = @@profile['stats']
		@@profile_talents = @@profile['talents']


		@char = @@profile
		@stats = @@profile_stats
		@talents = @@profile_talents

		respond_to do |format|
	    format.html # index.html.erb
	    format.js
	    format.json { render json: @chars }
	  end

	end
end