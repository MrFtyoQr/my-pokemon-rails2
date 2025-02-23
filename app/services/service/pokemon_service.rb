require 'net/http'
require 'json'

module Service
  class PokemonService
    BASE_URL = 'https://pokeapi.co/api/v2/pokemon'

    def get_pokemon(pokemon)
      url = URI("#{BASE_URL}/#{pokemon}")
      response = Net::HTTP.get_response(url)
      if response.is_a?(Net::HTTPSuccess)
        data = JSON.parse(response.body)
        {
          "Nombre"             => data["name"],
          "Altura"             => data["height"],
          "Experiencia Base"   => data["base_experience"],
          "Habilidades"        => data["abilities"].map { |a| a["ability"]["name"] },
          "Movimientos"        => data["moves"].take(5).map { |m| m["move"]["name"] }
        }
      else
        { "error" => "HTTP error: #{response.code}" }
      end
    rescue => e
      Rails.logger.error "Error en PokemonService#get_pokemon: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      { "error" => e.message }
    end
  end
end
