
readcol,'../cal/b.list',fn,format='a'

window,xs=500,ys=500
for i=0,n_elements(fn)-1 do begin
	img=mrdfits('../cal/'+fn[i])
	max=median(img)+3*stddev(img)
	min=median(img)-3*stddev(img)
	cgimage,(img>min)<max,/axes,title=fn[i]

	stop

endfor

end
