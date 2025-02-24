
readcol,'../cal/b.list',fn,format='a'
sky=mrdfits('../cal/sky_b.fits')

for i=0,n_elements(fn)-1 do begin
	img=mrdfits('../cal/'+fn[i],0,hdr)
	
	img=img/median(img)-sky

	print,max(img),min(img),median(sky)
	writefits,'../redux/'+fn[i],img,hdr

endfor



end
