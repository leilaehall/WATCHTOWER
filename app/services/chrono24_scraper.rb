class Chrono24Scraper
  attr_reader :results, :price_range, :mean, :url, :pages, :median

  def initialize(watch, watch_brand: nil, year: nil, min_price: nil, max_price: nil )
    @brand = watch_brand || watch.watch_brand || 'search'
    @watch_model = watch.watch_model
    @min_price = min_price ? "&priceFrom=#{min_price}" : ""
    @max_price = max_price ? "&priceTo=#{max_price}" : ""
    @year = year ? "&yearBought=#{year}" : ""
    @url = "https://www.chrono24.com/#{@brand}/index.htm?dosearch=true&pageSize=120&query=#{@watch_model}&showPage=%d" + @min_price + @max_price + @year
  end

  def scrape
    html_file = open(@url % [1]).read
    html_doc = Nokogiri::HTML(html_file)
    @results = []
    html_doc.search('.total-count').each do |element|
      @pages = element.text.gsub(/\D/, '').to_f./(120).ceil
    end

    [@pages, 5].min.times do |page|
      html_file = open(@url % [page+1]).read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.article-price strong').each do |element|
        price = element.text.strip.gsub(/\D(\d+)\D?(\d*)/, '\1\2').to_i
        @results << price unless price == 0
      end
    end

    @price_range = @results.minmax
    @mean = @results.inject { |sum, next_result| sum + next_result } / @results.size
    @median = @results[@results.size/2]
  end
end

