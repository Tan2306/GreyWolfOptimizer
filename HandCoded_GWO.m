clear all
close all
clc

dim=5;%no. of variables
nwolf=10;
ub=20;
lb=10;
pop=rand(nwolf,dim).*(ub-lb) + (lb);
%we can make the objective function
%x^2
t=1;
a=2;

format short ;
alpha_pos=zeros(1,5);
alpha_fit=inf;

beta_pos=zeros(1,5);
beta_fit=inf;

gamma_pos=zeros(1,5);
gamma_fit=inf;

maxt=200;


while(t<maxt)
    
    for i=1:nwolf
        fitness=0;
        for j=1:dim
            fitness=fitness+pop(i,j).^2;
        end%gets fitness for every wolf
        %fprintf("%d\n",fitness);
        
        
        if(fitness<alpha_fit)
            alpha_pos=pop(i,:);
            alpha_fit=fitness;
        end
        if(fitness<beta_fit)
            beta_pos=pop(i,:);
            beta_fit=fitness;
        end
        if(fitness<gamma_fit)
            gamma_pos=pop(i,:);
            gamma_fit=fitness;
        end
        %here you get the best 3 positions within the population
    end
%         disp(alpha_pos);
%         disp(beta_pos);
%         disp(gamma_pos);
        
        a=2-t*(2/maxt);
        for i=1:nwolf
            
            for j=1:dim
                
                r1=rand();
                r2=rand();
                C=2*r2;
                D_alpha=abs(C*alpha_pos(j)-pop(i,j));
                A=2*a*r1-a;
                X1=alpha_pos(j)-A*D_alpha;
                
                r1=rand();
                r2=rand();
                C=2*r2;
                D_beta=abs(C*beta_pos(j)-pop(i,j));
                A=2*a*r1-a;
                X2=beta_pos(j)-A*D_beta;
                
                r1=rand();
                r2=rand();
                C=2*r2;
                D_gamma=abs(C*gamma_pos(j)-pop(i,j));
                A=2*a*r1-a;
                X3=gamma_pos(j)-A*D_gamma;
                
                pop(i,j)=(X1+X2+X3)/3;
                
                if pop(i,j)>ub
                    pop(i,j)=ub;
                end
                if pop(i,j)<lb
                    pop(i,j)=lb;
                end
                
            end
        end
        
    
    disp(["ITERATION=",num2str(t)]);
    disp(alpha_pos);
    t=t+1;
end

 

