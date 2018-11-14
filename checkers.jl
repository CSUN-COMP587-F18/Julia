#Another auotmated testing package. First time trying it out

julia> using Checkers
julia> f(x) = x^2
julia> @test_formany -10<x<10, f(x) >= 0
Test Passed
  Expression: (:((-10 < x < 10, f(x) >= 0)), :(mode = test_formany))

julia> @test_forall x in -10:10, f(x) >= 0
Test Passed
  Expression: (x in -10:10, f(x) >= 0)
    @test_forall x in 0:10, f(x) >= 0

julia> @test_forall x in -10:10, f(x) > 0 #Should fail b/c f(0) = 0
Test Failed
  Expression: (x in -10:10, f(x) > 0)
ERROR: There was an error during testing


