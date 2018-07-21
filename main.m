clc;
clear;
close all;
data=load('abcd10');
X=data.X;
n = 5;
while(n~=1 || n~=2 || n~=3 || n~=4 || n~=5 || n~=6)
   n=input('Choose from six options :\n 1. Select custom metrics for eps and minpts with iterations(fixed eps) \n 2. Select custom metrics for eps and minpts without iterations \n 3. Make a custom data set and proceed with 1 \n 4. Use a predefined dataset() \n 5. Select custom metrics for eps and minpts with iterations(fixed minpts) \n 6. Plot original dataset \n');
   switch n
   case 1
      eps = input('Enter the eps : ');
      MinP = input('Enter the Minp : ');
      text = input('\nEnter option for choosing distance type in dbscan:\n1. Cityblock \n2. Sq. eculidean \n3. Minkowski \n4. Hamming \n5. Chebychev \n6. Euclidean\n');
      for Min = 1:4
           MinX(Min)=MinP;
           %disp (MinX);
           IDX=dbscandist(X,eps,MinP,text);
           y(Min) = dcountdist(X,eps,MinP,text);
           figure, hold on
           plotit(X, IDX);
           title(['Implementing dbscan Clustering Algorithm (eps = ' num2str(eps) ', MinP = ' num2str(MinP) ')']);
           MinP = MinP + 2;
      end
      figure();
      for Min = 1:4
          v(Min) = y(Min);
          z(Min) = MinX(Min);
         %y(MinP) = y;
      end
      disp(y);
      disp(z);
      [as,is] = sort(y);
      plot(as,z(is),'r-',y,z,'x');
      xlabel('Number of Cluster');
      ylabel('Minimun Points');
   case 2
      eps = input('Enter the eps : ');
      MinP = input('Enter the Minp : ');
      IDX=dbscan(X,eps,MinP);
      y = dcount(X,eps,MinP);
      disp(y);
      plotit(X, IDX);
      title(['Implementing dbscan Clustering Algorithm (eps = ' num2str(eps) ', MinP = ' num2str(MinP) ')']);
      %IDX2=dbscan(X,10,10);
      %plotit(X, IDX2);
   case 3
       eps = input('Enter the eps : ');
      MinP = input('Enter the Minp : ');
      IDX=dbscan(X,eps,MinP);
      plotit(X, IDX);
      title(['Implementing dbscan Clustering Algorithm (eps = ' num2str(eps) ', MinP = ' num2str(MinP) ')']);
   case 5
      eps = input('Enter the eps : ');
      MinP = input('Enter the Minp : ');
      text = input('\nEnter option for choosing distance type in dbscan:\n1. Cityblock \n2. Sq. eculidean \n3. Minkowski \n4. Hamming \n5. Chebychev \n6. Euclidean\n');
      for Min = 1:4
           MinX(Min)=eps;
           %disp (MinX);
           IDX=dbscandist(X,eps,MinP,text);
           y(Min) = dcountdist(X,eps,MinP,text);
           figure, hold on
           plotit(X, IDX);
           title(['Implementing dbscan Clustering Algorithm (eps = ' num2str(eps) ', MinP = ' num2str(MinP) ')']);
           eps = eps + 0.1;
      end
      figure();
      for Min = 1:4
          v(Min) = y(Min);
          z(Min) = MinX(Min);
         %y(MinP) = y;
      end
      disp(y);
      disp(z);
      [as,is] = sort(y);
      plot(as,z(is),'r-',y,z,'x');
      xlabel('Number of Cluster');
      ylabel('Epislon');
  case 6 
      df = load('abcd10'); %# assume this contains a matrix called figureinfo
      x = df.X(:,1); %# numbers from all rows, column 1, into X
      y = df.X(:,2); %# numbers from all rows, column 2, into Y
      figure, hold on
      plot(x,y,'+');
     otherwise
      fprintf('The choice does not exist. Please try again\n');
   end
end


%main
%eps=0.2;
%eps = input('Enter the eps : ');
%MinP=10;
%MinP = input('Enter the Minp : ');

%IDX=dbscan(X,eps,MinP);

%plot

%plotit(X, IDX);
%title(['Implementing dbscan Clustering Algorithm (eps = ' num2str(eps) ', MinP = ' num2str(MinP) ')']);
