module Grit
  class Tag

    alias_method :orig_message, :message

    def message
      GritExt.transcode(orig_message)
    end
  end
end
