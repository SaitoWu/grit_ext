module Grit
  class Blob

    alias_method :old_name, :name
    alias_method :old_data, :data

    def name
      old_name.force_encoding("UTF-8")
    end

    def data
      GritExt.transcode(old_data)
    end
  end
end
