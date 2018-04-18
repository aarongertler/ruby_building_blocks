require "caesar" # Will look for ../lib/caesar.rb by default, can also find if in same folder

describe "#convert" do
	context "without wrap-arounds" do
		it "shifts a capital letter over in the alphabet" do
			c = convert("A", 1)
			expect(c).to eq("B")
		end

		it "shifts a lower-case letter over in the alphabet" do
			c = convert("a", 1)
			expect(c).to eq("b")
		end
	end

	context "with wrap-arounds" do
		it "wraps from a to z" do
			expect(convert("z", 1)).to eq("a")
		end

		it "wraps from A to Z" do
			expect(convert("Z", 1)).to eq("A")
		end
	end
end