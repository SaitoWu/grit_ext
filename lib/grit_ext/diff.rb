module Grit
  class Diff

    def old_path
      GritExt.transcode @a_path
    end

    def new_path
      GritExt.transcode @b_path
    end
  end
end
