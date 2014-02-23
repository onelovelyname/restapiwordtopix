class WordsController < ApplicationController

  # Make these helpers available to the view too
  helper_method :word, :words

  respond_to :html, :json, :xml
    
  def index
    respond_with words
  end

  def show
   # w = Word.where(worddate: Time.now.strftime("%m/%d/%Y")) 
   
    @word = Word.find(params[:id]) 
    respond_with (@word.to_json( :include => :photos))

  end

  def today
    w = Word.where(worddate: Time.now.strftime("%m/%d/%Y"))
      
    respond_with w.to_json("single" => true)
  end 

  def create
    word.save
    respond_with word
  end

  def update
    word.update_attributes(params[:word])
    respond_with word
  end

  def destroy
    word.destroy
    respond_with word
  end
  
  private
  
  def word
    # If the action is new or create...
    if @word = params[:action] =~ /new|create/
      Word.new(params[:word])
    else
      Word.find(params[:id])
    end
  end

  def words
    @words = Word.all
  end


end
