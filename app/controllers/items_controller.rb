class ItemsController < ApplicationController
  before_action :require_user_logged_in

  def new
    @items = []

    @keyword = params[:keyword]
    if @keyword.present? # 
      results = RakutenWebService::Books::Game.search({
        title: @keyword,
        booksGenreId: '006',
        hits: 20,
      })

      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end

  private

  def read(result)
    code = result['jan']
    name = result['title']
    url =  result['itemUrl']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
end