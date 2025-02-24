
fn=file_search('../raw/M104*.FIT')

dark=mrdfits('../cal/dark_20.fits')
flat=mrdfits('../cal/flat.fits')

for i=0,n_elements(fn)-1 do begin
	img=mrdfits(fn[i],0,hdr)
	img=img-dark
	img=img/flat

	newfn='../cal/'+file_basename(fn[i],'.FIT')+'.fits'
	writefits,newfn,img,hdr
endfor

end
