class ArticleResource < JSONAPI::Resource
  include JSONAPI::Authorization::PunditScopedResource

  has_many :comments, acts_as_set: true
  has_many :tags
  has_one :author, class_name: 'User'

  primary_key :external_id

  def self.verify_key(key, _context = nil)
    key && String(key)
  end

  def id=(external_id)
    _model.external_id = external_id
  end
end
