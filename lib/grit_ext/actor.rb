Grit::Actor.class_eval do

  alias_method :orig_name, :name

  def name
    transcode(orig_name)
  end
end
