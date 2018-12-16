using Test

struct MyNumber
	x::Float64
end


for op = (:sin, :cos, :tan, :log, :csc, :sinpi, :cbrt, :mod2pi)
    eval(quote
        Base.$op(a::MyNumber) = MyNumber($op(a.x))
    end)
end
	
	#test using x = pi
	x = MyNumber(pi)

	@test cos(x) == MyNumber(-1.0)
	@time cos(x)
	# 0.025440 seconds (122.20 k allocations: 6.844 MiB, 11.69% gc time)
	#sin(x) should be 1.2246467991473532e-16
	@test sin(x) == MyNumber(1.2246467991473532e-16)
	@test tan(x) == MyNumber(-1.2246467991473532e-16)
	@test log(x) == MyNumber(1.1447298858494002)
	@time log(x)
	@test exp(x) == MyNumber(23.140692632779267)
	@test csc(x) == MyNumber(8.165619676597685e15)
	@time csc(x) 
	@test sinpi(x) == MyNumber(-0.43030121700009194)
	@test cbrt(x) == MyNumber(1.4645918875615231)
	
#test using an integer = 1
struct MyNumber
	y::Float64
end

	@test cos(y) == MyNumber2(0.5403023058681398)
	@test sin(y) == MyNumber2(0.8414709848078965)
	@test tan(y) == MyNumber2(1.5574077246549023)
	@test log(y) == MyNumber2(0.0)
	@time log(y)
	@test exp(y) == MyNumber2(2.718281828459045)

#test
