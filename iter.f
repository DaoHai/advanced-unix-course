      
      iseed=56550
      a=rand(iseed)
      do i=1,1000
c       if (i .eq. 655) stop
        print *,'Code version 3.2 run 53 iteration ',i
        a=rand()
        if (a .gt. 0.000001) then 
          x=1/(real(i))
          print *, a,i,' error ',x
          do j=1,10
            a=rand()
            if (a .lt. 0.1) then 
             print *, '-999.99'
            else
             print *, a
            endif
          enddo
        endif
      enddo  
      stop
      end
