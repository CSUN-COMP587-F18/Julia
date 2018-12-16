using Test
using Pkg

	#testings adding and removing package functions work
	#Julia has a test package called Example

	#see if IJulia Package installed
	@test !isinstalled(IJulia)

Pkg.add(IJulia)
	@test isinstalled("IJulia")

Pkg.add("Example")
	@test isinstalled(Example)

#list all packages
Pkg.status()
	#IJulia
	#Example

Pkg.rm("IJulia")
	@test isinstalled(IJulia)
	#returns false

Pkg.status()
	#Example

Pkg.test(Example; coverage =true)

Pkg.addI("IJulia")
Pkg.test(IJulia; coverage = true)
Pkg.Status()
	#Example
	#IJulia
	

