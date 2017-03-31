module WikiData

  def self.wiki_title
    title = []
    intro = ["The Life and Times of", "A Exhaustive History of", "The Secrets behind", "The Humble Beginnings of ", "A Brief Summary of", "10 Things You Don't Know About", "An Elementary Primer to", "Everything You've Ever Wanted To Know About", "Surprise Your Friends With Your Knowledge of"]
    subject = ["Colditz Castle", "Marie Curie", "Jerry Seinfeld", "the Cotton Gin", "Alan Turing", "The Revolutionary War", "London, England", "Naples, Italy", "Mount Vesuvius", "Julius Caeser", "Napoleon", "Pluto, the Planet","Pluto, the Dog", "Mickey Mouse"]
    title << intro.sample
    title << subject.sample
    title.join(" ")
  end

  def self.wiki_body
    "Ristretto coffee, and cultivar froth so, bar, steamed strong ut trifecta sweet crema whipped. Mazagran, organic extra espresso cream, iced crema cultivar java cappuccino beans cup id sweet brewed. White, caramelization extraction caffeine rich brewed, single origin lungo est wings pumpkin spice cup at, as espresso, ristretto grounds espresso rich medium. Plunger pot con panna bar latte coffee decaffeinated, redeye galão sweet trifecta instant, cup to go that rich variety extraction."
  end

end
