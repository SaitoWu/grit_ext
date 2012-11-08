module Grit
  class Blob

    alias_method :old_name, :name
    alias_method :old_data, :data

    def name
      GritExt.transcode old_name
    end

    def data
      GritExt.transcode old_data
    end
  end
end
