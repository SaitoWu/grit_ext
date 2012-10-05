Grit::Actor.class_eval do
  include ::GritExt

  alias_method :orig_name, :name

  def name
    transcode(orig_name)
  end
end
