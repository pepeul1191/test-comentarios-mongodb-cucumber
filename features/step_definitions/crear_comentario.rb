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
  }
end

When("Ejecutar petición HTTP") do
  @response = HTTParty.get(
    @url,
    headers: @headers,
    body: 'data=' + @data.to_json,
  )
end

Then("Se debe obtener un status code success {int}") do |status_code|
  expect(@response.code).to be == status_code
end
