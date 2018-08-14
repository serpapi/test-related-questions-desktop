describe "SerpApi Desktop JSON" do

  describe "Related Questions for Kraken" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Kraken+Wikipedia&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["related_questions"]).to be_an(Array)
    end

    describe "have \"What is a kraken octopus?\" question" do

      before :all do
        @question = @json["related_questions"].detect{|e| e["question"] == "What is a kraken octopus?"}
      end

      it "has correct title" do
        expect(@question["title"]).to eql("Kraken - Wikipedia")
      end

      it "links correct website" do
        expect(@question["link"]).to eql("https://en.wikipedia.org/wiki/Kraken")
      end

      it "has a snippet" do 
        expect(@question["snippet"]).to_not be_empty
      end

      it "includes krɑːkən pronunciation" do 
        expect(@question["snippet"]).to include("krɑːkən")
      end

    end

    describe "have \"Where is Kraken located?\" question" do

      before :all do
        @question = @json["related_questions"].detect{|e| e["question"] == "Where is Kraken located?"}
      end

      it "has correct title" do
        expect(@question["title"]).to eql("Kraken (bitcoin exchange) - Wikipedia")
      end

      it "links correct website" do
        expect(@question["link"]).to eql("https://en.wikipedia.org/wiki/Kraken_(bitcoin_exchange)")
      end

      it "has a snippet" do 
        expect(@question["snippet"]).to_not be_empty
      end

      it "includes \"°\"" do 
        expect(@question["snippet"]).to include("°")
      end

    end

  end

end
