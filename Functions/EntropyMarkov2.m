function H=EntropyMarkov(P1,P2,p1,p2)
number_states=size(P1,1);

% Remark: you could also get an estimate of p(i) directly from the observations
% p(i) = sum( state == i )/T; 

% Markov entropy:
Hi = zeros(1,number_states); 
for row=1:number_states  
    Hi(row) = -p1(row)*sum( (P1(row,:)+eps).*log2(P1(row,:)+eps) );
end

H1 = sum(Hi)/log2(number_states);
%%%
number_states=size(P2,1);

% Remark: you could also get an estimate of p(i) directly from the observations
% p(i) = sum( state == i )/T; 

% Markov entropy:
Hi = zeros(1,number_states); 
for row=1:number_states  
    Hi(row) = -p2(row)*sum( (P2(row,:)+eps).*log2(P2(row,:)+eps) );
end

H2 = sum(Hi)/log2(number_states); 

H=abs(H1-H2);