Using Checkers
using Math
using Test

f(x) = x^2
 @test_formany -10<x<10, f(x) >= 0
 @test_forall x in -10:10, f(x) >= 0

#based from the testing folder in Checkers
	@test_formany ntests = 100 maxtests = 100_000 0 < x < 10,  0 < y < 10,  x < y --> x^2 < y^2

#1000 test will be run
#Passes if 100 tests meet the crierea of holding true. Will fail becuase generating 100 pairs of x,y, some will bound to fail condition


#100,000 tests will performed until 100 passing test
	@test_formany ntests = 100 maxtests = 100_000 0 < x < 10,  0 < y < 10,  x < y --> x^2 < y^2
#Same as top but will pass because 100000test will be performed.


#another test the conditional property of Julia

	@test_formany ntests = 100 maxtests = 100_000 0 < x < 7,  8 < y < 80,  x < y --> x^2 < y^2
#Same as top but will pass because 100000test will be performed.

f(x) = sin(x)
	@test_formany -100<x<100, f(x) >= -1

f(x) = sin(x)*cos(x)
 @test_formany -100<x<100, -1< f(x) < 1

#test if tan is right
function tanTest(x)
	sin(x)/cos(x)
	end

	@test_forall -1000<x<1000, tanTest(x) == tan(x)

#sin^2(x) + cos^2(x) = 1
function pythagFormula(x)
       sin(x)^2 + cos(x)^2
       end

       @test pythagFormula(1) == 1
       @test_formany -10<x<20 , pythagFormula(x) == 1


#test sin(-x) = -sin(x)
function trigidentities(x)
       sin(-x)
       end

       @test_formany 0<x<100, trigidentities(x) == -sin(x)


#test cos(-x) = cos(x)
function trigidentities2(x)
       cos(-x)
       end

       @test_formany 0<x<100, trigidentities2(x) == cos(x)


 #test tan(-x) = -tan(x)
function trigidentities3(x)
       tan(-x)
       end

       @test_formany 0<x<100, trigidentities3(x) == -tan(x)


#calculate volume function
function sphere_vol(r)
return 4/3*pi*r^3
end

#testing for all numbers between 1 and 100
	@test_formany 1<r<1000,sphere_vol(r) > 0
#will pass


#calculate quadratic formula/checkers cannot handle passing more than 1 variable
function quadratic2(a::Float64, b::Float64, c::Float64)

    sqr_term = sqrt(b^2-4a*c)
    r1 = quadratic(a, sqr_term, b)
    r2 = quadratic(a, -sqr_term, b)
r1, r2
end

#Test Failed
#Expression: (:((1 < a < 20,1 < b < 20,1 < c < 20,quad(a,b,c) > 0)),:(mode = test_formany))

#function return input 
function stays(x)
       return x
       end

	@test_formany 1<x<10000, stays(x) == x

function additiveProperty(x)
       return x + 10
       end

	@test_formany 1<x<10000, additiveProperty(x) == 10 + x

function subtratProperty(x)
       return x - 10
       end

	@test_formany 1<x<10000, subtractProperty(x) == 10 - x

function multiplyProperty(x)
       return x * 10
       end

	@test_formany 1<x<10000, multiplyProperty(x) == 10 * x

	#associative property
	#cannot do this with checkers since it is only able to generate tests for one variable at a time
	#using Base Test package
	@test (1+2)+3 == 1 + (2 + 3)

function inverse(x)
	x + (-x)
	end

	@test_formany -1000<x<1000, inverse(x) == (-x) + x

function identity(x)
	x + 0
	end

	@test_formany -1000<x<1000, identity(x) == 0 + x

f(x) = 3x^6 - 7x + 1
	@test_exists 0<= x <=1, f(x) == 1

	#this gives an erro for some reason. What I am trying to test is that this test passes if at some point f(x) = 1 through 0<= x <=1.

#testing Periodicity of trig functions

 @test sin(1 + 2pi) == sin(1)
		Test Failed
  		Expression: sin(1 + 2pi) == sin(1)
  		 Evaluated: 0.8414709848078964 == 0.8414709848078965
ERROR: There was an error during testing


@test tan(1 + pi) == tan(1)
	  Test Failed
  	  Expression: tan(1 + pi) == tan(1)
   Evaluated: 1.5574077246549018 == 1.5574077246549023
ERROR: There was an error during testing


@test cos(1+2pi) == cos(1)
	  Test Failed
  	  Expression: cos(1 + 2pi) == cos(1)
   Evaluated: 0.5403023058681399 == 0.5403023058681398

#testing the double angle formula for sin
 @test sin(2*1) == 2*sin(1)*cos(1)
Test Failed
  Expression: sin(2 * 1) == 2 * sin(1) * cos(1)
   Evaluated: 0.9092974268256817 == 0.9092974268256818

















































































