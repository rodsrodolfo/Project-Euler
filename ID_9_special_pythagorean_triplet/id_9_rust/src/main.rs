const SUM: usize = 1000;

fn main() {
    let triplet = find_triplet(SUM);
    println!("{} {} {}", triplet.0, triplet.1, triplet.2);
    println!("{}", triplet.0 * triplet.1 * triplet.2);
}

fn find_triplet(sum: usize) -> (f32, f32, f32) {
    let (mut a, mut b, mut c): (f32, f32, f32);
    for i in 1..sum {
        for j in i+1..sum {
            a = i as f32;
            b = j as f32;
            c = (a*a + b*b).sqrt();
            if a + b + c == sum as f32 {
                return (a, b, c);
            }
        }
    }
    (0.0, 0.0, 0.0)
}
