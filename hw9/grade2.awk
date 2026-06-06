NR == 1 {
    for (i = 1; i <= NF; i++) header[i] = $i
    ncols = NF
    for (i = 1; i <= NF; i++) printf "%-8s", $i
    printf "%-8s %-8s\n", "총점", "평균"
    next
}
{
    total = 0
    printf "%-8s %-8s", $1, $2
    for (i = 3; i <= NF; i++) {
        printf "%4d    ", $i
        total += $i
        colsum[i] += $i
    }
    avg = total / (NF - 2)
    printf "%6d %6.1f\n", total, avg
    count++
}
END {
    printf "%16s", ""
    for (i = 3; i <= ncols; i++)
        printf "%4.1f    ", colsum[i] / count
    printf "\n"
}
