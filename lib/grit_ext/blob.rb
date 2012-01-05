module Grit
  class Blob
    def text?
      !!(mime_type =~ /application|text/ && !binary?)
    end

    def image?
      !!(mime_type =~ /image/)
    end

    def binary?
      data[0..1024].include?("\000")
    end

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

