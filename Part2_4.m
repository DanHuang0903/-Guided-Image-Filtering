%   This is the main file of Part2_4.
%   It calls function guidedFilter()
%   Outputs are images through guided filter with different radii and
%   weights
%   Author: Dan Huang

clear;
tic;
%p is the input
r=imread('test.jpg');
%r=imresize(r,0.3);
s=imrotate(r,-90);
s=double(s);

%p=rgb2gray(o);


%Normalize the input to 0-1.
s(:,:,1)=s(:,:,1)/255;
s(:,:,2)=s(:,:,2)/255;
s(:,:,3)=s(:,:,3)/255;

%I is the guidance image which is the same with the input is this case.
Ir=double(s(:,:,1));
Ig=double(s(:,:,2));
Ib=double(s(:,:,3));



%Call function guidedFilter to compute q with different window sizes and
%weights.
%{
q1=guidedFilter(Ir,pr,2,0.1^2);
q2=guidedFilter(Ir,pr,2,0.2^2);
q3=guidedFilter(Ir,pr,2,0.4^2);

q4=guidedFilter(Ir,pr,4,0.1^2);
q5=guidedFilter(Ir,pr,4,0.2^2);
q6=guidedFilter(Ir,pr,4,0.4^2);

q7=guidedFilter(Ir,pr,8,0.1^2);
q8=guidedFilter(Ir,pr,8,0.2^2);
q9=guidedFilter(Ir,pr,8,0.4^2);
t=guidedFilter(Ir,pr,6,0.1^2);
%}
s(:,:,1)=guidedFilter(Ir,s(:,:,1),10,0.03^2);
s(:,:,2)=guidedFilter(Ig,s(:,:,2),10,0.03^2);
s(:,:,3)=guidedFilter(Ib,s(:,:,3),10,0.03^2);
%{
figure(1),
subplot(3,3,1);imshow(q1);title('r=2, e=0.1^2');
subplot(3,3,2);imshow(q2);title('r=2, e=0.2^2');
subplot(3,3,3);imshow(q3);title('r=2, e=0.4^2');
subplot(3,3,4);imshow(q4);title('r=4, e=0.1^2');
subplot(3,3,5);imshow(q5);title('r=4, e=0.2^2');
subplot(3,3,6);imshow(q6);title('r=4, e=0.4^2');
subplot(3,3,7);imshow(q7);title('r=8, e=0.1^2');
subplot(3,3,8);imshow(q8);title('r=8, e=0.2^2');
subplot(3,3,9);imshow(q9);title('r=8, e=0.4^2');
suptitle('Part2(4)');
%}


figure(2),
r=imrotate(r,-90);
subplot(1,2,1);imshow(r);title('Before');
subplot(1,2,2);imshow(s);title('After');
toc;