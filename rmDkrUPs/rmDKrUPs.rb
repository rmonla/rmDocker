#!/usr/bin/ruby

# APP_NOM ** rmDKrUPs.rb **
# APP_VER ** v1.1.3 **
# APP_DESC ** Desplagador de dockers reutilizable **

# AUTOR ** Ricardo MONLA (rmonla@) **

require 'fileutils'
require 'open-uri'
require 'uri'

# --- Configuración del Desplegador ---
BASE_CONFIG_URL = 'https://raw.githubusercontent.com/rmonla/rmDocker/main/rmDkrUPs/'

# --- Funciones ---

def fail_with_error(message)
  puts "❌ Error: #{message}"
  exit 1
end

# Detecta el comando de Docker Compose disponible (V2 o V1).
def detect_compose_command
  if system('docker compose version > /dev/null 2>&1')
    'docker compose' # V2, con espacio
  elsif system('docker-compose --version > /dev/null 2>&1')
    'docker-compose' # V1, con guion
  else
    nil # Ninguno encontrado
  end
end

def load_config(url)
  puts "⚙️  Cargando configuración desde: #{url}"
  begin
    config_content = URI.open(url).read
    eval(config_content)
    puts "✅ Configuración cargada correctamente."
  rescue OpenURI::HTTPError
    fail_with_error("No se pudo encontrar el archivo de configuración en '#{url}'. Verifica que el archivo exista.")
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

# Ejecuta el comando docker compose up usando el comando detectado.
def run_docker_compose(compose_cmd)
  compose_file = 'docker-compose.yml'
  fail_with_error("El archivo '#{compose_file}' no se encuentra.") unless File.exist?(compose_file)

  # Construye y ejecuta el comando final, ahora usando -f para ser explícito.
  full_command = "#{compose_cmd} -f #{compose_file} up -d"
  puts "🚀 Ejecutando '#{full_command}'..."

  unless system(full_command)
    fail_with_error("Falló la ejecución de Docker Compose. Asegúrate de que el demonio de Docker está en ejecución.")
  end
  puts "🎉 ¡Despliegue completado con éxito!"
end

# --- Script Principal ---

# 1. Detectar el comando de compose ANTES que nada.
compose_command = detect_compose_command
fail_with_error("No se encontró 'docker compose' (V2) ni 'docker-compose' (V1). Asegúrate de que Docker está instalado.") unless compose_command
puts "✅ Comando Docker Compose detectado: '#{compose_command}'"

# 2. Obtener el nombre del proyecto y construir la URL de configuración.
project_name = ARGV[0]
fail_with_error("Debes proporcionar el nombre del proyecto. Ejemplo: ruby #{$0} homarr") unless project_name
config_url = "#{BASE_CONFIG_URL}#{project_name}.conf"

# 3. Cargar la configuración.
load_config(config_url)
unless defined?(PROJECT_DIR) && defined?(DOCKER_COMPOSE_URL)
  fail_with_error("El archivo de config '#{project_name}.conf' debe definir PROJECT_DIR y DOCKER_COMPOSE_URL.")
end

# 4. Ejecutar el despliegue.
create_project_directory(PROJECT_DIR)
Dir.chdir(PROJECT_DIR) do
  download_docker_compose(DOCKER_COMPOSE_URL, 'docker-compose.yml')
  run_docker_compose(compose_command) # Pasar el comando detectado a la función.
end
