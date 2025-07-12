#!/usr/bin/ruby

# APP_NOM ** rmDKrUPs.rb **
# APP_VER ** v1.3.0 **
# APP_DESC ** Desplegador que usa la estructura de directorios del repo para encontrar el docker-compose.yml **

# AUTOR ** Ricardo MONLA (rmonla@) **

require 'fileutils'
require 'open-uri'
require 'uri'

# --- Configuración del Desplegador ---
BASE_REPO_URL = 'https://raw.githubusercontent.com/rmonla/rmDocker/main/'

# --- Funciones ---

def fail_with_error(message)
  puts "❌ Error: #{message}"
  exit 1
end

def detect_compose_command
  if system('docker compose version > /dev/null 2>&1')
    'docker compose'
  elsif system('docker-compose --version > /dev/null 2>&1')
    'docker-compose'
  else
    nil
  end
end

def create_project_directory(dir)
  puts "📂 Creando directorio local del proyecto: #{dir}"
  FileUtils.mkdir_p(dir)
end

def download_docker_compose(url, path)
  puts "📥 Descargando docker-compose.yml desde: #{url}"
  begin
    IO.copy_stream(URI.open(url), path)
    puts "✅ ¡docker-compose.yml descargado con éxito!"
  rescue OpenURI::HTTPError
    fail_with_error("No se pudo encontrar el archivo en la URL especificada. Verifica que la ruta es correcta y el archivo 'docker-compose.yml' existe allí.")
  rescue StandardError => e
    fail_with_error("Al descargar el archivo docker-compose.yml: #{e.message}")
  end
end

def run_docker_compose(compose_cmd)
  compose_file = 'docker-compose.yml'
  fail_with_error("El archivo '#{compose_file}' no se encuentra en el directorio actual.") unless File.exist?(compose_file)

  full_command = "#{compose_cmd} -f #{compose_file} up -d"
  puts "🚀 Ejecutando '#{full_command}'..."
  unless system(full_command)
    fail_with_error("Falló la ejecución de Docker Compose. Asegúrate de que el demonio de Docker está en ejecución y tienes permisos.")
  end
  puts "🎉 ¡Despliegue completado con éxito!"
end

# --- Script Principal ---

# 1. Validar argumentos de entrada.
usage_instructions = "Uso: ruby #{$0} <ruta_repo_app> <nombre_directorio_local>\n   Ejemplo: ruby #{$0} Dashboards/Homarr rm-homarr"
fail_with_error(usage_instructions) unless ARGV.length == 2

app_repo_path = ARGV[0]
local_project_dir = ARGV[1]

# 2. Detectar el comando de compose.
compose_command = detect_compose_command
fail_with_error("No se encontró 'docker compose' (V2) ni 'docker-compose' (V1). Asegúrate de que Docker está instalado.") unless compose_command
puts "✅ Comando Docker Compose detectado: '#{compose_command}'"

# 3. Construir la URL del docker-compose.yml basado en la ruta de la app.
docker_compose_url = "#{BASE_REPO_URL}#{app_repo_path}/docker-compose.yml"

# 4. Ejecutar el despliegue.
create_project_directory(local_project_dir)
Dir.chdir(local_project_dir) do
  download_docker_compose(docker_compose_url, 'docker-compose.yml')
  run_docker_compose(compose_command)
end
