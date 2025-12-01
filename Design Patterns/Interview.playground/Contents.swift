import UIKit

let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)

queue.sync {
    queue.async {
        print("Task 1 started")
        sleep(2)
        print("Task 1 ended")
    }
    
    queue.sync {
        print("Task 2 started")
        for i in 1...5 {
            print(i)
        }
        print("Task 2 ended")
    }
    
    queue.async {
        print("Task 3 started")
        for i in 11...15 {
            print(i)
        }
        print("Task 3 ended")
    }

}

//Expected Output:

// Either it can be T1 started/ T3 started first
// Once T2 starts --> Execution of this is done completedly that is T2 started ---> Print (1...5) ---> T2 ended
// Then if T1 starts first, T1 ends first --> then T3
// Then if T3 starts first, T2 ends first --> then T1
