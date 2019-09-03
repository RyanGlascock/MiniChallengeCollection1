//: Playground - noun: a place where people can play

import UIKit

enum StudentYear: Int {
    case freshman, sophomore, junior, senior
}

struct Student {
    let firstName: String
    let lastName: String
    let id: Int
    let year: StudentYear
    let grade: Int
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.id  = Int(arc4random_uniform(1000))
        self.year = StudentYear(rawValue: Int(arc4random_uniform(4))) ?? .freshman
        self.grade = Int(arc4random_uniform(101))
    }
}

var students: [Student] = [
    Student(firstName: "Sterling", lastName: "Archer"),
    Student(firstName: "Lana", lastName: "Kane"),
    Student(firstName: "Cheryl", lastName: "Tunt"),
    Student(firstName: "Pam", lastName: "Poovey"),
    Student(firstName: "Cyril", lastName: "Figgis"),
    Student(firstName: "Ray", lastName: "Gillette"),
    Student(firstName: "Malory", lastName: "Archer"),
    Student(firstName: "Barry", lastName: "Dillon"),
    Student(firstName: "Ron", lastName: "Cadillac"),
    Student(firstName: "Ross", lastName: "Geller"),
    Student(firstName: "Chandler", lastName: "Bing"),
    Student(firstName: "Rachel", lastName: "Green"),
    Student(firstName: "Joey", lastName: "Tribbiani"),
    Student(firstName: "Monica", lastName: "Geller"),
    Student(firstName: "Phoebe", lastName: "Buffay")
]

let freshmen1 = students.filter {
    (student) in
    return student.year == StudentYear.freshman
}
for student in freshmen1 {
    print("\(student.firstName) is a \(student.year)")
}
let freshmen2  = students.filter {
    return $0.year == StudentYear.freshman
}
for student in freshmen2 {
    print("\(student.firstName) is a \(student.year)")
}


let freshmen3 = students.filter({
    (student) in
    return student.year == StudentYear.freshman
})
for student in freshmen3 {
    print("\(student.firstName) is a \(student.year)")
}
let studentNames1 = students.map {
    (student) in
    return student.firstName + " " + student.lastName
}
for name in studentNames1 {
    print(name)
}
let studentNames2 = students.map {
    return $0.firstName + " " + $0.lastName
}
for name in studentNames2 {
    print(name)
}

let gradeSum1 = students.reduce(0) {
    (result, student) in
    return result + student.grade
}

let gradeAverage1 = gradeSum1 / students.count
print(gradeAverage1)

let gradeSum2 = students.reduce(0) {
    return $0 + $1.grade
}

let gradeAverage2 = gradeSum2 / students.count
print(gradeAverage2)

var total = 0
for student in students {
    total += student.grade
}
let average = total / students.count
print(average)

let freshmanTotal1 = freshmen1.reduce(0) {
    (result, student) in
    return result + student.grade
}
let freshmanAverage1 = freshmanTotal1 / freshmen1.count
print(freshmanAverage1)

let freshmanTotal2 = students.filter({$0.year == StudentYear.freshman}).reduce(0, {$0 + $1.grade})
