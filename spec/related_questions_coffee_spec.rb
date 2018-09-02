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

    describe "have \"Is coffee really good for your health?\" question" do

      before :all do
        @question = @json["related_questions"].detect{|e| e["question"] == "Is drinking coffee good or bad for you?"}
      end

      it "has title from Time" do
        expect(@question["title"]).to eql("Coffee and health: What does the research say? - Mayo Clinic")
      end

      it "links Time" do
        expect(@question["link"]).to eql("https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/expert-answers/coffee-and-health/faq-20058339")
      end

      it "has a snippet" do 
        expect(@question["snippet"]).to_not be_empty
      end

    end

  end

end