require "cgi"
require "charlock_holmes"
require "grit_ext/version"
require "grit_ext/actor"
require "grit_ext/blob"
require "grit_ext/commit"
require "grit_ext/tree"

module GritExt

  private
  def transcode(message)
    return nil unless message.respond_to? :force_encoding

    # if message is utf-8 encoding, just return it
    return message if message.valid_encoding?

    # return message if message type is binary
    detect = CharlockHolmes::EncodingDetector.detect(message)
    return message if detect[:type] == :binary

    # if message is not utf-8 encoding, convert it
    if detect[:encoding]
      message.force_encoding(detect[:encoding])
      message.encode!("UTF-8", detect[:encoding], undef: :replace, replace: "", invalid: :replace)
    end

    # ensure message encoding is utf8
    message.valid_encoding? ? message : raise

    # Prevent app from crash cause of encoding errors
  rescue
    encoding = detect ? detect[:encoding] : "unknown"
    "--broken encoding: #{encoding}"
  end

  def escape_path(path)
    CGI.escape path
  end
end

