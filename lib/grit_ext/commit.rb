Grit::Commit.class_eval do
  include ::GritExt

  alias_method :orig_message, :message
  alias_method :orig_short_message, :short_message

  def message
    transcode(orig_message)
  end

  def short_message
    transcode(orig_short_message)
  end
end
