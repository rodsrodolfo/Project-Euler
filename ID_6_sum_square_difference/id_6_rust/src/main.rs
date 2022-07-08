const NUM: u32 = 100;

fn main() {
    let answer = square_of_sum(NUM) - sum_of_squares(NUM);
    println!("{}", answer)
}

fn sum_of_squares(num: u32) -> u32 {
    let mut sum = 0;
    for i in 1..=num {
        sum += i * i;
    }
    sum
}

fn square_of_sum(num: u32) -> u32 {
    let mut sum = 0;
    for i in 1..=num {
        sum += i;
    }
    sum * sum
}
