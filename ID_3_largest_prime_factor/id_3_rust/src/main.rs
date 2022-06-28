fn main() {
    let mut num = 600851475143_i64;
    let (mut largest, mut candidate) = (0, 2);

    while candidate * candidate < num {
        while num % candidate == 0 {
            num /= candidate;
            largest = candidate;
        }
        candidate += 1;
    }
    if largest > num {
        println!("{}", largest);
    } else {
        println!("{}", num);
    }
}

// answer: 6857
