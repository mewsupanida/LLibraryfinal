class WelcomeController < ApplicationController
   skip_before_action :verify_authenticity_token
  def index
    @top_words = Word.order(search_count: :desc, term: :asc).limit(20).offset(0)
    @word = Word.new
    if params[:searchword].present?
      word = Word.find_by("term ilike ? or term_acronym ilike ?", params[:searchword], params[:searchword])
      word ? @search_word = word : @search_word = "no_result"
      create_search_count = word.create_search_count(params[:ip]) if word.present? && params[:ip].present?
    end
    render template: "/welcome/index.html.erb", layout: "/layouts/front.html.erb"
  end

  def suggestions
    @terms = Word.pluck(:term).uniq
    @acronyms = Word.where.not(term_acronym: [nil, ""]).pluck(:term_acronym).uniq
    render :json => @terms+@acronyms
  end

  def add_tag
    word = Word.find_by(id: params[:word_id])
    if word.present?
      if word.term_tags.nil?
        word.update(term_tags: params[:termtags])
      else
        added_word = (word.term_tags.split(",") << params[:termtags]).join(",")
        word.update(term_tags: added_word)
      end
      redirect_to "/?searchword="+word.term, notice: "Tag Added successfully"
    else
      redirect_to root_path, alert: "Word not found"
    end
  end

end
