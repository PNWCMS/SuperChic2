ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c                                                         c 
c     SuperChic Monte Carlo generator for central         c 
c     exclusive  production.                              c
c                                                         c 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c
c     ***********************************************
c     *   v2.04              11/10/16               *
c     *                                             *
c     *  Author: Lucian Harland-Lang                *
c     *  (l.harland-lang@ucl.ac.uk)                 *
c     *                                             *
c     *  For details see :                          *
c     *                                             *
c     *  arXiv 1508.02718                           *
c     *  arXiv 1405.0018 (review)                   *
c     *  arXiv 1005.0695 (quarkonia and diphoton)   *
c     *  arXiv 1011.0680 (quarkonia)                *
c     *  arXiv 1105.1626 (meson pairs)              *
c     *  arXiv 1302.2004 (meson pairs - eta/eta')   *
c     *  arXiv 1306.6661 (Skewed PDF)               *
c     *  arXiv 1306.2149 (Skewed PDF)               *
c     *                                             *
c     *  Available at :                             *
c     *  http:://projects.hepforge.org/superchic    *                       
c     *                                             *
c     ***********************************************
c
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      program superchic
      implicit double precision (a-z)
      integer i,j,k
      integer nhistmax
      integer outl
      integer iinc,ncallu
      logical histol
      character*100 dum

      include 'pdfinf.f'
      include 'genunw.f'
      include 'survin.f'
      include 'mesflag.f'
      include 'procn.f'
      include 'gencuts.f'
      include 'pi.f'
      include 'pdg.f'
      include 'unweighted.f'
      include 'surv.f'
      include 'bin.f'
      include 'ewpars.f'
      include 'zi.f'
      include 'vars.f'
      include 'survpars.f'
      include 'mom.f'
      include 'range.f'
      include 'polarization.f'
      include 'proc.f'
      include 'mq.f'
      include 'norm.f'
      include 'mixing.f'
      include 'meta.f'
      include 'mres.f'
      include 'forward.f'
      include 'mfact.f'
      include 'jetalg.f'
      include 'decay.f'
      include 'record.f'
      include 'mp.f'
      include 'quarkonia.f'
      include 'scorr.f'
      include 'output.f'
      include 'nhist.f'
      include 'intag.f'
      include 'vegas.f'
      include 'vegaspars.f'
      include 'hepevt.f'
      include 'leshouches.f'
      include 'photo.f'
      include 'nsurv.f'
      include 'eff.f'
      include 'prec.f'
      include 'wmax.f'
      include 'wtmax.f'
      include 'inparticle.f'
      include 'mkp.f'
      include 'mpip.f'
      include 'widths.f'
      include 'brs.f'


ccccccc

      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)rts
      read(*,*)isurv
      read(*,*)intag
      read(*,*)dum
      read(*,*)dum
      read(*,*)PDFname
      read(*,*)PDFmember
      read(*,*)dum
      read(*,*)proc
      read(*,*)outtag
      read(*,*)sfaci
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ncall
      read(*,*)itmx
      read(*,*)prec
      read(*,*)ncall1
      read(*,*)inccall
      read(*,*)itend
      read(*,*)iseed
      read(*,*)dum
      read(*,*)s2int
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)genunw
      read(*,*)nev
      read(*,*)erec
      read(*,*)readwt
      read(*,*)wtmax
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ymin
      read(*,*)ymax
      read(*,*)mmin
      read(*,*)mmax
      read(*,*)gencuts
      read(*,*)scorr
      read(*,*)fwidth
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ptamin
      read(*,*)ptbmin
      read(*,*)etaamin
      read(*,*)etaamax
      read(*,*)etabmin
      read(*,*)etabmax
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ptamin3
      read(*,*)ptbmin3
      read(*,*)ptcmin3
      read(*,*)etaamin3
      read(*,*)etaamax3
      read(*,*)etabmin3
      read(*,*)etabmax3
      read(*,*)etacmin3
      read(*,*)etacmax3
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ptamin4
      read(*,*)ptbmin4
      read(*,*)ptcmin4
      read(*,*)ptdmin4
      read(*,*)etaamin4
      read(*,*)etaamax4
      read(*,*)etabmin4
      read(*,*)etabmax4
      read(*,*)etacmin4
      read(*,*)etacmax4
      read(*,*)etadmin4
      read(*,*)etadmax4
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)ptamin6
      read(*,*)ptbmin6
      read(*,*)ptcmin6
      read(*,*)ptdmin6
      read(*,*)ptemin6
      read(*,*)ptfmin6
      read(*,*)etaamin6
      read(*,*)etaamax6
      read(*,*)etabmin6
      read(*,*)etabmax6
      read(*,*)etacmin6
      read(*,*)etacmax6
      read(*,*)etadmin6
      read(*,*)etadmax6
      read(*,*)etaemin6
      read(*,*)etaemax6
      read(*,*)etafmin6
      read(*,*)etafmax6
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)rjet
      read(*,*)jalg
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)m2b
      read(*,*)pdgid(6)
      read(*,*)pdgid(7)
      read(*,*)dum
      read(*,*)dum
      read(*,*)dum
      read(*,*)pdgid(9)
      read(*,*)pdgid(12)
      read(*,*)br(1)
      read(*,*)br(2)
      read(*,*)mgo
      read(*,*)mneut
      read(*,*)mcharg

cccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc

      forward=.false.

      call length(outtag,outl)

      open(45,file='evrecs/evrec'//outtag(1:outl)//'.dat')
      wmax=0d0
      evnum=0    

      if(genunw)then
      else
         readwt=.false.
      endif
      if(readwt)wmax=wtmax

      iw=0

      gf=1.16639d-5
      v=dsqrt(1d0/dsqrt(2d0)/gf)
      mt=173d0
      mb=4.75d0
      mc=1.4d0
      mmu=0.1134d0
      mpsi=3.096916d0
      mpsip=3.686109d0
      mups=9.46030d0
      mchic0=3.41475d0
      mchib0=9.85944d0
      mp=0.938272046d0
      mw=80.318d0
      me=0.511d-3
      mtau=1.77682d0
      mpip=0.13957018d0 
      mkp=0.493677d0
      alpha=7.2974d-3
      pi=dacos(-1d0)
      conv=389379d3
      zi=(0d0,1d0)
      mqu=0.023d0
      mqd=0.048d0
      mqs=0.95d0
      
c      mgo=801.879d0
c      mneut=122.306d0
c      mcharg=197.662d0


      if(proc.eq.69)then
        if(pdgid(9).eq.1)then
            mq1=mqd
        elseif(pdgid(9).eq.2)then
            mq1=mqu
        elseif(pdgid(9).eq.3)then
            mq1=mqs
        elseif(pdgid(9).eq.4)then
            mq1=mc
        elseif(pdgid(9).eq.5)then
            mq1=mb
        elseif(pdgid(9).eq.6)then
            mq1=mt
        elseif(pdgid(12).eq.1)then
            mq2=mqd
        elseif(pdgid(12).eq.2)then
            mq2=mqu
        elseif(pdgid(12).eq.3)then
            mq2=mqs
        elseif(pdgid(12).eq.4)then
            mq2=mc
        elseif(pdgid(12).eq.5)then
            mq2=mb
        elseif(pdgid(12).eq.6)then
            mq2=mt
        endif
      endif

      if(proc.eq.71)then
        if(pdgid(9).eq.-11)then
            ml1=me
            pdgid(8)=12
        elseif(pdgid(9).eq.-13)then
            ml1=mmu
            pdgid(8)=14
        elseif(pdgid(9).eq.-15)then
            ml1=mtau
            pdgid(8)=16
        endif
        if(pdgid(12).eq.11)then
            ml2=me
            pdgid(11)=-12
        elseif(pdgid(12).eq.13)then
            ml2=mqu
            pdgid(11)=-14
        elseif(pdgid(12).eq.15)then
            ml2=mtau
            pdgid(11)=-16
        endif
      endif



      mq=0d0
      hel=1
      mes=.false.
      mfact='mx'
      forward=.false.
      decay2=.false.
      decay3=.false.
      decay4=.false.
      decay6=.false.

      inparticle='prot'

cccccccccccc

      do i=1,20
         jdahep(1,i)=0
         jdahep(2,i)=0
      enddo

cccccccccccccccccccccccccc
      
      call inpdf
      call supinit
      call header

cccccccccccccccccccccccccc

      if(mes)then
         call calcmes
         call wfinit
      endif

ccccccccccccccccccccccccc

      if(inparticle.eq.'el')then
         if(sfaci)then 
            print*,'Error : must have sfaci = .false. for initial-state 
     &electrons'
            stop
         endif
      endif

ccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccc

      s=rts**2
      if(inparticle.eq.'prot')then
         beta=dsqrt(1d0-4d0*mp**2/s)
      elseif(inparticle.eq.'el')then
         beta=dsqrt(1d0-4d0*me**2/s)
      endif

      q(1,1)=0d0
      q(2,1)=0d0
      q(3,1)=rts/2d0*beta
      q(4,1)=rts/2d0

      q(1,2)=0d0
      q(2,2)=0d0
      q(3,2)=-rts/2d0*beta
      q(4,2)=rts/2d0

      if(inparticle.eq.'prot')then
         pdgid(1)=2212
         pdgid(2)=2212
         pdgid(3)=2212
         pdgid(4)=2212
      elseif(inparticle.eq.'el')then
         pdgid(1)=11
         pdgid(2)=-11
         pdgid(3)=11
         pdgid(4)=-11
      endif

ccccccccccccccccccccccccccccccccccccccccccccccc
cccc     HEPEVT
ccccccccccccccccccccccccccccccccccccccccccccccc

      do k=1,2
         do j=1,4
            phep(j,k)=q(j,k)
         enddo
         phep(5,k)=mass(k)   
         if(inparticle.eq.'el')then
            phep(5,k)=me
         elseif(inparticle.eq.'prot')then
            phep(5,k)=mp
         endif
      enddo
      do k=1,20
         do j=1,4
            vhep(j,k)=0d0
         enddo
      enddo
      isthep(1)=2
      isthep(2)=2
      isthep(3)=1
      isthep(4)=1
      jmohep(2,5)=2
      jdahep(1,1)=0
      jdahep(2,1)=0
      jdahep(1,2)=0
      jdahep(2,2)=0
      jdahep(1,3)=0
      jdahep(2,3)=0
      jdahep(1,4)=0
      jdahep(2,4)=0


ccccccccccccccccccccccccccccccccccccccccccccccc
ccccc Les Houches
ccccccccccccccccccccccccccccccccccccccccccccccc

      nprup=1
      idwtup=3
      pdfsup(1)=0
      pdfsup(2)=0
      pdfgup(1)=0
      pdfgup(2)=0
      idprup=0
      xwgtup=1d0
      aqedup=alpha

ccc   NEW LHE init

      pdfsup(1)=247000
      pdfsup(2)=247000
      pdfgup(1)=0
      pdfgup(2)=0

ccc

      do k=1,2
         do j=1,4
            pup(j,k)=q(j,k)
         enddo
         pup(5,k)=mass(k)
         if(inparticle.eq.'el')then
            pup(5,k)=me
         elseif(inparticle.eq.'prot')then
            pup(5,k)=mp
         endif
      enddo
      istup(1)=-1
      istup(2)=-1
      istup(3)=1
      istup(4)=1   
      mothup(1,1)=0
      mothup(2,1)=0
      mothup(1,2)=0
      mothup(2,2)=0
      mothup(1,3)=0
      mothup(2,3)=0
      mothup(1,4)=0
      mothup(2,4)=0
      mothup(1,5)=0
      mothup(2,5)=0
      icolup(1,1)=0
      icolup(2,1)=0
      icolup(1,2)=0
      icolup(2,2)=0
      icolup(1,3)=0
      icolup(2,3)=0
      icolup(1,4)=0
      icolup(2,4)=0
      icolup(1,5)=0
      icolup(2,5)=0
      do i=1,20
         vtimup(i)=0
         spinup(i)=9
      enddo

      do i=1,2
         do j=1,5
            jmohep(i,j)=mothup(i,j)
         enddo
      enddo

ccccccccc


      if(proc.eq.17.or.proc.eq.18.or.proc.eq.19)then
         nup=11
      elseif(proc.eq.53.or.proc.eq.54
     &        .or.proc.eq.60.or.proc.eq.61)then
         nup=11
      elseif(proc.eq.69.or.proc.eq.71) then
         nup=13
      elseif(decay4)then
         if(proc.eq.52)then
            nup=10
         else
            nup=9
         endif   
      elseif(decay6)then
         nup=11
      elseif(dps.eq.2.or.decay2)then
         nup=7
      elseif(dps.eq.3)then
         nup=8
      elseif(decay3)then
         nup=9
      elseif(dps.eq.1)then
         nup=5
      endif
      
      do j=3,nup
         do i=1,4
            evrec(evnum,j,i)=q(i,j)
         enddo
      enddo
      
      nhep=nup
      nup=nup-2
      
ccccccccc

      call initparsr(isurv)   
      call readscreen      

      surv=1d0/norm**2

cccccccccccc
     
      nhist=0
      nhistmax=20

ccccccccccccccc

      histol=.true.

ccccccc    initialise histograms

      if(histol)call inithist(nhistmax)

cccccccccccccccccccc

      call calcsud
      call calchg

cccccccccccccccc

      neff=0
      neff0=0

      do i=1,10        
         xu(i)=1d0
         xl(i)=0d0
      enddo

      ACC=-1D0
      NPRN=1

      do i=1,iseed
         call r2455(randum)
      enddo
     
      ITMX1=1
      
      bin=.false.
      sfac=.false.
      unw=.false.
      calcmax=.false.
      iinc=1

            print*,''
      print*,'**************************************************************
     &**************'
      print*,'                Vegas: initialisation run                '
      print*,'                Note : outputs *bare* cross section only '
      print*,'**************************************************************
     &**************'

      CALL VEGAS(cs,AVGI,SD,CHI2A)

      if(readwt)goto 779

            print*,''
      print*,'**************************************************************
     &**************'
      print*,'                Vegas : main run                '
      print*,'**************************************************************
     &**************'

      if(gencuts)then

      print*,''
      print*,'**************************************************************
     &**************'
      print*,''
      write(6,19)dble(neff)/dble(neff0)*100d0
      print*,''

      iinc=nint(dble(neff0)/dble(neff))

      write(6,20)iinc
      print*,''
      print*,'**************************************************************
     &**************'
      print*,''

 19   FORMAT(' Cut Efficiency = ',G10.4,'%')
 20   FORMAT(' => multiply NCALL by ',i4)

      endif

      ITMX=ITMX1
      NCALL=NCALL1
      avgi1=avgi
      sd1=sd

      ncall=ncall*iinc
      inccall=inccall*iinc

 779  bin=.true.

      ncallu=ncall

      sfac=sfaci
      unw=.false.
      calcmax=.true.
      ren=1d0

      it=1
      itmx=1

      if(readwt)goto 778

      ren=dble(ncall)

      CALL VEGAS1(cs,AVGI,SD,CHI2A)

      prec=prec*1d-2
     
 777  if(dabs(sd/avgi).gt.prec)then

         it=it+1    
         ncall=ncall+inccall     
         ren=dble(ncall)

         CALL VEGAS2(cs,AVGI,SD,CHI2A)
      

         if(it.gt.itend)goto 778

         goto 777

      endif

 778  unw=.true.
      calcmax=.true.

  10  FORMAT(' cross section = ',G16.7,' +/-',G16.7,' ( ',F9.4,' )')

cccccccccccccc

 999  if(genunw)then

         avgio=avgi
         sdo=sd
      
      print*,''
      print*,'**************************************************************
     &**************'
      print*,'Generating unweighted events'
      print*,'**************************************************************
     &**************'
      print*,''

c      ncall=nev
      ncall=ncallu
      if(ncall.lt.1000)ncall=1000
 566  ren=dble(ncall)
      itmx=1
   
      CALL VEGAS2(cs,AVGI,SD,CHI2A)   

      if(evnum.lt.nev)then

      print*,''
      print*,'**************************************************************
     &**************'
      write(6,100)evnum,nev
      print*,'**************************************************************
     &**************'
      
      endif

 100  format('  generated events so far = ',i7,'    total = ',i7)

c      ncall=ncall+nev
      ncall=ncall+inccall
     
      if(evnum.lt.nev)goto 566

      xsecup(1)=avgi
      xerrup(1)=sd
      xmaxup(1)=avgi

      call unwprint

      if(readwt)then
      else
         avgi=avgio
         sd=sdo
      endif

      endif


      close(55)
      close(45)



cccccccccccccccc

      call length(outtag,outl)
      open(56,file='outputs/output'//outtag(1:outl)//'.dat')

      write(56,*)'**********************************************************
     &**************'
      call length(procn,outl)
      write(56,*)'* ',procn(1:outl)
      write(56,*)'**********************************************************
     &**************'
      write(56,*)
      write(56,301)avgi,sd
      write(56,*)
      write(56,*)'********************  Input parameters *******************
     &**************'
      write(56,99)' *',rts,' :  CMS collision energy (GeV)'
      write(56,97)' *',isurv,' :  Model of soft survival'
      call length(PDFname,outl)
      write(56,96)' *',PDFname(1:outl),' :  PDF set'
      write(56,97)' *',PDFmember,' :  PDF member'
      write(56,97)' *',proc,' :  Process number'
      call length(outtag,outl)
      write(56,96)' *',outtag(1:outl)//'.dat',' :  Output file'
      write(56,98)' *',sfaci,' :  Include soft survival effects'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      write(56,*)'****************** Integration parameters  ***************
     &**************'
      write(56,97)' *',ncall,' :  Preconditioning calls'
      write(56,97)' *',itmx,' :  Preconditioning iterations'
      write(56,99)' *',prec*100d0,' :  Percentage accuracy'
      write(56,97)' *',ncall1,' :  Calls in first main iteration'
      write(56,97)' *',inccall,' :  Increase calls per iteration'
      write(56,97)' *',itend,' :  Maximum number of iterations'
      write(56,97)' *',iseed,' :  Random number seed'
      write(56,*)'**********************************************************
     &**************'
      write(56,97)' *',s2int,' :  Survival factor integration par.'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      write(56,*)'********************* Unweighted Events  *****************
     &**************'
      write(56,98)' *',genunw,' :  Generate unweighted events'
      write(56,99)' *',wmax,' :  Maximum weight'
      if(genunw)then
         call length(erec,outl)
         write(56,97)' *',nev,' :  Number of events'
         write(56,96)' *',erec(1:outl),' :  Record format'
      endif
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      write(56,*)'********************* General Cuts ***********************
     &**************'
      write(56,99)' *',ymin,' :  Minimum object rapidity'
      write(56,99)' *',ymax,' :  Maximum object rapidity'
      write(56,99)' *',mmin,' :  Minimum object mass'
      write(56,99)' *',mmax,' :  Maximum object mass'
      write(56,98)' *',gencuts,' :  Include further cuts'
      write(56,98)' *',gencuts,' :  Include spin correlations'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      if(dps.eq.2.or.decay2)then
      write(56,*)'***************** 2-body decay cuts **********************
     &**************'
      write(56,99)' *',ptamin,' :  pT(a) min'
      write(56,99)' *',ptbmin,' :  pT(b) min'
      write(56,99)' *',etaamin,' :  eta(a) min'
      write(56,99)' *',etaamax,' :  eta(a) max'
      write(56,99)' *',etabmin,' :  eta(b) min'
      write(56,99)' *',etabmax,' :  eta(b) max'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      elseif(dps.eq.3.or.decay3)then
      write(56,*)'***************** 3-body decay cuts **********************
     &**************'
      write(56,99)' *',ptamin3,' :  pT(a) min'
      write(56,99)' *',ptbmin3,' :  pT(b) min'
      write(56,99)' *',ptcmin3,' :  pT(c) min'
      write(56,99)' *',etaamin3,' :  eta(a) min'
      write(56,99)' *',etaamax3,' :  eta(a) max'
      write(56,99)' *',etabmin3,' :  eta(b) min'
      write(56,99)' *',etabmax3,' :  eta(b) max'
      write(56,99)' *',etacmin3,' :  eta(c) min'
      write(56,99)' *',etacmax3,' :  eta(c) max'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      elseif(decay4)then
      write(56,*)'***************** 4-body decay cuts **********************
     &**************'
      write(56,99)' *',ptamin3,' :  pT(a) min'
      write(56,99)' *',ptbmin3,' :  pT(b) min'
      write(56,99)' *',ptcmin3,' :  pT(c) min'
      write(56,99)' *',ptdmin3,' :  pT(d) min'
      write(56,99)' *',etaamin3,' :  eta(a) min'
      write(56,99)' *',etaamax3,' :  eta(a) max'
      write(56,99)' *',etabmin3,' :  eta(b) min'
      write(56,99)' *',etabmax3,' :  eta(b) max'
      write(56,99)' *',etacmin3,' :  eta(c) min'
      write(56,99)' *',etacmax3,' :  eta(c) max'
      write(56,99)' *',etadmin3,' :  eta(d) min'
      write(56,99)' *',etadmax3,' :  eta(d) max'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      endif
      if(proc.eq.5.or.proc.eq.6)then
       write(56,*)'*********************** Jet cuts ************************
     &**************'
      write(56,99)' *',rjet,' :  Jet Radius'
      call length(jalg,outl)
      write(56,96)' *',jalg(1:outl),' : Record format'       
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      endif
      if(proc.gt.40.and.proc.lt.46)then
      write(56,*)'**************** chi_b 2-body decays *******************
     &**************'
      write(56,99)' *',m2b,' :  Decay particle mass'
      write(56,97)' *',pdgid(6),' :  PDG number particle 1'
      write(56,97)' *',pdgid(7),' :  PDG number particle 2'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      endif
      if(proc.gt.22.and.proc.lt.28)then
      write(56,*)'**************** chi_c 2-body decays *******************
     &**************'
      write(56,99)' *',m2b,' :  Decay particle mass'
      write(56,97)' *',pdgid(6),' :  PDG number particle 1'
      write(56,97)' *',pdgid(7),' :  PDG number particle 2'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''
      endif
      write(56,*)''
      write(56,*)'**************** sparticles masses ***********************
     &**************'
      write(56,99)' *',mgo,'     :   Gluino mass'
      write(56,99)' *',mneut,'   :   Neutralino mass'
      write(56,99)' *',mcharg,'  :   Chargino mass'
      write(56,*)'**********************************************************
     &**************'
      write(56,*)''

 99   format(a,f24.4,8x,a)
 97   format(a,i24,8x,a)
 96   format(a,a24,8x,a)
 98   format(a,l24,8x,a)

      close(56)

      if(histol)then

      do j=1,nhist
           call histo2(j,0)
      enddo

      endif

      print*,''
      write(6,301)avgi,sd
      print*,''

 301  format(' Cross section = ',G16.7,' +/-',G16.7,' pb')

      call cpu_time(t2)
      print*,'time elapsed = ', t2, ' s'
      
      stop
      end
