const NTH: u32 = 10_001;

fn main() {
    println!("{}", find_nth_prime(&NTH));
}

fn is_prime(num: &u32) -> bool {
    let upper = (*num as f64).sqrt() as u32;
    for i in 2..=upper {
        if *num % i == 0 {
            return false;
        }
    }
    true
}

fn find_nth_prime(nth: &u32) -> u32 {
    let mut test = 1;
    let mut found = 1;
    while found < *nth {
        test += 2;
        if is_prime(&test) {
            found += 1;
        }
    }
    test
}