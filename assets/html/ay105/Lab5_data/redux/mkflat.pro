
fn=file_search('../raw/flat*.FIT')

dark=mrdfits('../cal/dark_02.fits',0,hdr)

for i=0,n_elements(fn)-1 do begin
	img=mrdfits(fn[i],0,hdr)
	if i eq 0 then begin
		sz=size(img,/dimension)
		data=fltarr(sz[0],sz[1],n_elements(fn))
	endif
	img=img-dark
	img=img/median(img)
	data[*,*,i]=img
endfor

flat=fltarr(sz[0],sz[1])
for i=0,sz[0]-1 do begin
	for j=0,sz[1]-1 do begin
		flat[i,j]=mean(data[i,j,*])
	endfor
endfor

writefits,'../cal/flat.fits',flat
spawn,'ds9 ../cal/flat.fits &'


end
