const NUM: u64 = 1_000_000;

fn main() {
    let mut found: (u64, u64) = (1, len_collatz(1));
    for i in 2..NUM {
        let collatz: u64 = len_collatz(i);
        if collatz > found.1 {
            found = (i, collatz)
        }
    }

    println!("Number: {}\nLength: {}", found.0, found.1)
}

fn len_collatz(mut num: u64) -> u64 {
    let mut len: u64 = 1;
    while num != 1 {
        len += 1;
        if num % 2 == 0 {
            num = num / 2;
        } else {
            num = 3 * num + 1;
        }
    }
    len
}
