# Mohammad Asif Zaman
# Date: June, 2018

# A very simple function to display a progress bar for a loop.
# Can be easily integrated in jupyter notebook.


# Progress_bar function.
# To use as a separate file: Should be added as a progress_bar.jl file in the same folder as your code. In the main code, use: include("progress_bar.jl");
# It is necessary to have PyCall pakcage installed for the include command to work.
# To use in Jupyter notebook, just include the funciton in a cell and run it.

# Input arguments:
# current_step = current position in the loop. Use the loop index.
# total_step = total number of steps in your loop. Note that it is assumed that the loop starts from 1 and ends at total_step.
# Nbar = how many blocks you want to include in the progress bar.

# The code has been tested using Atom IDE and Jupyter notebook.



# A simple code to test the progress_bar function.

using PyCall


include("progress_bar.jl");

max_count = 30;    # define maximum count of the loop
Nblock = 50;       # number of blocks in the bar plot

println("Starting Program...");
tic()
for i = 1:max_count
    progress_bar(i,max_count,Nblock);

    for k = 1:5e6    end   # delay loop. sleep() command causes some unexpected issues.

end

println("\nFinished Running.");
toc();
