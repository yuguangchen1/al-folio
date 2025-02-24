
img0=mrdfits('../redux/M104_b_20_007.fits')
img0=img0-median(img0)
img0=(img0> (-3*stddev(img0)))< 3*stddev(img0)
simg0=frebin(img0,51,51)

readcol,'../cal/b.list',fn,format='a'

xshift=fltarr(n_elements(fn))
yshift=fltarr(n_elements(fn))
for i=0,n_elements(fn)-1 do begin
	img=mrdfits('../redux/'+fn[i])
	img=(img> (-3*stddev(img)))< 3*stddev(img)
	img=img-median(img)
	simg=frebin(img,51,51)
	sz=size(img,/dimension)

	dx=fltarr(51,51)
	dy=fltarr(51,51)
	for ii=0,49 do begin
		dx[ii,*]=ii-25
		dy[*,ii]=ii-25
	endfor
	grid=fltarr(51,51)
	for xx=0,50 do begin
		for yy=0,50 do begin
		
			newimg=fshift(simg,dx[xx,yy],dy[xx,yy])

			grid[xx,yy]=rms(simg0-newimg)
		endfor
	endfor
	q=where(grid eq min(grid))
	x_best=dx[q[0]]/51.*sz[0]
	y_best=dy[q[0]]/51.*sz[1]


	dx=fltarr(15,15)
	dy=fltarr(15,15)
	for ii=0,14 do begin
		dx[ii,*]=x_best-ii+8
		dy[*,ii]=y_best-ii+8
	endfor
	grid=fltarr(15,15)
	for xx=0,14 do begin
		for yy=0,14 do begin
		
			newimg=fshift(img,dx[xx,yy],dy[xx,yy])

			grid[xx,yy]=rms(img0-newimg)
		endfor
	endfor
	q=where(grid eq min(grid))
	x_best=dx[q[0]]
	y_best=dy[q[0]]

	if fn[i] eq '' then begin
		newimg=fshift(img,x_best,y_best)
		writefits,'tmp.fits',img0-newimg
		spawn,'ds9 tmp.fits &'
		stop
	endif


	xshift[i]=x_best
	yshift[i]=y_best
endfor

writecol,'../redux/shift_b.list',fn,xshift,yshift

end
