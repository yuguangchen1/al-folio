
r=mrdfits('../final/M104_r.fits')
g=mrdfits('../final/M104_g.fits')
b=mrdfits('../final/M104_b.fits')

r=(r/2-0.005>0.001)<0.1
g=(g-0.001>0.001)<0.1
b=(b>0.001)<0.1

data=fltarr(512,512,3)
data[*,*,0]=r
data[*,*,1]=g
data[*,*,2]=b
data=data>0.004
device,decomposed=1

window,xs=512,ys=512
cgimage,alog10(data)

end
