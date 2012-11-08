class Dotfiles < Thor
  include Thor::Actions

  desc "install", "Install config"
  def install
    Dir.glob('{*,config/*}')
    .delete_if{|f| "config" == f }
    .delete_if{|f| f =~ /(README\.md|dotfiles\.thor)/ }
    .each do |f|

      #p Dir.pwd
      #p Dir.home
      source = Pathname.new File.join(Dir.pwd, f)
      destination = Pathname.new File.join(Dir.home, '.'.concat(f))

      ln_s source, destination
    end
  end

  private

  def ln_s source, destination

    if destination.symlink?
      if destination.readlink == source
        say_status :identical, destination.to_s, :blue
      else
        say_status :conflict, destination.to_s, :red
      end
    elsif destination.exist?
      say_status :conflict, destination.to_s, :red
    else
      File.symlink source.expand_path, destination.expand_path
      say_status :created, destination.to_s, :green
    end

  end

  def say_status status, msg, color

    padding = terminal_width - 8 - status.length

    start_line = set_color "::", :blue, :bold
    end_line = set_color("[ ", :blue, :bold)
    .concat("%s")
    .concat(set_color(" ]", :blue, :bold))

    msg = msg.capitalize
    status = set_color status, color

    printf "#{start_line} %-#{padding}s #{end_line}", msg, status
  end

end
