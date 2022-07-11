fn main() {
    let mut num: u32 = 20;
    while !is_divisable(&num){
        num += 1;
    }
    println!("{}", num);
}

fn is_divisable(num: &u32) -> bool {
    for i in 1..=20 {
        if *num % i != 0 {
            return false;
        }
    }
    true
}
