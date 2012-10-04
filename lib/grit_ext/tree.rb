Grit::Tree.class_eval do

  alias_method :orig_name, :name
  alias_method :orig_data, :data

  def name
    transcode(orig_name)
  end

  def data
    transcode(orig_data)
  end
end
