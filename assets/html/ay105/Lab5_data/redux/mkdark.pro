
fn=file_search('../raw/Dark_02_*.FIT')

for i=0,n_elements(fn)-1 do begin
	img=mrdfits(fn[i],0,hdr)
	if i eq 0 then begin
		sz=size(img,/dimension)
		data=fltarr(sz[0],sz[1],n_elements(fn))
	endif
	data[*,*,i]=img

endfor

dark=fltarr(sz[0],sz[1])
for i=0,sz[0]-1 do begin
	for j=0,sz[1]-1 do begin
		dark[i,j]=mean(data[i,j,*])
	endfor
endfor

if file_test('../cal/dark_02.fits') then begin
	spawn,'rm ../cal/dark_02.fits'
endif
mwrfits,dark,'../cal/dark_02.fits'
spawn,'ds9 ../cal/dark_02.fits &'

end

