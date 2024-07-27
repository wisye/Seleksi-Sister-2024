program matrix_inverse
    implicit none
    integer :: n, i, j, k
    real, allocatable :: matrix(:,:), identity(:,:), augmented(:,:)

    ! Read matrix size and matrix from file
    open(unit=10, file='input.txt', status='old')
    read(10, *) n
    allocate(matrix(n,n), identity(n,n), augmented(n,2*n))
    do i = 1, n
        do j = 1, n
            read(10, *) matrix(i,j)
            identity(i,j) = 0.0
            augmented(i,j) = matrix(i,j)
            augmented(i,j+n) = 0.0
        end do
        identity(i,i) = 1.0
        augmented(i,n+i) = 1.0
    end do
    close(10)

    ! Gauss-Jordan Elimination
    do k = 1, n
        ! Make the diagonal element 1
        do j = 1, 2*n
            augmented(k,j) = augmented(k,j) / matrix(k,k)
        end do
        ! Make all other elements in current column 0
        do i = 1, n
            if (i /= k) then
                do j = 1, 2*n
                    augmented(i,j) = augmented(i,j) - augmented(k,j) * matrix(i,k) / matrix(k,k)
                end do
            end if
        end do
    end do

    ! Write the inverse matrix to file
    open(unit=20, file='output.txt', status='replace')
    do i = 1, n
        do j = n+1, 2*n
            write(20, '(F8.3)', advance='no') augmented(i,j)
        end do
        write(20, *)
    end do
    close(20)

    deallocate(matrix, identity, augmented)
end program matrix_inverse