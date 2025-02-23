class PokemonBll
  def initialize
    @pokemon_data_access = PokemonDataAccess.new
  end

  def get_pokemon(pokemon)
    @pokemon_data_access.fetch_pokemon(pokemon)
  end
end
