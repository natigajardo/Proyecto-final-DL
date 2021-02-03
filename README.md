# README

Trello : https://trello.com/b/zDsl8Npk/proyecto-final-dl // Heroku : https://obscure-coast-86604.herokuapp.com/

Ruby: 2.7.2.

gem 'rails', '~> 5.2.4', '>= 5.2.4.4'

Pasos:
Modificar las versiones de Ruby y Rails por las que tienes en local.
Hacer Bundle install.
Rails db:migrate:create
Rails db:migrate
Rails db:seed

Nota: Para que omniauth-google funcione (https://github.com/zquestz/omniauth-google-oauth2), hay una gema instalada llamada dotenv-rails, por lo que hay que crear un archivo .env en la sección general de la aplicación, y añadir tus credenciales creadas en https://console.developers.google.com/, el archivo .env debe contener :

APP_ID_GOOGLE = tu id

APP_SECRET_GOOGLE = tu clave

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

Ruby version

System dependencies

Configuration

Database creation

Database initialization

How to run the test suite

Services (job queues, cache servers, search engines, etc.)

Deployment instructions

...
