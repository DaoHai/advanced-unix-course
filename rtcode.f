      IMPLICIT REAL (A-H,O-Z)
c     This is set up to read in the coefficients from Slingo's paper
c     and run the 2 stream with inputs effective radius and LWC.




c     *********************************** 
c     DELTA EDDINGTON METHOD. 
c     ***********************************
c     ***********************************


c     The signs convention in this program
c     is according to:
c          Shettle and Weinman,
c          J.A.S. Oct. 1970 pg1048

c     It differs from Liou in the sign.
c     The origin of the sign error is 
c     in the integration limits.
c     i.e. 
c       Upward Flux=
c	   =pie*[Io(t)-.6666*I1(t)]
c	Downward Flux=
c	   =pie*[Io(t)+.6666*I1(t)]

c     Be careful.

c     ***********************************
c     ***********************************
      OPEN(25,file='rtoutput',access='append')
      a1=0.03094
      a2=1.252
      a3=0.000000790
      a4=0.000000369
      a5=0.844
      a6=0.001558


      print *, 'Enter the size from 5 to 50'
      read *, REF 
      print *, 'Enter the angle 0.1 to 1'
      read *, auo 
      aLWC=0.3
      az=100.
      akext2=aLWC*(a1+(a2/REF))
      aw=1.00000-a3-a4*REF 
      ag=a5+a6*REF
      at=akext2*az
      agp=ag/(1.+ag)
      awp=((1.-ag*ag)*aw)/(1.-aw*ag*ag)
      atp=(1.-aw*ag*ag)*at 
      ak=(3.*(1.-awp)*(1.-awp*agp))**.5
      aksqd=(3.*(1.-awp)*(1.-awp*agp))
      ap=((3.*(1.-awp))/(1.-awp*agp))**.5
      apsqd=((3.*(1.-awp))/(1.-awp*agp))
      alp=(3.*awp*auo*(1.+agp*(1.-awp)))/(4.*(1.-aksqd*auo*auo))
      bta=(3.*awp*(1.+3.*agp*auo*auo*(1.-awp)))/(4.*(1.-aksqd*auo*auo))
      acon=2./3.
      b1=1.+acon*ap
      b2=1.-acon*ap
      b3=alp+acon*bta
      b4=alp-acon*bta
      b5=exp(-1.*ak*atp)
      b6=exp(ak*atp)
      b7=exp((-1.*atp)/auo)
      c2=(b1*b4*b7-b2*b3*b5)/(b1*b1*b6-b2*b2*b5)
      c1=(b1*b3*b6-b2*b4*b7)/(b1*b1*b6-b2*b2*b5)
      reflection=b2*c1+b1*c2-b4
      transmission=b1*b5*c1+b2*b6*c2+(1.-b3)*b7
      absorption=1.-reflection-transmission
c     write(25,484) reflection,transmission,absorption,aLWC,REF,auo
      write(25,*) REF,auo,reflection,transmission
c 484   format(3(1x,f8.6),1x,f6.2,1x,2(1x,f5.2))
      stop
      END
