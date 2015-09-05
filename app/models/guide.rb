class Guide
  include ActiveModel::Model
  attr_accessor :title, :content, :created_at, :permalink, :author

  # Used for ATOM-feed id
  def id
    @permalink.to_i
  end

  def content
    remove_yaml_frontmatter_from @content
  end

  def excerpt
    content.split('<!--more-->').first
  end

  def has_more_text?
    content != excerpt
  end

  def created_at
    @created_at.to_date
  end

  def to_param
    @permalink.parameterize
  end

  # Query methods
  def self.all
    guide_files.reverse.map do |file|
      self.new extract_data_from(file)
    end
  end

  def self.find_by_name(name)
    file = find_file_by(name)
    self.new extract_data_from(file)
  end

  private
  def self.guide_files
    sort_by_id Dir.glob(guides_path + '/' + '*.md')
  end

  def self.sort_by_id(files)
    files.sort_by { |x| File.basename(x, '.*').to_i }
  end

  def self.find_file_by(name)
    id = guide_files.index { |x| x =~ /#{name}.md/ }
    guide_files[id]
  end

  def self.guides_path
    Rails.root.join('app', 'views', 'guides', 'published').to_s
  end

  # Content retrieval
  def self.extract_data_from(file)
    {
        content: File.read(file),
        permalink: File.basename(file, '.*')
    }.merge(yaml_frontmatter_metadata_from(file))
  end

  def self.yaml_frontmatter_metadata_from(file)
    YAML.load_file(file)
  end

  def remove_yaml_frontmatter_from(text)
    text.sub(/^\s*---(.*?)---\s/m, "")
  end
end