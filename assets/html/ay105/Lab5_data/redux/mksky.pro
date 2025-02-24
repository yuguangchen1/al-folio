

readcol,'../cal/b_sky.list',fn,y1,y2,format='a,f,f'

for i=0,n_elements(fn)-1 do begin
	img=mrdfits('../cal/'+fn[i])
	sz=size(img,/dimension)
	if i eq 0 then begin
		data=fltarr(sz[0],sz[1],n_elements(fn))
	endif
	
	img=img/median(img)
	data[*,y1[i]:y2[i],i]=img[*,y1[i]:y2[i]]
endfor

sky=fltarr(sz[0],sz[1])
for i=0,sz[0]-1 do begin
	for j=0,sz[1]-1 do begin
		q=where(data[i,j,*] ne 0)
		sky[i,j]=median(data[i,j,q])
	endfor
endfor

writefits,'../cal/sky_b.fits',sky
spawn,'ds9 ../cal/sky_b.fits &'

end
