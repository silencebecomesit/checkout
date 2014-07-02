require 'bootstrap-sass'

path_prefix = ".."

sass_dir = ""
css_dir = "#{path_prefix}/css"
images_dir = "#{path_prefix}/img"
javascripts_dir = "#{path_prefix}/js"

relative_assets = true

output_style = environment == :production ? :compressed : :expanded