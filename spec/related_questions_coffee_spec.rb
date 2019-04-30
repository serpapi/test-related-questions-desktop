describe "SerpApi Desktop JSON" do

  describe "Related Questions for Coffee" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Coffee&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["related_questions"]).to be_an(Array)
    end

    describe "have a question" do

      before :all do
        @question = @json["related_questions"][0]
      end

      it "has title from Time" do
        expect(@question["title"]).to_not be_empty
      end

      it "links Time" do
        expect(@question["link"]).to_not be_empty
      end

      it "has a snippet" do 
        expect(@question["snippet"]).to_not be_empty
      end

    end

  end

end