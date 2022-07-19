# GreyWolfOptimizer
A Matlab Code for Grey Wolf Optimizer. It is one of the best known nature based optimizers out there. Please read the README file for theoretical understanding. 

This algorithm relies on a strong analogy between the wolves and solutions

Here the number of wolves is the capable answers. No. of variables is the property of every wolf/answer.

We initialize a population table of dimensions mxn where m=no. of rows, n=no. of columns
No. of rows represent the wolves or the initial capable answers.
No. of columns represent the no. of values that each solution has. Can be regarded as the dimension of the function. 

The wolves alpha, beta and gamma represent the fittest 3 solutions of the population that was initialized.

The basic formulas that we use

        D_wolf=|C x X_prey - pop(i,j)|

        X_wolf(updated)=X_prey - A x D_wolf

        A=2 x a x r1 - a

        C= 2 x r2

        pop(i,j)=X alpha, beta,gamma mean


Here r1 and r2 are randomly generated numbers between 0 and 1.
This is done for individual part of the data.

X_prey= alpha or beta or gamma position.

pop(i,j)=mean of all X_wolf.

Here a is linearly decreased from 2 to 0.
a=2-t x (2 / max_iter)

A is dependent on a.  -2a <= A <= 2a
So here if 

A>1 or A<-1	A is under explorative mode. It is searching behind the wolf or way after the pre	
A<1 or A>-1	A is under exploitative mode. It is searching between the wolf and the prey 

C is just an exploitative initiative that is present at every step. It continues to have a sense of exploration at each iteration especially at the final convergence . The big thing that it does is that it prevents local optima stagnation, which is a big risk. It can get fooled with local optimums so C is needed.  

C>1 it emphasizes the effect of prey in defining the distance.
C<1 it deemphasizes the same.
0<C<2
It explores less and less as we converge to a solution.


The initial values we give to alpha_pos and other  main wolves are zero but we make their fitness as infinity
That is very interesting
As any answer would be better than that infinity. 
Conversely you can't do set it to zero for a maximization problem as you cannot be sure if the maximum value would be greater than zero or not.
So to maximize it, you can minimize the negative of the function.
