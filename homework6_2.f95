program homework6_2
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 6_2
    ! 03/16/2023
    ! This program computes the quadratic best fit

    ! Clear out the memory
    implicit none

    ! Declare our Variables
    real :: xAve, yAve, XAve2, Sx2y, Sxx2, Sx2x2, Sxx, Sxy = 0.0
    real :: x, y, a, b, c
    integer :: n = 200
    integer :: i

    ! Read in the Data File
    open(42,file='QuadData.txt')
    open(13,file='Output.txt')

    ! Compute the Quadratic Least Squares
    do i = 1, n
        read(42,*) x, y
        Sxx = Sxx + ((float(i) - 1)/float(i)) * (x - xAve)**2
        Sxy = Sxy + ((float(i) - 1)/float(i)) * (x - xAve) * (y - yAve)
        ! Sxx2 = ((x - xAve)*(x**2 - XAve2)) / n
        Sxx2 = x**3 - (n*xAve*xAve2)
        ! Sx2x2 = (x**2 - XAve2)**2 / n
        Sx2x2 = x**4 - ((n*xAve2)*xAve2)
        ! Sx2y = ((y - yAve)*(x**2 - XAve2)) / n
        Sx2y = (x**2 * y) - (n*xAve2*yAve)
        xAve = xAve + (x - xAve) / float(i)
        xAve2 = xAve2 + (x**2 - xAve2) / float(i)
        yAve = yAve + (y - yAve) / float(i)
        a = ((Sx2y * Sxx) - (Sxy*Sxx2)) / ((Sxx*Sx2x2) - (Sxx2**2))
        b = ((Sxy*Sx2x2) - (Sx2y*Sxx2)) / ((Sxx*Sx2x2) - (Sxx2**2))
        c = yAve - b*xAve - a*xAve2
    enddo
    
    ! Write our output
    write(13,*) a, b, c

    ! Close our Folders
    close(42)
    close(13)

 end program homework6_2