module Grit
  class Tree

    alias_method :orig_name, :name
    alias_method :orig_view, :/

    def path
      if orig_name
        GritExt.escape_path(orig_name)
      end
    end

    def /(file)
      file = file.dup.force_encoding("binary")
      orig_view(file)
    end
  end
end
