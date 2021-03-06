// Foundation not needed



struct SaddlePointsMatrix {
    
    let rows: [[Int]]
    let columns: [[Int]]
    let saddlePoints: [[Int]]
    
    init(_ matrix: String) {
        var rows = [[Int]]()
        
        let rowItems = matrix.characters.split("\n").map { String($0) }
        
        for row in rowItems {
            let rowItems = row.characters.split(" ").map { Int(String($0)) ?? 0 }
            rows.append(rowItems)
        }
        
        self.rows = rows
        
        var columns = [[Int]]()
        
        let count = rows[0].count
        for i in 0..<count {
            var column = [Int]()
            
            for row in rows {
                column.append(row[i])
            }
            
            columns.append(column)
        }
        
        self.columns = columns
        
        var saddlePoints = [[Int]]()
        for (j, row) in rows.enumerate() {
            let max = row.maxElement() ?? 0
            for (i, number) in row.enumerate() {
                let min = columns[i].minElement() ?? 0
                if number == max && number == min {
                    saddlePoints.append([j, i])
                }
            }
        }
        
        self.saddlePoints = saddlePoints
    }

}
