class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    respond_to do |format|
      if @word.save
        if user_signed_in?
          format.html { redirect_to @word, notice: 'Word was successfully created.' }
        else
          format.html { redirect_to "/?searchword="+@word.term, notice: 'Word was successfully created.' }
        end
        format.json { render :show, status: :created, location: @word }
      else
        if user_signed_in?
          format.html { render :new }
        else
          format.html { redirect_to "/", alert: @word.errors.full_messages.first }
        end
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:term, :term_definition, :term_acronym, :term_tags, :search_count)
    end
end
