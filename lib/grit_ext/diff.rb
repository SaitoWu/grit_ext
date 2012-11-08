module Grit
  class Diff

    def old_path
      GritExt.transcode @a_path
    end

    def new_path
      GritExt.transcode @b_path
    end

    def diff
      GritExt.transcode @diff
    end
  end
end
