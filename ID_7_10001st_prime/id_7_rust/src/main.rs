const NTH: u32 = 6;

fn main() {
    
}

fn is_prime(num: u32) -> bool {
    let upper = f64::num.sqrt() as u64;
    for i in 2..=upper {
        if num % i == 0 {
            return false;
        }
    }
    true
}

fn find_nth_prime(nth: u32) -> u32 {
    let mut test = 3;
    let mut found = 1;
    while found < nth {
        if is_prime(test)
    }
}