Feature: Crear Comentario
  Crear comentarios contra MongoDB

  Scenario: Crear comentario con headers
    Given Generar petición HTTP "comentario/crear" con headers
    Given Crear POST data
    When Ejecutar petición HTTP
    Then Se debe obtener un status code success 200
    Then Se debe obtener el ObjectId generado que tiene una longitud de 24
