#using python interface for Julia
using PyCall

#to test math functions and data strucrts from Python to Julia
@pyimport math

#using @test for unit testing

#test using Python Lists in Julia
let x = PyObject(test[1,2])

	@test pop!(x) == 2
	@test collect(x) == 1
	@time collect(x)
	@test collect(push!(x, 2)) == [1,2]
	@test collect(append!(x, 3,4,5)) == [1,2,3,4,5]
	@time append!(x, 3,4,5)
	@test collect(prepend!(x,0)) == [0,1,2,3,4,5]
	@test collect(pop!(x)) == [0,1,2,3,4]
	@time pop!(x)
	@test collect(append!(x,x)) == [0,1,2,3,4,0,1,2,3,4]

#quick test for strings
let y = PyObject(test2[one,two])

	@test collect(y) == [one,two]
	@test collect(push!(y,three)) == [one,two,three]
	@time push!(y,three)
	@test collect(pop!(y)) == [one,two]

	#this test above fails for some reason, probably wrong syntax

#basic matrix tests

	@test [10,20] + [10,20] == [30,30]
	@test [10,20] - [10,20] == [0,0]


#math sin functions

@test math.sin(math.pi / 4 - sin(pi / 4)) == 0
@test math.pi - pi == 0
@test math.pi/2 - pi/2 == 0

@test math.pow(2,2) == 4
@time math.pow(2,2)
#using Python syntax to run basic function

let x = 5
py"""
def testFunction(x):
	return 2 * x
"""
	@test py"testFunction"(5) == 10
	@time py"testFunction"(5)
	@test py"testFunction"(0) == 0

#passing Julia variable in python function

let x = 2
py"""
def testFunction2(x):
	return x * $x
"""

	@test py"testFunction2"(5) == 10
	# 2 * x
	@test py"2 * $x" == 4
	@time py"2 * $x" 






