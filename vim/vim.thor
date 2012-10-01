require 'yaml'
require 'pathname'
require 'rbconfig'

module Bundle
    class Ui
        def initialize(shell)
            @shell = shell
        end

        def info status, msg
            tell_me status, msg, nil
        end

        def success status, msg
            tell_me status, msg, :green
        end

        def warn status, msg
            tell_me status, msg, :yellow
        end

        def error status, msg
            tell_me status, msg, :red
        end

        private
        def tell_me status, msg, color
            status = @shell.set_color( "[#{status}]", color ) unless status.nil?
            @shell.say "#{status} #{msg}"
        end
    end
end

class Vim < Thor
    include Thor::Actions

    desc 'install', 'Installations des plugins'
    def install
        plugins.each_pair do |name, repo|
            plugin_path = File.join('bundle', name)
            unless File.exist? plugin_path
                run "git clone #{repo} #{plugin_path}", {:verbose => false, :capture => true}
                ui.success 'INSTALLED', name
            end
        end
    end

    desc 'update', 'Mise a jours des plugins installes'
    def update
        plugins.each_pair do |name, repo|
            plugin_path = File.join('bundle', name)
            if File.exist? plugin_path
                Dir.chdir plugin_path do
                    output = run "git pull ", {:verbose => false, :capture => true}
                    if output =~ /Already up-to-date/i
                        ui.info 'NOT UPDATED', name
                    else
                        ui.success 'UPDATED', name
                    end
                end
            end
        end
    end

    desc 'clean', 'Nettoyage des plugins non references dans plugins.yml'
    def clean
        Pathname("bundle").each_child do |f|
            next if "pathogen" == f.basename

            if f.directory? && !plugins.has_key?(f.basename.to_s)
                f.rmtree
                ui.success 'DELETED', f.basename.to_s
            end
        end
    end

    private
    def ui
        @ui ||= Bundle::Ui.new(Thor::Base.shell.new)
    end

    def plugins
        @plugins_yml ||= File.exists?('plugins.yml') ? YAML.load_file('plugins.yml') : {}
    end

    def windows?
        (RbConfig::CONFIG['host_os'] =~ /mswin|mingw/) ? true : false
    end
end

