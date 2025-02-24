
; Unit: R_0
lx=[5,5,6,9,15]	; Set the number of order of magnitude in r need to be covered
n=[0.5,1,2,4,8]
color=['red','blue','gold','magenta','green']

for i=0,n_elements(n)-1 do begin
	x=10^(dindgen(10000)/10000.*lx[i]-3)

	; Calculate intensity in arbiturary unit
	y=exp(-x^(1/n[i]))

	; Find R_eff
	tot=0d
	for j=0,n_elements(x)-2 do begin
		tot+=(y[j+1]+y[j])*(x[j+1]-x[j])/2d*(x[j+1]+x[j])/2.*2*!pi
	endfor
	tmp=0d
	for j=0,n_elements(x)-1 do begin
		tmp+=(y[j+1]+y[j])*(x[j+1]-x[j])/2d*(x[j+1]+x[j])/2.*2*!pi
		if tmp ge 0.5*tot then break
	endfor
	reff=x[j]

	; Renormalize
	x=x/reff
	tot=0d
	for j=0,n_elements(x)-2 do begin
		tot+=(y[j+1]+y[j])*(x[j+1]-x[j])/2d*(x[j+1]+x[j])/2.*2*!pi
	endfor
	y=y/tot

	; Plot
	if i eq 0 then begin
		cgplot,x,y,color=color[i],ytype=1,xtype=1,xr=[0.01,100],yr=[1e-5,1e2],$
			xtitle='R/R'+'$\subeff$',ytitle='Intensity'
	endif else begin
		cgoplot,x,y,color=color[i]
	endelse
endfor
cglegend,titles=string(n,format='(f3.1)')+' ',colors=color,location=[10,50],/box,/data



end
