require 'httparty'
require 'json'

Given("Generar petición HTTP {string} con headers") do |url|
  @url = CONSTANTS[:BASE_URL] + url
  @headers = {
    CONSTANTS[:CSRF][:key] => CONSTANTS[:CSRF][:value],
    'Content-Type' => 'application/x-www-form-urlencoded',
    'charset' => 'utf-8'
  }
end

Given("Crear POST data") do
  @data = {
    :usuario_id => 23123,
    :tipo => 'comentario', #respuesta
    :estado => 'aprobado', #pendiente
    :texto => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
  }
end

When("Ejecutar petición HTTP") do
  @response = HTTParty.post(
    @url,
    headers: @headers,
    body: 'data=' + @data.to_json,
  )
end

Then("Se debe obtener un status code success {int}") do |status_code|
  #puts @response.body
  expect(@response.code).to be == status_code
end

Then("Se debe obtener el ObjectId generado que tiene una longitud de {int}") do |len|
  expect(@response.body.length).to be == len
end
