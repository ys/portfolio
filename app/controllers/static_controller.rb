class StaticController < ApplicationController
  before_filter :is_user!, :except => [:show, :index] 
  require 'open-uri'
  require 'rss'
  def show
    @page = params[:static]
    @rss = nil
    if @page =='inspiration'
      url = "http://dont.eatcupcak.es/rss"         # Argument for feed to parse via CMD
      content = ""              # Var to store feed content
      open(url) do |parse|
          content = parse.read
      end
      @rss = RSS::Parser.parse(content, true)
      @col1 =''
      @col2 =''
      @col3 =''
      @col4 =''
      i=0
      @rss.items.each do |item|
        case i
           when 0 then @col1 = @col1+ '<div class="blog">'+item.title+item.description+'</div>'
           when 1 then @col2 = @col2+ '<div class="blog">'+item.title+item.description+'</div>'
           when 2 then @col3 = @col3+ '<div class="blog">'+item.title+item.description+'</div>'
           when 3 then @col4 = @col4+ '<div class="blog">'+item.title+item.description+'</div>'
        end
        
        i=i+1 if i <=3
        i=0 if i>3
      end
    end
    render @page
  end
end