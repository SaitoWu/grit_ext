module Grit
  module GitRuby
    module Internal
      class RawObject
        include GritExt

        def content
          transcode(@content)
        end
      end
    end
  end
end
