function im=Thresholding(i)
  [r,c]=size(i);
  im=zeros(r,c);
  for a=1:r
      for b=1:c
          if i(a,b)>105
              im(a,b)=1;
          end
      end
  end
  im=bwareaopen(im,15);
  im=imfill(im,'holes');
end
