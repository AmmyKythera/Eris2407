require 'backports'
class Markov
	
	def initialize()
		@hash = Hash.new
		@@rand = Random.new
		
		#give our random object the ability to make weighted choices
		#weights is an array of weights, will return 
		def @@rand.weighted(weights,values=nil)
			totals = []
			running_total = weights.each.with_index.inject{|s,(e,i)| totals.push([s+e,i]); s+e}			
			
			r = self.rand(running_total)
			#this is dumb but it works
			i = totals.bsearch{|x| x[0]>r}[1]
			if values
				return values[i]
			end
			return i
		end
	end
	
	# Appends a phrase mapping (phr1->phr2) count to the map
	def add(phr1, phr2)
		if !@hash[phr1]
			@hash[phr1] = Hash.new(0)
		end
		@hash[phr1][phr2]++
	end
	
	# Returns a weighted random "next" phrase given a source phrase
	def rand_next(phr)
		
	end
	
end