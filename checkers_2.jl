#

julia> using Checkers
julia> f(x) = x^2
julia> @test_formany -10<x<10, f(x) >= 0
#Test Passed
  Expression: (:((-10 < x < 10, f(x) >= 0)), :(mode = test_formany))

julia> @test_forall x in -10:10, f(x) >= 0
#Test Passed
  Expression: (x in -10:10, f(x) >= 0)
    @test_forall x in 0:10, f(x) >= 0

julia> @test_forall x in -10:10, f(x) > 0 #Should fail b/c f(0) = 0
#Test Failed
  Expression: (x in -10:10, f(x) > 0)

#tests the conditional property of Julia
 julia> @test_formany ntests = 100 maxtests = 100_000 0 < x < 10,  0 < y < 10,  x < y --> x^2 < y^2
#100 test will be run
#Passes if 100 tests meet the crierea of holding true. Will fail becuase generating 100 pairs of x,y, some will bound to fail condition


#another test the conditional property of Julia
false. 
#100,000 tests will performed until 100 passing test
julia> @test_formany ntests = 100 maxtests = 100_000 0 < x < 10,  0 < y < 10,  x < y --> x^2 < y^2
#Same as top but will pass because 100000test will be performed.





