class PokemonController < ApplicationController
  def get_pokemon
    pokemon_name = params[:pokemon]
    begin
      result = Bll::PokemonBll.new.get_pokemon(pokemon_name)
      render json: result
    rescue StandardError => e
      Rails.logger.error "Error en get_pokemon: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      render json: { error: e.message }, status: 500
    end
  end
end
