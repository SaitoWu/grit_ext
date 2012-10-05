Grit::Tree.class_eval do
  include ::GritExt

  alias_method :orig_name, :name

  def name
    transcode(orig_name)
  end

  def path
    escape_path(orig_name)
  end

  def /(file)
    if file =~ /\//
      file.split("/").inject(self) { |acc, x| acc/x } rescue nil
    else
      self.contents.find { |c| c.name == file.dup.force_encoding("binary") }
    end
  end
end
