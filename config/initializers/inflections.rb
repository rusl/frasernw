# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural /^(focus)$/i, '\1es'
  # inflect.plural /^(ox)$/i, '\1en'
  inflect.singular /^(focus)es/i, '\1'
  # inflect.singular /^(ox)en/i, '\1'
  # inflect.irregular 'focuses', 'focus'
  # inflect.irregular 'person', 'people'
  # inflect.uncountable %w( fish sheep )
end
