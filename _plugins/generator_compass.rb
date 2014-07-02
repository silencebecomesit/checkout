#
# Jekyll Generator for SCSS
#
# (File paths in this description relative to jekyll project root directory)
# Place this file in ./_plugins
# Place .scss files in ./_scss
# Compiles .scss files in ./_scss to .css files in whatever directory you indicated in your config
# Config file placed in ./_sass/config.rb
#

require 'sass'
require 'pathname'
require 'compass'
require 'compass/exec'

module Jekyll
  class CompassGenerator < Generator
    safe true
    priority :high
    def generate(site)
        Dir.chdir File.expand_path('_sass', site.source) do
            Compass::Exec::SubCommandUI.new(['compile', '-e', ENV['JEKYLL_ENV'] || 'development']).run!
            files = Dir[File.expand_path('css', site.source) + "**/*.css"].select {|f| !File.directory? f}.each {|f|
                dirname = File.dirname(f)
                site.static_files << Jekyll::StaticFile.new(site, site.source, dirname[site.source.length, dirname.length], File.basename(f))
            }
       end
    end
  end
end