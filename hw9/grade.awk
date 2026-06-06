NR == 1 {
    printf "%-6s %-6s %4s %4s %4s %6s %6s\n", $1, $2, $3, $4, $5, "총점", "평균"
    next
}
{
    total = $3 + $4 + $5
    avg = total / 3.0
    printf "%-6s %-6s %4d %4d %4d %6d %6.1f\n", $1, $2, $3, $4, $5, total, avg
    sum3 += $3
    sum4 += $4
    sum5 += $5
    count++
}
END {
    printf "%40s %6.1f %6.1f %6.1f\n", "", sum3/count, sum4/count, sum5/count
}
