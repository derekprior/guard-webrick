require 'webrick'

module Guard
  class WEBrick
    class Server

      attr_reader :server

      def initialize(options = {})
        @server = ::WEBrick::HTTPServer.new(
          :BindAddress  => options[:host],
          :Port         => options[:port],
          :DocumentRoot => File.expand_path(options[:docroot])
        )
      end
      
      def prevent_caching(res)
        res['ETag']          = nil
        res['Last-Modified'] = Time.now + 100**4
        res['Cache-Control'] = 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0'
        res['Pragma']        = 'no-cache'
        res['Expires']       = Time.now - 100**4
      end

      def do_GET(req, res)
        super
        prevent_caching(res)
      end

      def start
        %w{TERM HUP}.each { |signal| trap(signal){ server.shutdown } }
        # ignore signals for guard
        %w{INT TSTP QUIT}.each { |signal| trap(signal) {} }
        @server.start
      end
    end
  end
end

if __FILE__ == $0
  host, port, docroot = ARGV
  Guard::WEBrick::Server.new(
    :host     => host,
    :port     => port,
    :docroot  => docroot
  ).start
end
