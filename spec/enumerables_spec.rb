require "enumerables"

describe Enumerable do
	describe "#my_each" do
		it "returns all values in array" do
			expect([1,2,3].my_each { |num| num + 1}).to eq([1,2,3])
		end
	end

	describe "#my_select" do
		it "selects matching values in array" do
			expect([1,2,3,4].my_select { |num| num % 2 == 0}).to eq([2,4])
		end

		it "returns no values when nothing matches" do
			expect([1,2,3,4].my_select { |num| num > 4}).to eq([])
		end
	end

	describe "#my_map" do
		it "adjusts all values in array" do
			expect([1,2,3].my_map { |num| num + 1}).to eq([2,3,4])
		end

		# add_three = Proc.new { |n| n + 3}
# puts [1,2,3].my_map(add_three).to_s # [4,5,6]

		let(:add_three) { Proc.new { |n| n + 3}} # This goes outside the "it" block!

		it "responds correctly to a proc" do
			expect([1,2,3].my_map(add_three)).to eq([4,5,6])
		end
	end
end