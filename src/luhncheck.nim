from strutils import parseInt
from system import toOpenArray
from algorithm import reversed
from math import floor

proc validate*(number: int64): bool =
    let numberString = $number
    let numberArrayReversed = reversed(toOpenArray(numberString, 0, len(numberString) - 1))
    var oddSum, evenSum: int
    for i in countup(0, numberArrayReversed.len() - 1):
        if i mod 2 == 0:
            oddSum += parseInt($numberArrayReversed[i])
        else:
            evenSum += toInt(floor((2 * parseInt($numberArrayReversed[i])) / 10)) + (2 * parseInt($numberArrayReversed[i]) mod 10)
    return (evenSum + oddSum) mod 10 == 0