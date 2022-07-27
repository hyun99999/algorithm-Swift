func solution(_ n:Int) -> Int {
    var primes:[Bool] = [Bool](repeating:false, count:n+1);
    var count = 0;
    // 에라토스테네스의 체: 소수의 배수는 소수가 될 수 없다.
    
    // 0,1은 사용하지 않고 2부터 n 까지 검사.
    for i in 2...n {
        // 소수 체크.
        if(!primes[i]){
            count = count + 1;
        }
        
        for j in 1...(n/i) {
            primes[i*j] = true;
        }
    }
    return count;
}

print(solution(5))
