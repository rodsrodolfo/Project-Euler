const SUM: usize = 1000;

fn main() {
    let triplet = find_triplet(SUM).expect("Error");
    println!("{} {} {}", triplet.0, triplet.1, triplet.2);
    println!("{}", triplet.0 * triplet.1 * triplet.2);
}

fn find_triplet(sum: usize) -> Result<(f32, f32, f32), String> {
    let (mut a, mut b, mut c): (f32, f32, f32);
    for i in 1..sum {
        for j in (i+1)..sum {
            a = i as f32;
            b = j as f32;
            c = (a * a + b * b).sqrt();
            if a + b + c == sum as f32 {
                return Ok((a, b, c));
            }
        }
    }
    Err("find_triplet: no triplet found".to_owned())
}