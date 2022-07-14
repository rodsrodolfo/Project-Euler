const NUM: i32 = 999;

fn main() {
    println!("{}", find_max_palindrome(NUM));
}

fn is_palindrome(num: i32) -> bool {
    let num_str: String = num.to_string();
    if num_str == num_str.chars().rev().collect::<String>() {
        true
    } else {
        false
    }
}

fn find_max_palindrome(limit: i32) -> i32 {
    let mut largest: i32 = 0;
    let mut test: i32;
    for i in 1..=limit {
        for j in 1..=limit {
            test = i * j;
            if test > largest {
                if is_palindrome(test) {
                    largest = test
                }
            }
        }
    }
    largest
}
