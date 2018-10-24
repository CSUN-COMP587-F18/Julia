#Testing the ranges of input values for plotting graphs. 

using Winston
#Packaget to help display plotting of graphs. 

# plot some data(x values range from 0-500 and y values 
pl = plot(cumsum(rand(500) .- 0.5), "r", cumsum(rand(500) .- 0.5), "b")
# display the plot (not done automatically/only with winston)
display(pl)

p2 = plot(cumsum(rand(500) .- 0.5), "r", cumsum(rand(500) .- 0.5), "b")
display(p2)

p3 = plot(cumsum(rand(500) .- 0.5), "r", cumsum(rand(500) .- 0.5), "b")
display(p3)



# save the current figure
savefig("winston.svg")

# we used svg here because it respects the width and height specified above
