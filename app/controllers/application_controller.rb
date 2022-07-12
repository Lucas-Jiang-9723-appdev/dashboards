class ApplicationController < ActionController::Base
  def homepage
    render({:template => "home.html.erb"})
  end
  
  def forex_subhome
    @raw_forex = open("https://api.exchangerate.host/symbols").read
    @parsed_forex = JSON.parse(@raw_forex)
    @symbol_hash = @parsed_forex.fetch("symbols")
    @array_symbol = @symbol_hash.keys
    render({:template => "forex_subhome.html.erb"})
  end 
  def forex_2ndlayer
    @symbol = params.fetch("the_symbol")
    @raw_forex = open("https://api.exchangerate.host/symbols").read
    @parsed_forex = JSON.parse(@raw_forex)
    @symbol_hash = @parsed_forex.fetch("symbols")
    @array_symbol = @symbol_hash.keys
    render({:template => "forex_2ndlayer.html.erb"})
  end
  
  def forex_3rdlayer
    @from_currency = params.fetch("from")
    @to_currency = params.fetch("to")
    @raw_exchange = open("https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}").read
    @parsed_exchange = JSON.parse(@raw_exchange)
    @rate = @parsed_exchange.fetch("result")

    render({:template => "forex_3rdlayer.html.erb"})
  end
  
  def covid_subhome
    render({:template => "covid_subhome.html.erb"})
  end
end
