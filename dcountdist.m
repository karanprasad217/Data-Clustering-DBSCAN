function [C]=dcount(X,eps,MinP,text)

    C=0;
    
    n=size(X,1);
    Kab=zeros(n,1);
    
    dist='euclidean';
   switch(text)
   case 1 
      dist='cityblock';
   case 2 
      dist='seuclidean';
   case 3 
      dist='minkowski';
   case 4
      dist='hamming';
   case 5 
      dist='chebychev';
   otherwise
      dist='euclidean';
   end
   
    
    D=pdist2(X,X,dist);
    
    alreadyin=false(n,1);
    alnoise=false(n,1);
    
    for i=1:n
        if ~alreadyin(i)
            alreadyin(i)=true;
            
            Neighbors=RegionQuery(i);
            if numel(Neighbors)<MinP
                % X(i,:) is NOISE
                alnoise(i)=true;
            else
                C=C+1;
                ExpandCluster(i,Neighbors,C);
            end
            
        end
    
    end
    
    function ExpandCluster(i,Neighbors,C)
        Kab(i)=C;
        
        k = 1;
        while true
            j = Neighbors(k);
            
            if ~alreadyin(j)
                alreadyin(j)=true;
                Neighbors2=RegionQuery(j);
                if numel(Neighbors2)>=MinP
                    Neighbors=[Neighbors Neighbors2];   %#ok
                end
            end
            if Kab(j)==0
                Kab(j)=C;
            end
            
            k = k + 1;
            if k > numel(Neighbors)
                break;
            end
        end
    end
    
    function Neighbors=RegionQuery(i)
        Neighbors=find(D(i,:)<=eps);
    end

end



