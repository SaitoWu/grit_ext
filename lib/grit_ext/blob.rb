module Grit
  class Blob

    alias_method :orig_data, :data

    def path
      GritExt.escape_path(orig_name)
    end

    def data
      GritExt.transcode(orig_data)
    end
  end
end
