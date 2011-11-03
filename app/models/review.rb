class Review < Version
  default_scope { where(to_review: true) }

  def reject!
    item_type.constantize.paper_trail_off
    if event == 'create'
      item.destroy
    else
      object = review.reify
      object.save!
    end
    item_type.constantize.paper_trail_on
  end
end
