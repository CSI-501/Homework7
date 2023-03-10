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
    real :: x, y, m, b
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
        Sxx2 = ((x - xAve)*(x**2 - XAve2)) / n
        Sx2x2 = (x**2 - XAve2)**2 / n
        Sx2y = ((y - yAve)*(x**2 - XAve2)) / n
        xAve = xAve + (x - xAve) / float(i)
        xAve2 = xAve2 + (x**2 - xAve2) / float(i)
        yAve = yAve + (y - yAve) / float(i)
        m = Sxy / Sxx
        b = yAve - m* xAve
    enddo
    
    ! Write our output
    write(13,*) m, b

    ! Close our Folders
    close(42)
    close(13)

 end program homework6_2