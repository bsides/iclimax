class ClimaxController < ActionController::Base
	setup_guild = 'Infinity%20Cl%C3%ADmax'
	setup_server = 'Goldrinn'
	setup_locale = 'pt_BR'

	api = Battlenet.new
	@guild = api.guild(setup_server, setup_locale)
	puts @guild
end