require 'rspec'
require 'fizzbuzz'

describe Fizzbuzz do 
	let(:fiz) {Fizzbuzz.new}

	it "should return fizz when a number is divisable by 3" do
		expect(fiz.div(3)).to eq('fizz')
		expect(fiz.div(6)).to eq('fizz')
	end

	it "should return buzz when a number is divisiable by 5" do 
		expect(fiz.div(5)).to eq('buzz')
		expect(fiz.div(10)).to eq('buzz')
	end

	it "should return the number when a number is not divisiable by 3 or 5" do 
		expect(fiz.div(2)).to eq('2')
	end

	it "should return the fizzbuzz when a number is both divisiable by 3 and 5" do 
		expect(fiz.div(15)).to eq('fizzbuzz')
	end

end 