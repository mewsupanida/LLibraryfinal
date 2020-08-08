json.extract! word, :id, :term, :term_definition, :term_acronym, :term_tags, :search_count, :created_at, :updated_at
json.url word_url(word, format: :json)
