"""
# Author Weronika Jasiak
"""

module blocksys
export openFileWithMatrix, openFileWithVectorOfRightSites,
        calculationOfRightSideVector, saveVectorXToFile, gaussianElimination,
        gaussianEliminationLU, decompositionOfLU

    """
        openFileWithMatrix(path::String)

    Load the matrix from the file.

    # Arguments
    - `path::String`: file access path with matrix A.

    # Return
    - `A::spzeros`: sparse matrix.
    - `n::Int64`: size of matrix A.
    - `l::Int64`: size of matrix Ak, Bk, Ck.

    # Examples
    ```
    julia> openFileWithMatrix("A/A.txt")
    ```
    """
    function openFileWithMatrix(path::String)
        open(path) do file
            firstLine = split(readline(file))
            n = parse(Int64, firstLine[1])
            l = parse(Int64, firstLine[2])
            A = spzeros(n, n)
            while !eof(file)
                line = split(readline(file))
                j = parse(Int64, line[1])
                i = parse(Int64, line[2])
                v = parse(Float64, line[3])
                A[i, j] = v
            end
            return A, n, l
        end
    end # openFileWithMatrix

    """
        openFileWithVectorOfRightSites(path::String)

    Load the vector from the file.

    # Arguments
    - `path::String`: file access path with vector b.

    # Return
    - `b::Array`: vector of right sites b.

    # Examples
    ```
    julia> openFileWithVectorOfRightSites("A/b.txt")
    ```
    """
    function openFileWithVectorOfRightSites(path::String)
        open(path) do file
            firstLine = readline(file)
            n = parse(Int64, firstLine)
            b = Array(Float64, n)
            i = 1
            while !eof(file)
                line = readline(file)
                b[i] = parse(Float64, line)
                i += 1
            end
            return b
        end
    end # openFileWithVectorOfRightSites

    """
        calculationOfRightSideVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)

    Calculate right side vector.

    # Arguments
    - `A::spzeros`: sparse matrix.
    - `n::Int64`: size of matrix A.
    - `l::Int64`: size of matrix Ak, Bk, Ck.

    # Return
    - `b::Array`: vector of right sites b.

    # Examples
    ```
    julia> a = openFileWithMatrix("A/A.txt")
    julia> calculationOfRightSideVector(a[1], a[2], a[3])
    ```
    """
    function calculationOfRightSideVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
        b = zeros(Float64, n)
        fromC = 1
        toC = l
		for i in 1:n
			for j in fromC:toC
				b[i] += A[j, i]
			end
			if (i + l <= n)
				b[i] += A[i + l, i]
			end
			if (i % l == 0)
				fromC = convert(Int64, (l * (i / l)))
				toC += l
			end
		end
        return b
    end # calculationOfRightSideVector

    """
        saveVectorXToFile(path::AbstractString, x::Array{Float64}, n::Int64, vectorB::Bool)

    Save the data to a file.

    # Arguments
    - `path::AbstractString`: file name.
    - `x::Array{Float64}`: vector x.
    - `n::Int64`: size of matrix A.
    - `vectorB::Bool`: true or false (b read from a file).

    # Examples
    ```
    julia> a = openFileWithMatrix("A/A.txt")
    julia> b = openFileWithVectorOfRightSites("A/b.txt")
    julia> c = gaussianElimination(a[1], b, a[2], a[3], true)
    julia> saveVectorXToFile("w.txt", c, a[2], true)
    ```
    """
    function saveVectorXToFile(path::AbstractString, x::Array{Float64}, n::Int64, vectorB::Bool)
        open(path, "w") do file
            if vectorB == true
                X = ones(n)
    		    println(file, (norm(X - x) / norm(x)))
            end
    	    for i in 1:n
                println(file, x[i])
            end
    	end
    end # saveVectorXToFile

    """
        gaussianElimination(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, partialSelection::Bool)

    Solves the system of equations Ax = b by Gauss elimination.

    # Arguments
    - `A::SparseMatrixCSC{Float64, Int64}`: sparse matrix.
    - `b::Vector{Float64}`: vector of right sites b.
    - `n::Int64`: size of matrix A.
    - `l::Int64`: size of matrix Ak, Bk, Ck.
    - `partialSelection::Bool`: true or false (choose a partial main element).

    # Return
    - `x::Array{Float64}`: vector x.

    # Examples
    ```
    julia> a = openFileWithMatrix("A/A.txt")
    julia> b = openFileWithVectorOfRightSites("A/b.txt")
    julia> gaussianElimination(a[1], b, a[2], a[3], true)
    ```
    """
    function gaussianElimination(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, partialSelection::Bool)
        x = Array{Float64}(n)
        if partialSelection == true
            p = collect(1:n)
            for k in 1:n-1
                toR = convert(Int64, (l + l * trunc(k / l)))
                if toR > n
                    toR = n
                end
                toC = convert(Int64, (2 * l + l * trunc(k / l)))
                if toC > n
                    toC = n
                end
                for i in k+1:toR
                    m = abs(A[k, p[k]])
                    r = k
                    for w in i:toR
                        if abs(A[k, p[w]]) > m
                            m = abs(A[k, p[w]])
                            r = w
                        end
                    end
                    if abs(m) < eps(Float64)
                        error("Błąd: znaleziony element jest zerem")
                    end
                    temp = p[k]
                    p[k] = p[r]
                    p[r] = temp
                    z = A[k, p[i]] / A[k, p[k]]
                    for j in k+1:toC
                        A[j, p[i]] -= z * A[j, p[k]]
                    end
                    b[p[i]] -= z * b[p[k]]
                end
            end
            for i in n:-1:1
                toC = convert(Int64, (2 * l + l * trunc(p[i] / l)))
                if toC > n
                    toC = n
                end
                z = b[p[i]]
                for j in i+1:toC
                    z -= A[j, p[i]] * x[j]
                end
                if abs(A[i, p[i]]) < eps(Float64)
                    error("Błąd: znaleziony element jest zerem")
                end
                x[i] = z / A[i, p[i]]
            end
        else
            for k in 1:n-1
                toR = convert(Int64, (l + l * trunc(k / l)))
                if toR > n
                    toR = n
                end
                toC = k + l
                if toC > n
                    toC = n
                end
                for i in k+1:toR
                    if abs(A[k, k]) < eps(Float64)
                        error("Błąd: znaleziony element jest zerem")
                    end
                    z = A[k, i] / A[k, k]
                    for j in k + 1:toC
                        A[j, i] -= z * A[j, k]
                    end
                    b[i] -= z * b[k]
                end
            end
            for i in n:-1:1
                toC = i + l
                if toC > n
                    toC = n
                end
                z = b[i]
                for j in i+1:toC
                    z -= A[j, i] * x[j]
                end
                if abs(A[i, i]) < eps(Float64)
                    error("Błąd: znaleziony element jest zerem")
                end
                x[i] = z / A[i, i]
            end
        end
        return x
    end # gaussianElimination

    """
        gaussianEliminationLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, partialSelection::Bool)

    Determine the LU distribution of matrix A by Gauss elimination.

    # Arguments
    - `A::SparseMatrixCSC{Float64, Int64}`: sparse matrix.
    - `n::Int64`: size of matrix A.
    - `l::Int64`: size of matrix Ak, Bk, Ck.
    - `partialSelection::Bool`: true or false (choose a partial main element).

    # Return
    - `A::SparseMatrixCSC{Float64, Int64}`: LU distribution.
    - `p::Array{Int64, 1}`:

    # Examples
    ```
    julia> a = openFileWithMatrix("A/A.txt")
    julia> gaussianEliminationLU(a[1], a[2], a[3], true)
    ```
    """

    function gaussianEliminationLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, partialSelection::Bool)
        if partialSelection == true
            p = collect(1:n)
            for k in 1:n-1
                toR = convert(Int64, (l + l * trunc(k / l)))
                if toR > n
                    toR = n
                end
                toC = convert(Int64, (2 * l + l * trunc(k / l)))
                if toC > n
                    toC = n
                end
                for i in k+1:toR
                    m = abs(A[k, p[k]])
                    r = k
                    for w in i:toR
                        if abs(A[k, p[w]]) > m
                            m = abs(A[k, p[w]])
                            r = w
                        end
                    end
                    temp = p[k]
                    p[k] = p[r]
                    p[r] = temp
                    if abs(A[k, p[k]]) < eps(Float64)
                        error("Błąd: znaleziony element jest zerem")
                    end
                    z = A[k, p[i]] / A[k, p[k]]
                    A[k, p[i]] = z
                    for j in k + 1:toC
                        A[j, p[i]] -= z * A[j, p[k]]
                    end
                end
            end
            return A, p
        else
            for k in 1:n-1
                toR = convert(Int64, (l + l * trunc(k / l)))
                if toR > n
                    toR = n
                end
                toC = k + l
                if toC > n
                    toC = n
                end
                for i in k+1:toR
                    if abs(A[k, k]) < eps(Float64)
                        error("Błąd: znaleziony element jest zerem")
                    end
                    z = A[k, i] / A[k, k]
                    A[k, i] = z
                    for j in k+1:toC
                        A[j, i] -= z * A[j, k]
                    end
                end
            end
            return A
        end
    end # gaussianEliminationLU

    """
        decompositionOfLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, partialSelection::Bool, p::Vector{Int64})

    Solve the equation Ax = b.

    # Arguments
    - `A::SparseMatrixCSC{Float64, Int64}`: matrix LU from the gaussianEliminationLU.
    - `b::Vector{Float64}`: sparse matrix.
    - `n::Int64`: size of matrix A.
    - `l::Int64`: size of matrix Ak, Bk, Ck.
    - `partialSelection::Bool`: true or false (choose a partial main element).
    - `p::Vector{Int64}`: vector of permutations designated by the function gaussianEliminationLU with partial selection.

    # Return
    - `x::Array{Float64}`: vector x.

    # Examples
    ```
    julia> a = openFileWithMatrix("A/A.txt")
    julia> b = openFileWithVectorOfRightSites("A/b.txt")
    julia> c = gaussianEliminationLU(a[1], a[2], a[3], true)
    julia> decompositionOfLU(c[1], b, a[2], a[3], true, c[2])
    ```
    """
    function decompositionOfLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, partialSelection::Bool, p::Vector{Int64})
        z = Array{Float64}(n)
        x = Array{Float64}(n)
        if partialSelection == true
            for i in 1:n
                s = b[p[i]]
                fromC = convert(Int64, (l * trunc((i - 1) / l)))
                if fromC < 1
                    fromC = 1
                end
                for j in fromC:i-1
                    s -= A[j, p[i]] * z[j]
                end
                z[i] = s
            end
            for i in n:-1:1
                toC = convert(Int64, (2 * l + l * trunc(p[i] / l)))
                if toC >= n
                    toC = n
                end
                a = z[i]
                for j in i+1:toC
                    a -= A[j, p[i]] * x[j]
                end
                if abs(A[i, p[i]]) < eps(Float64)
                    error("Błąd: znaleziony element jest zerem")
                end
                x[i] = a / A[i, p[i]]
            end
        else
            for i in 1:n
                s = b[i]
		        fromC = convert(Int64, (l * trunc((i - 1) / l)))
                if fromC < 1
                    fromC = 1
                end
		        for j in fromC : i-1
                    s -= A[j, i] * z[j]
		        end
		        z[i] = s
            end
            for i in n:-1:1
                toC = i + l
                if toC > n
                    toC = n
                end
                s = z[i]
                for j in i+1:toC
                    s -= A[j, i] * x[j]
                end
                if abs(A[i, i]) < eps(Float64)
                    error("Błąd: znaleziony element jest zerem")
                end
                x[i] = s / A[i, i]
            end
        end
        return x
    end # decompositionOfLU

end
