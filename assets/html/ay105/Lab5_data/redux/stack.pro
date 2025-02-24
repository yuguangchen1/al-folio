
readcol,'../redux/shift_r.list',fn,dx,dy,format='a,f,f'
readcol,'../redux/shift_g.list',afn,adx,ady,format='a,f,f'
readcol,'../redux/shift_b.list',bfn,bdx,bdy,format='a,f,f'
fn=[fn,afn,bfn]
dx=[dx,adx,bdx]
dy=[dy,ady,bdy]


for i=0,n_elements(fn)-1 do begin
	img=mrdfits('../redux/'+fn[i])
	img=img-median(img)
	sz=size(img,/dimension)
	
	if i eq 0 then begin
		data=fltarr(sz[0],sz[1],n_elements(fn))
	endif
	tmpimg=fshift(img,dx[i],dy[i])
	data[*,*,i]=tmpimg
endfor

stack=fltarr(sz[0],sz[1])
for i=0,sz[0]-1 do begin
	for j=0,sz[1]-1 do begin
		stack[i,j]=median(data[i,j,*])
	endfor
endfor

writefits,'../final/M104_tot.fits',stack
spawn,'ds9 ../final/M104_tot.fits &'

end
