# Mohammad Asif Zaman
# Date: June, 2018

# A very simple function to display a progress bar for a loop.
# Can be easily integrated in jupyter notebook.


# A simple code to test the progress_bar function.

using PyCall
using PyPlot

include("progress_bar.jl");

max_count = 40;    # define maximum count of the loop
Nblock = 20;       # number of blocks in the bar plot

for i = 1:max_count
    progress_bar(i,max_count,Nblock);

    for k = 1:5e6    end   # delay loop. sleep() command causes some unexpected issues.

end
