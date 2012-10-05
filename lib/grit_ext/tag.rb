Grit::Tag.class_eval do
  include ::GritExt

  alias_method :orig_message, :message

  def message
    transcode(orig_message)
  end
end
