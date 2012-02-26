class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @tweets = []

    translator = BingTranslator.new('3332158A9269231BFC06E6E72F219DC51973B8F5')

    language = request.env["HTTP_ACCEPT_LANGUAGE"].split(",")[0] || nil

    @supported = translator.supported_language_codes.include? language

    user = User.find_or_create_by_name params[:id]

    5.times do |element|
      result = Twitter.user_timeline(params[:id]).fetch(element)
      tweet = Tweet.find_or_create_by_id_str(result.attrs["id_str"], text: result.text, user_id: user.name)

      if @supported
        translated_tweet =  Translation.find_or_create_by_tweet_id_and_language(tweet.id, language)
        translated_tweet.text ||= translator.translate( result.text, to: language)
        translated_tweet.save!
        @tweets << {date: result.created_at, translation: translated_tweet}
      else 
        @tweets << {date: result.created_at, translation: tweet}
      end
    end

    @tweets

  end
end
