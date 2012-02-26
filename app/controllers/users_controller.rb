class UsersController < ApplicationController
  def index
  end

  def show
    @tweets = []

    @translator = BingTranslator.new('3332158A9269231BFC06E6E72F219DC51973B8F5')
    
    supported_languages = @translator.supported_language_codes

    language = request.env["HTTP_ACCEPT_LANGUAGE"].split(",")[0] || nil

    @supported = supported_languages.include? language

    Rails.logger.info "supported language: " + @supported.to_s

    5.times do |element|
      result = Twitter.user_timeline(params[:id]).fetch(element)
      tweet = Tweet.find_by_id_str(result.attrs["id_str"]) || Tweet.create(id_str: result.attrs["id_str"], text: result.text, user_id: params[:id].downcase)

      if @supported
        translated_tweet =  Translation.find(:first, :conditions => ["tweet_id = ? AND language = ?", tweet.id, language]) || Translation.create(text: @translator.translate( result.text, to: language), language: language, tweet_id: tweet.id)
        @tweets << translated_tweet.text
      else 
        @tweets << tweet.text
      end
    end

    @tweets

  end
end
