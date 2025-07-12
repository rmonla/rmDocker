#!/usr/bin/ruby

# APP_NOM ** rmDKrUPs.rb **
# APP_VER ** v1.1.1 **
# APP_DESC ** Desplagador de dockers reutilizable **

# AUTOR ** Ricardo MONLA (rmonla@) **

require 'fileutils'
require 'open-uri'
require 'uri'

# --- Funciones ---

# Imprime un mensaje de error y termina el script.
def fail_with_error(message)
  puts "❌ Error: #{message}"
  exit 1
end

# Descarga y carga el archivo de configuración desde una URL.
def load_config(url)
  puts "⚙️  Cargando configuración desde: #{url}"
  begin
    config_content = URI.open(url).read
    # Usamos eval para interpretar el contenido del archivo de configuración.
    # Es seguro en este contexto porque confiamos en la fuente del archivo.
    eval(config_content)
    puts "✅ Configuración cargada correctamente."
  rescue StandardError => e
    fail_with_error("No se pudo descargar o procesar el archivo de configuración: #{e.message}")
  end
end

# Crea el directorio del proyecto si no existe.
def create_project_directory(dir)
  puts "📂 Creando directorio del proyecto: #{dir}"
  FileUtils.mkdir_p(dir)
end

# Descarga el archivo docker-compose.yml.
def download_docker_compose(url, path)
  puts "📥 Descargando #{File.basename(path)}..."
  begin
    download = URI.open(url)
    IO.copy_stream(download, path)
    puts "✅ ¡#{File.basename(path)} descargado con éxito!"
  rescue StandardError => e
    fail_with_error("Al descargar docker-compose.yml: #{e.message}")
  end
end

# Ejecuta el comando docker-compose.
def run_docker_compose
  fail_with_error("Comando 'docker-compose' no encontrado. ¿Está instalado?") unless system('command -v docker-compose >/dev/null')

  puts "🚀 Ejecutando 'docker-compose up -d'..."
  unless system('docker-compose up -d')
    fail_with_error("Falló la ejecución de docker-compose. Asegúrate de que Docker está en ejecución.")
  end
  puts "🎉 ¡Despliegue completado con éxito!"
end

# --- Script Principal ---

# Verifica que se ha proporcionado la URL de configuración.
config_url = ARGV[0]
fail_with_error("Debes proporcionar la URL del archivo de configuración. Ejemplo: ruby script.rb <config_url>") unless config_url

# Carga la configuración
config = load_config(config_url)

# Asigna las variables desde la configuración.
# Se espera que el archivo de config defina PROJECT_DIR y DOCKER_COMPOSE_URL.
unless defined?(PROJECT_DIR) && defined?(DOCKER_COMPOSE_URL)
    fail_with_error("El archivo de configuración debe definir PROJECT_DIR y DOCKER_COMPOSE_URL.")
end

# Ejecuta el proceso de despliegue.
create_project_directory(PROJECT_DIR)
Dir.chdir(PROJECT_DIR) do
  download_docker_compose(DOCKER_COMPOSE_URL, 'docker-compose.yml')
  run_docker_compose
end
