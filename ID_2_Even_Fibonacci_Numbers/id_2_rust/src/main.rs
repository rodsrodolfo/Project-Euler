fn main() {
    let (mut fib1, mut fib2, mut sum) = (1, 2, 0);

    while fib2 < 4_000_000 {
        if fib2 % 2 == 0 {
            sum += fib2;
        }
        (fib1, fib2) = (fib2, fib1 + fib2);
    }

    println!("{}", sum)
}

// answer: 4613732
