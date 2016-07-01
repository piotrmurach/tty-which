# coding: utf-8

require 'tty/which/version'

module TTY
  # A class responsible for finding an executable in the PATH
  module Which
    # Find an executable in a platform independent way
    #
    # @param [String] command
    #   the command to search for
    #
    # @example
    #   which('ruby')                 # => '/usr/local/bin/ruby'
    #   which('/usr/local/bin/ruby')  # => '/usr/local/bin/ruby'
    #   which('foo')                  # => nil
    #
    # @return [String, nil]
    #   the absolute path to executable if found, `nil` otherwise
    #
    # @api public
    def which(cmd, search_path = nil)
      if path_with_executable_file?(cmd)
        return cmd if executable_file?(cmd)
        extensions.each do |ext|
          exe = File.join(cmd, ext)
          return File.absolute_path(exe) if executable_file?(exe)
        end
        return nil
      end

      search_path ||= search_paths
      search_path.each do |path|
        if executable_file_with_ext?(cmd)
          exe = File.join(path, cmd)
          return File.absolute_path(exe) if executable_file?(exe)
        end
        extensions.each do |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return File.absolute_path(exe) if executable_file?(exe)
        end
      end
      nil
    end
    module_function :which

    # Find default system paths
    #
    # @param [String] path
    #   the path to search through
    #
    # @example
    #   search_paths("/usr/local/bin:/bin")
    #   # => ['/bin']
    #
    # @return [Array[String]]
    #   the array of paths to search
    #
    # @api private
    def search_paths(path = ENV['PATH'])
      paths = if path && !path.empty?
                path.split(File::PATH_SEPARATOR)
              else
                %w(/usr/local/bin /usr/ucb /usr/bin /bin)
              end
      paths.select { |path| Dir.exist?(path) }
    end
    module_function :search_paths

    # All files that contain a '.' in name
    #
    # @example
    #   extensions('.exe;cmd;.bat')
    #   # => ['.exe','.bat']
    #
    # @param [String] path_ext
    #   a string of semicolon separated filename extensions
    #
    # @return [Array[String]]
    #   an array with valid file extensions
    #
    # @api private
    def extensions(path_ext = ENV['PATHEXT'])
      return [''] unless path_ext
      path_ext.split(';').select { |part| part.include?('.') }
    end
    module_function :extensions

    # Determines if filename is an executable file
    #
    # @example Basic usage
    #   executable_file?('/usr/bin/less') # => true
    #
    # @example Executable in directory
    #   executable_file?('less', '/usr/bin') # => true
    #   executable_file?('less', '/usr') # => false
    #
    # @param [String] filename
    #   the path to file
    # @param [String] dir
    #   the directory within which to search for filename
    #
    # @return [Boolean]
    #
    # @api private
    def executable_file?(filename, dir = nil)
      path = File.join(dir, filename) if dir
      path ||= filename
      File.file?(path) && File.executable?(path)
    end
    module_function :executable_file?

    # Check if command itself has extension
    #
    # @param [String] filename
    #   the path to file
    #
    # @example
    #   executable_file_with_ext?("file.bat") # => true
    #
    # @return [Boolean]
    #
    # @api private
    def executable_file_with_ext?(filename)
      extension = File.extname(filename)
      return false if extension.empty?
      extensions.any? { |ext| extension.casecmp(ext) }
    end
    module_function :executable_file_with_ext?

    # Check if executable file is part of absolute/relative path
    #
    # @param [String] cmd
    #   the executable to check
    #
    # @return [Boolean]
    #
    # @api private
    def path_with_executable_file?(cmd)
      File.expand_path(cmd) == cmd
    end
    module_function :path_with_executable_file?
  end # Which
end # TTY
