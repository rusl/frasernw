class Review < Version
  default_scope { where(to_review: true) }

  def accept
    self.toggle(:to_review)
  end

  def item
    eval("#{item_type}.find(#{item_id})")
  end
end
