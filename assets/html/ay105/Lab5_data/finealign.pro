
readcol,'f814w.list',fn,format='a'
; read reference img #, chosen to have overlap
readcol,'ref_f814w.list',refnum,format='i'
; read alignment box, cropped from overlapping region
readcol,'box_f814w.list',a,x0,y0,x1,y1,format='i,f,f,f,f'

xshift=fltarr(n_elements(fn))
yshift=xshift
for i=1,n_elements(fn)-1 do begin
	print,i
	img0=mrdfits(fn[refnum[i]],1,hdr0,/silent)
	q=where(finite(img0) eq 0)
	if q[0] ne -1 then img0[q]=0
	; fix header problem
	sxaddpar,hdr0,'equinox',2000.00

	img=mrdfits(fn[i],1,hdr,/silent)
	q=where(finite(img) eq 0)
	if q[0] ne -1 then img[q]=0
	sxaddpar,hdr,'equinox',2000,00

	dx=fltarr(41,41)
	dy=fltarr(41,41)
	for j=0,40 do begin
		dx[j,*]=j-20
		dy[*,j]=j-20
	endfor

	rmss=fltarr(41,41)
	for xx=0,40 do begin
		for yy=0,40 do begin
			hdrshift=hdr
			sxaddpar,hdrshift,'crpix1',sxpar(hdr,'crpix1')+dx[xx,yy]
			sxaddpar,hdrshift,'crpix2',sxpar(hdr,'crpix2')+dy[xx,yy]

			hastrom,img,hdrshift,newimg,newhdr,hdr0,missing=0,interp=2

			residual=img0-newimg
			res=residual[x0[i]:x1[i],y0[i]:y1[i]]
			rmss[xx,yy]=rms(res)
		endfor
	endfor

	q=where(rmss eq min(rmss))
	ii=q[0] mod 41
	jj=q[0]/41
	xshift[i]=dx[ii,jj]
	yshift[i]=dy[ii,jj]

	; sub pixel
	dx=fltarr(17,17)
	dy=fltarr(17,17)
	for j=0,16 do begin
		dx[j,*]=(j-8)/4.+xshift[i]
		dy[*,j]=(j-8)/4.+yshift[i]
	endfor

	rmss=fltarr(17,17)
	for xx=0,16 do begin
		for yy=0,16 do begin
			hdrshift=hdr
			sxaddpar,hdrshift,'crpix1',sxpar(hdr,'crpix1')+dx[xx,yy]
			sxaddpar,hdrshift,'crpix2',sxpar(hdr,'crpix2')+dy[xx,yy]

			hastrom,img,hdrshift,newimg,newhdr,hdr0,missing=0,interp=2

			residual=img0-newimg
			res=residual[x0[i]:x1[i],y0[i]:y1[i]]
			rmss[xx,yy]=rms(res)
		endfor
	endfor

	q=where(rmss eq min(rmss))
	ii=q[0] mod 17
	jj=q[0]/17
	xshift[i]=dx[ii,jj]
	yshift[i]=dy[ii,jj]

	goto,skiptest
	; visually check
	hdrshift=hdr
	sxaddpar,hdrshift,'crpix1',sxpar(hdr,'crpix1')+xshift[i]
	sxaddpar,hdrshift,'crpix2',sxpar(hdr,'crpix2')+yshift[i]
	hastrom,img,hdrshift,newimg,newhdr,hdr0,missing=0,interp=2
	residual=img0-newimg
	res=residual[x0[i]:x1[i],y0[i]:y1[i]]
	writefits,'tmp.fits',residual
	writefits,'tmp1.fits',res
	spawn,'ds9 tmp.fits &'
	spawn,'ds9 tmp1.fits &'
	spawn,'ds9 '+fn[refnum[i]]+' &'
	stop

	skiptest:
endfor

for i=1,n_elements(xshift)-1 do begin
	xshift[i]=xshift[i]+xshift[refnum[i]]
	yshift[i]=yshift[i]+yshift[refnum[i]]
endfor

writecol,'shift_f814w.list',xshift,yshift

end
