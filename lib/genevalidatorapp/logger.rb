require 'logger'

module GeneValidatorApp
  class Logger < Logger
    def initialize(dev, verbose = false)
      super dev
      self.level     = verbose ? DEBUG : INFO
      self.formatter = Formatter.new
    end

    # We change Logging format so that it is consistent with Sinatra's
    class Formatter < Formatter
      Format = "[%s] %s  %s\n".freeze

      def initialize
        self.datetime_format = '%Y-%m-%d %H:%M:%S'
      end

      def call(severity, time, _progname, msg)
        format(Format, format_datetime(time), severity, msg2str(msg))
      end
    end
  end
end
