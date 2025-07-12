#!/usr/bin/ruby

# APP_NOM ** rmDKrUPs.rb **
# APP_VER ** v1.1.1 **
# APP_DESC ** Desplagador de dockers reutilizable **

# AUTOR ** Ricardo MONLA (rmonla@) **

require 'fileutils'
require 'open-uri'
require 'uri'

# --- Configuración del Desplegador ---
# URL base donde se encuentran los archivos de configuración (.conf).
# El script tomará el nombre del proyecto del argumento y le añadirá ".conf".
BASE_CONFIG_URL = 'https://raw.githubusercontent.com/rmonla/rmDocker/main/rmDkrUPs/'

# --- Funciones ---

def fail_with_error(message)
  puts "❌ Error: #{message}"
  exit 1
end

def load_config(url)
  puts "⚙️  Cargando configuración desde: #{url}"
  begin
    config_content = URI.open(url).read
    eval(config_content)
    puts "✅ Configuración cargada correctamente."
  rescue OpenURI::HTTPError
    fail_with_error("No se pudo encontrar el archivo de configuración en la URL especificada. Verifica que el archivo exista.")
  rescue StandardError => e
    fail_with_error("No se pudo procesar el archivo de configuración: #{e.message}")
  end
end

def create_project_directory(dir)
  puts "📂 Creando directorio del proyecto: #{dir}"
  FileUtils.mkdir_p(dir)
end

def download_docker_compose(url, path)
  puts "📥 Descargando docker-compose.yml..."
  begin
    IO.copy_stream(URI.open(url), path)
    puts "✅ ¡docker-compose.yml descargado con éxito!"
  rescue StandardError => e
    fail_with_error("Al descargar docker-compose.yml: #{e.message}")
  end
end

def run_docker_compose
  fail_with_error("Comando 'docker-compose' no encontrado. ¿Está instalado?") unless system('command -v docker-compose >/dev/null')

  puts "🚀 Ejecutando 'docker-compose up -d'..."
  unless system('docker-compose up -d')
    fail_with_error("Falló la ejecución de docker-compose. Asegúrate de que Docker está en ejecución.")
  end
  puts "🎉 ¡Despliegue completado con éxito!"
end

# --- Script Principal ---

project_name = ARGV[0]
fail_with_error("Debes proporcionar el nombre del proyecto. Ejemplo: ruby script.rb homarr") unless project_name

# Construye la URL completa del archivo de configuración.
config_url = "#{BASE_CONFIG_URL}#{project_name}.conf"

# Carga la configuración desde la URL construida.
load_config(config_url)

# Valida que la configuración cargó las variables necesarias.
unless defined?(PROJECT_DIR) && defined?(DOCKER_COMPOSE_URL)
    fail_with_error("El archivo de configuración '#{project_name}.conf' debe definir PROJECT_DIR y DOCKER_COMPOSE_URL.")
end

# Ejecuta el proceso de despliegue.
create_project_directory(PROJECT_DIR)
Dir.chdir(PROJECT_DIR) do
  download_docker_compose(DOCKER_COMPOSE_URL, 'docker-compose.yml')
  run_docker_compose
end
