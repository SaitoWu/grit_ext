module Grit
  class Diff

    def old_path
      GritExt.encode! @a_path
    end

    def new_path
      GritExt.encode! @b_path
    end

    def diff
      lines = @diff.lines.to_a

      # path encoding is dependent on environment
      path = GritExt.encode! lines.shift(2).join
      # diff body encoding is dependent on file encoding
      body = GritExt.encode! lines.join

      @diff = path + body
    end
  end
end
