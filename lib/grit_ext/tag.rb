module Grit
  class Tag

    alias_method :old_message, :message

    def message
      GritExt.transcode old_message
    end
  end
end
