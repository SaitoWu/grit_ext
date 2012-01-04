require "rubygems"
require "charlock_holmes"
require "language_sniffer"
require "grit_ext/version"

Grit::GitRuby::Internal::RawObject.class_eval do
  def content
    transcoding(@content)
  end

  private
  def transcoding(content)
    detection = CharlockHolmes::EncodingDetector.detect(content)
    if hash = detection
     content = CharlockHolmes::Converter.convert(content, hash[:encoding], 'UTF-8') if hash[:encoding]
    end
    content
  end
end

Grit::Blob.class_eval do

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
