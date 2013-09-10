class Car
attr_accessor :car_color, :convertible
#class variable: broad variables describing all vehicles
#not a single vehicle	

	@@total_car_count = 0
	@@most_popular_color = {}
	@@car_types = {}
		
	def self.most_popular_color
		@@most_popular_color.each { |k, v| return k if v == @@most_popular_color.values.max }
	end

	def self.total_car_count
		@@total_car_count
	end

	def self.list_car_types
		all = ''
		@@car_types.each do |k, v|
		  all += "#{k} : #{v} " 
		end
		return all
	end

	def to_s()
		"I'm a #{@car_color} car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(car_color, type)
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@car_color = car_color
		@type = type

		if @@most_popular_color[:"#{@car_color}"] != nil
			@@most_popular_color[:"#{@car_color}"] += 1
		else 
			@@most_popular_color[:"#{@car_color}"] = 1
		end

		if @@car_types[:"#{@type}"] != nil
			@@car_types[:"#{@type}"] += 1
		else 
			@@car_types[:"#{@type}"] = 1
		end
	end

	def change_color(new_color)
		@@most_popular_color[:"#{new_color}"] += 1
		@@most_popular_color[:"#{@car_color}"] -= 1
		@car_color = new_color
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class Convertible < Car
	def initialize(car_color, type, roof_status)
		super(car_color, type)
		@roof_status = roof_status
	end

	def top_down
		@roof_status = "down" if @roof_status != "down"
	end

	def close_top
		@roof_status = "up" if @roof_status != "up"
	end

end


# puts Car.total_car_count
# c1 = Car.new
# puts Car.total_car_count
# c2 = Car.new
# puts Car.total_car_count
c1 = Car.new("red", "truck")
c2 = Car.new("red", "sedan")
c3 = Car.new("red", "sedan")
c4 = Car.new("champagne", "sedan")
# c5 = Car.new("red", "sedan")
# c6 = Car.new("blue", "sedan")
# c7 = Car.new("blue", "sedan")
# c8 = Car.new("blue", "sedan")
# c9 = Car.new("blue", "sedan")
# c10 = Car.new("blue", "truck")

conv = Convertible.new("red", "truck", "up")
conv.top_down
puts conv

# c9.change_color("red")
# c10.change_color("red")

# puts c10

best_color = Car.most_popular_color
c = Car.new(best_color, "sedan")
puts c.car_color

something = Car.list_car_types
puts something

# Car.most_popular_color
# best_color = Car.most_popular_color
# c = Car.new(best_color)
# puts c

# car_a = Car.new()
# car_b = Car.new()
# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b