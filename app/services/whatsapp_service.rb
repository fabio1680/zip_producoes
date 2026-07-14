require "httparty"

class WhatsappService
  include HTTParty

  base_uri ENV.fetch("EVOLUTION_URL")

  def self.enviar(numero, mensagem)
    response = post(
      "/message/sendText/#{ENV.fetch("EVOLUTION_INSTANCE")}",
      headers: {
        "apikey" => ENV.fetch("EVOLUTION_API_KEY"),
        "Content-Type" => "application/json"
      },
      body: {
        number: numero,
        text: mensagem
      }.to_json
    )

    response
  end
end
