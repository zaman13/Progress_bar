# Progress_bar
A simple progress bar feature for Julia codes. It's a simple function that uses unicode characters to create the progress bar. The code is in a function form. So, it can be easily included in any julia codes/notebook.


# Usage
Copy-paste the function progress_bar() into your jupyter notebook. Compile/run it. Then just call it from your main program/function/loop.

The program can also be run as an external funciton. Copy-paste the code function in a new file and rename it as progress_bar.jl. 

## Main function
```julia
# Input arguments: 
# current_step = current position in the loop. Use the loop index.
# total_step = total number of steps in your loop. Note that it is assumed that the loop starts from 1 and ends at total_step.
# Nbar = how many blocks you want to include in the progress bar.

# Progress_bar function. 
# To use as a separate file: Should be added as a progress_bar.jl file in the same folder as your code. In the main code, use: include("progress_bar.jl");
# To use in Jupyter notebook, just include the funciton in a cell and run it. 

# Input arguments: 
# current_step = current position in the loop. Use the loop index.
# total_step = total number of steps in your loop. Note that it is assumed that the loop starts from 1 and ends at total_step.
# Nbar = how many blocks you want to include in the progress bar.


function progress_bar(current_step,total_step,Nblock)
    
    percentage = round(current_step*100/total_step,1);     # Calculate percentage completion
    
    print("\r") 
    if current_step == 1
        print("Progress = 0.0\% ");
        for i = 1:Nblock    
            print("\u2591");                      # Use the unicode character "light shade" to create the empty progress bar.
        end
        print("\r");
    end
    
    
    print("Progress = ",percentage, "\% ");         # Print percentage completion
   
    for i = 1:round(percentage*Nblock/100)        # Map the progress percentage to a 1 to Nblock grid.
        print("\u2593");                          # Use the unicode character "dark shade" to fill the progress bar.
    end

end


```


## Testing
The code can be tested using the following test program:

```julia
# Test program.

max_count = 40;    # define maximum count of the loop
Nblock = 20;       # number of blocks in the bar plot

for i = 1:max_count
    progress_bar(i,max_count,Nblock);
    
    for k = 1:5e6    end   # delay loop. sleep() command causes some unexpected issues.
   
end
```

If the delay between two successive calls of the progress_bar() function is very small, then the code can cause some problems. To solve this, we can include a check condition to make sure that there is a minimum time interval between two successive function calls. The following test code uses 100ms as the minimum time interval:

```julia
# An improved code to test the progress_bar function. June 2018.
# The time checking makes sure that the progress_bar() function is not called within
# a very short time. Current interval is set at 100ms. 
# This pause between successive calls helps to display the progress bar properly.

max_count = 45;    # define maximum count of the loop
Nblock = 20;       # number of blocks in the bar plot
t1 = 1000*((60*Dates.hour(now()) + Dates.minute(now()))*60 + Dates.second(now())) + Dates.millisecond(now());


for i = 1:max_count
     t2 = 1000*((60*Dates.hour(now()) + Dates.minute(now()))*60 + Dates.second(now())) + Dates.millisecond(now());

     if (t2 - t1 > 100)  || (i == max_count)                       # if ellapsed time > 100ms, then print progress bar
        progress_bar(i,max_count,Nblock);
        t1 = copy(t2);
    end
    
    
    for k = 1:5e6    end   # delay loop. sleep() command causes some unexpected issues.
   
end

```

Note that for slow running loops (those are the cases where the progress_bar is especially necessary), the first simple version of the test code works fine. 


# Preview
Progress = 32.5% ▓▓▓▓▓▓░░░░░░░░░░░░░
