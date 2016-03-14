require "administrate/base_dashboard"

class SeizureDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    taggings: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tagging"),
    base_tags: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tag"),
    tag_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    tags: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    id: Field::Number,
    date: Field::DateTime,
    length: Field::Number,
    notes: Field::Text,
    medicine_taken: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :taggings,
    :base_tags,
    :tag_taggings,
    :tags,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :taggings,
    :base_tags,
    :tag_taggings,
    :tags,
    :id,
    :date,
    :length,
    :notes,
    :medicine_taken,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :taggings,
    :base_tags,
    :tag_taggings,
    :tags,
    :date,
    :length,
    :notes,
    :medicine_taken,
  ]

  # Overwrite this method to customize how seizures are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(seizure)
  #   "Seizure ##{seizure.id}"
  # end
end
