module Grit
  class Actor

    alias_method :orig_name, :name

    def name
      GritExt.transcode(orig_name)
    end
  end
end
