class Fizzbuzz
	def div(a)
		if a%3 ==0 and a%5 == 0
			"fizzbuzz"
		elsif a%3 == 0
			"fizz" 
		elsif a%5 == 0
			"buzz"
		else
			"#{a}"
		end
	end
end
