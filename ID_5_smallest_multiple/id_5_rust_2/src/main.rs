const NUM: u32 = 20;

fn main() {
    let answer: Vec<u32> = factorize(&NUM);
    // println!("{}", answer);
}

fn factorize(num: &u32) -> Vec<u32> {
    let mut factorization = Vec::<u32>::with_capacity((*num).try_into().unwrap());
    let mut index = 0;
    for i in 2..=*num {
        factorization.push(0);
        index += 1;
        while *num % i == 0 {
            *num /= i;
            factorization[index] += 1;
        }
    }
    factorization
}

fn find_smallest(num: &u32) -> u32 {
    *num
}
