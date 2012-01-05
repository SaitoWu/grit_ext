module Grit
  class Blob
    def encoding
      if detection = CharlockHolmes::EncodingDetector.detect(data)
        detection[:encoding]
      end
    end

    def language
      if lang = LanguageSniffer.detect(basename, :content => data).language
        lang.name
      end
    end
  end
end

