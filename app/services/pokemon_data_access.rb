class PokemonDataAccess
    def initialize
      @pokemon_service = PokemonService.new
    end
  
    def fetch_pokemon(pokemon)
      @pokemon_service.get_pokemon(pokemon)
    end
  end
  