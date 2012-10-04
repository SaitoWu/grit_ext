Grit::Commit.class_eval do

  alias_method :orig_message, :message

  def message
    transcode(orig_message)
  end
end
