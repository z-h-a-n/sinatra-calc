require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'


get '/' do
	erb :home
end

get '/basic_calc' do
	@operator = params[:operator]
	
	if @operator
		@first = params[:first].to_f
		@second = params[:second].to_f
		@result = case @operator
		when '+' then @first + @second
		when '-' then @first - @second
		when '*' then @first * @second
		when '/' then @first / @second
		end
	end
	erb :basic_calc
end

get '/power' do
	
	@power = params[:power].to_i
	if @power>0.0
		@num = params[:num].to_f
		@result_power = @num ** @power
	end
	erb :power
end

get '/sqrt' do
	@num = params[:num].to_f
	if @num > 0.0
		@result = (Math.sqrt(@num)).round(1)
	end
	erb :sqrt
end

get '/bmi' do
	@weight = params[:weight].to_f
	@height = params[:height].to_f
	if @height > 0.0
		@result_bmi = (@weight / @height**2).round(1)
	end

	erb :bmi
end

get '/mortgage' do
	@principal = params[:principal].to_f
	@int_rate = params[:int_rate].to_f
	@num_payments = params[:num_payments].to_i
	if @num_payments > 0
		@result_mort_calc = (@principal * (@int_rate * (1 + @int_rate)**@num_payments) / ((1+@int_rate)**@num_payments - 1)).round(0)
	end
	erb :mortgage
end

get '/trip_calc' do
	@d = params[:d].to_f
	@mpg = params[:mpg].to_f
	@cpg = params[:cpg].to_f
	@s = params[:s].to_f

	if @s >0.0
		if @s < 60
			@time = @d / @s
			@price = @d / @mpg * @cpg
		elsif @s >= 60
			@time = @d / @s
			if (@mpg - (@s - 60)*2) <= 0
				@price = @d / 1 * @cpg
			else
				@price = @d / (@mpg - (@s - 60)*2) * @cpg
			end
		end
	end		
	erb :trip_calc
end





