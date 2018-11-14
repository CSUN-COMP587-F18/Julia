#factcheck is a basic testing package for Julia. Can be applied to property based testing.
#Using basic fact check funtions. 
using FactCheck

facts("Messages") do
    x = [1, 2, 3, 4]
    y = [4, 2, 3, 1]
    for i in 1:4
        @fact x[i] --> y[i] "mismatch at i=$i"
    end
end
#fact test returs mismatch at i = 1 & 4


@fact 2 + 1e-5 --> roughly(2.0)
@fact 9.5 --> roughly(10; atol=1.0)
A = [2.0, 3.0]
B = (1 + 1e-6)*A
@fact A --> roughly(B)

#can test for rough estimates of outputs. Returns fact as true if in range of 1.0



