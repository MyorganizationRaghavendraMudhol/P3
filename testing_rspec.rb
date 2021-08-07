
describe "User" do
  describe "first_name" do
    it "is the first part of the name" do
      user = users(:johnq)

      expect(user.first_name).to eq("John")
    end
  end
end