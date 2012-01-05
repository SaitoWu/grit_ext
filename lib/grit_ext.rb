require "rubygems"
require "charlock_holmes"
require "language_sniffer"
require "grit_ext/blob"
require "grit_ext/version"
require "grit_ext/raw_object"

module GritExt
  def transcode(content)
    detection = CharlockHolmes::EncodingDetector.detect(content)
    if hash = detection
     content = CharlockHolmes::Converter.convert(content, hash[:encoding], 'UTF-8') if hash[:encoding]
    end
    content
  end
end

