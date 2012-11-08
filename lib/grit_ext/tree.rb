module Grit
  class Tree

    alias_method :old_name, :name

    def name
      old_name.force_encoding("UTF-8")
    end
  end
end
