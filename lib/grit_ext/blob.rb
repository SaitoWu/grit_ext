Grit::Blob.class_eval do
  include ::GritExt

  alias_method :orig_name, :name
  alias_method :orig_data, :data

  def name
    transcode(orig_name)
  end

  def path
    escape_path(orig_name)
  end

  def data
    transcode(orig_data)
  end
end
