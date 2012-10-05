module Grit
  class Commit

    alias_method :orig_message, :message
    alias_method :orig_short_message, :short_message

    def message
      GritExt.transcode(orig_message)
    end

    def short_message
      GritExt.transcode(orig_short_message)
    end
  end
end
