program inverse_matrix
    implicit none
    integer :: n, i, j, k, maxRow
    real(kind=8), allocatable :: matrix(:,:), augmented(:,:)
    real(kind=8) :: factor, pivot, temp

    ! Step 1: Read Input
    open(unit=10, file='input.txt', status='old')
    read(10, *) n
    allocate(matrix(n,n), augmented(n,2*n))
    do i = 1, n
        read(10, *) (matrix(i,j), j=1,n)
    end do
    close(10)

    ! Step 2: Create Augmented Matrix
    augmented = 0.0
    do i = 1, n
        do j = 1, n
            augmented(i,j) = matrix(i,j)
            augmented(i,j+n) = 0.0
        end do
        augmented(i,n+i) = 1.0
    end do

    ! Step 3: Apply Gauss-Jordan Elimination with Partial Pivoting
    do k = 1, n
        ! Find the row with the maximum element in the current column
        maxRow = k
        do i = k+1, n
            if (abs(augmented(i,k)) > abs(augmented(maxRow,k))) then
                maxRow = i
            end if
        end do
        ! Swap the current row with the maxRow
        if (maxRow /= k) then
            do j = 1, 2*n
                temp = augmented(k,j)
                augmented(k,j) = augmented(maxRow,j)
                augmented(maxRow,j) = temp
            end do
        end if

        pivot = augmented(k,k)
        do j = k, 2*n
            augmented(k,j) = augmented(k,j) / pivot
        end do
        do i = 1, n
            if (i /= k) then
                factor = augmented(i,k)
                do j = k, 2*n
                    augmented(i,j) = augmented(i,j) - factor * augmented(k,j)
                end do
            end if
        end do
    end do

    ! Step 4: Output the Inverse Matrix
    open(unit=20, file='output.txt', status='replace')
    do i = 1, n
        do j = n+1, 2*n
            write(20, '(E12.5)', advance='no') augmented(i,j)
        end do
        write(20, *)
    end do
    close(20)

    deallocate(matrix, augmented)
end program inverse_matrix