fn is_prime(num: i64) -> bool {
    let mut i = 2;
    while i * i <= num {
        if num % i == 0 {
            return false;
        }
        i += 1;
    }
    return true;
}


fn main() {
    const NUM: i64 = 2_000_000;
    let mut sum: i64 = 2;
    let mut i: i64 = 3;
    while i < NUM {
        if is_prime(i) {
            // println!("{}", i);
            sum += i;
        }
        i += 2;
    }
    println!("{}", sum)
}
