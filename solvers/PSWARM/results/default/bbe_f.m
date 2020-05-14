%            b     blue          .     point              -     solid
%            g     green         o     circle             :     dotted
%            r     red           x     x-mark             -.    dashdot 
%            c     cyan          +     plus               --    dashed   
%            m     magenta       *     star             (none)  no line
%            y     yellow        s     square
%            k     black         d     diamond
%            w     white         v     triangle (down)
%                                ^     triangle (up)
%                                <     triangle (left)
%                                >     triangle (right)
%                                p     pentagram
%                                h     hexagram
%         


clear all;


%------------------------------------%
fid = fopen ( 'run.txt','r');
X=fscanf(fid,'%f%f');
fclose(fid);
X=reshape(X,2,length(X)/2);
X=X';

 
%------------------------------------%
% get the steps:
 
for i = 1:size(X,1)-1
     Y1(2*i-1,1)=X(i,1);
     Y1(2*i-1,2)=X(i,2);
     Y1(2*i,1)=X(i+1,1);
     Y1(2*i,2)=X(i,2);
 end
 
 Y1(2*size(X,1)-1,1)=X(size(X,1),1);
 Y1(2*size(X,1)-1,2)=X(size(X,1),2);
 
% 
% 
% 
% for i = 1:size(X,1)-1
%     Y2(2*i-1,1)=X(i,1);
%     Y2(2*i-1,2)=X(i,3);
%     Y2(2*i,1)=X(i+1,1);
%     Y2(2*i,2)=X(i,3);
% end
% 
% Y2(2*size(X,1)-1,1)=X(size(X,1),1);
% Y2(2*size(X,1)-1,2)=X(size(X,1),3);
% 
% 
% 
% 
% for i = 1:size(X,1)-1
%     Y3(2*i-1,1)=X(i,1);
%     Y3(2*i-1,2)=X(i,4);
%     Y3(2*i,1)=X(i+1,1);
%     Y3(2*i,2)=X(i,4);
% end
% 
% Y3(2*size(X,1)-1,1)=X(size(X,1),1);
% Y3(2*size(X,1)-1,2)=X(size(X,1),4);
%   
% 
% 
%------------------------------------%
 
L1=Y1(round(1+linspace(1,length(Y1)-1,11)),:);
% L2=Y2(round(13+linspace(1,length(Y2)-13,13)),:);
% L3=Y3(round(7+linspace(1,length(Y3)-7,12)),:);
% 
% %------------------------------------%
% 
hold on;
   
grid on;
%   
plot ( L1(:,1) , L1(:,2) , 'o', 'LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',7 ); 
% plot ( L2(:,1) , L2(:,2) , 'd', 'LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',7 ); 
% plot ( L3(:,1) , L3(:,2) , 'v', 'LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7 ); 
%  
%  
plot( Y1(:,1) , Y1(:,2) , 'r--' );
% plot( Y2(:,1) , Y2(:,2) , 'g--' );
% plot( Y3(:,1) , Y3(:,2) , 'b--' );
% 
%  
title ( 'STYRENE, f vs eval' );
%  
% axis ( [0 1000  0  100] );
%  
legend ( 'PSWARM default');
 
 
xlabel ( 'number of evaluations' );
ylabel ( 'objective' );
 
hold off;