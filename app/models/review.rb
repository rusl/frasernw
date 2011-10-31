class Review < Version
  default_scope { where(to_review: true) }
end
