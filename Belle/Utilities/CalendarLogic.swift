//
//  CalendarLogic.swift
//  Belle
//
//  Created by Yugo Matsuda on 2021-03-07.
//

import Foundation
class CalenderLogic{
    
    
    func getCurrentYear()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "y", options: 0, locale: Locale.current)
        formatter.string(from: Date())
        return formatter.string(from: Date())

    }
    func getCurrentMonth()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM", options: 0, locale: Locale.current)
        formatter.string(from: Date())
        return formatter.string(from: Date())

    }
    func getCurrentDay()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dd", options: 0, locale: Locale.current)
        formatter.string(from: Date())
        return formatter.string(from: Date())

    }
    
    func getMonthDays(year:Int,month:Int) -> Int{
        let calendar = Calendar(identifier: .gregorian)
           var components = DateComponents()
           components.year = year
           // 日数を求めたい次の月。13になってもOK。ドキュメントにも、月もしくは月数とある
           components.month = month + 1
           // 日数を0にすることで、前の月の最後の日になる
           components.day = 0
           // 求めたい月の最後の日のDateオブジェクトを得る
           let date = calendar.date(from: components)!
           let dayCount = calendar.component(.day, from: date)
           print("\(month)月 \(dayCount)日")
        return dayCount
    }




    func getDayOfWeek(_ year: Int, _ month: Int, _ day: Int)-> String{
        
        let dayOfweek = calcDayOfWeek(year, month, day)
        var dayofTheWeek = ""
        switch  dayOfweek{
        case 1:
        dayofTheWeek = "MON"
        case 2:
        dayofTheWeek = "TUE"
        case 3:
        dayofTheWeek = "WED"
        case 4:
        dayofTheWeek = "THU"
        case 5:
        dayofTheWeek = "FRI"
        case 6:
        dayofTheWeek = "SAT"
        case 7:
        dayofTheWeek = "SUN"
        default:
        print("Nothing")
        dayofTheWeek = "SUN"

        }
        return dayofTheWeek
    }
    
    func getMonthName(month: Int)-> String{
        var monthName = ""
        switch  month{
        case 1:
        monthName = "JAN"
        case 2:
        monthName = "FEB"
        case 3:
        monthName = "MAR"
        case 4:
        monthName = "APR"
        case 5:
        monthName = "MAY"
        case 6:
        monthName = "JUN"
        case 7:
        monthName = "JUL"
        case 8:
        monthName = "AUG"
        case 9:
        monthName = "SEP"
        case 10:
        monthName = "OCT"
        case 11:
        monthName = "NOV"
        case 12:
        monthName = "DEC"
        default:
        print("Nothing")

        }
        return monthName
    }
    func getMonthFullName(month: Int)-> String{
        var monthName = ""
        switch  month{
        case 1:
        monthName = "January"
        case 2:
        monthName = "February"
        case 3:
        monthName = "March"
        case 4:
        monthName = "April"
        case 5:
        monthName = "May"
        case 6:
        monthName = "June"
        case 7:
        monthName = "July"
        case 8:
        monthName = "August"
        case 9:
        monthName = "September"
        case 10:
        monthName = "October"
        case 11:
        monthName = "November"
        case 12:
        monthName = "December"
        default:
        print("Nothing")

        }
        return monthName
    }


    func calcDayOfWeek(_ year: Int, _ month: Int, _ day: Int) -> Int {
        
        var year = year
        var month = month
        if month == 1 || month == 2 {
            year -= 1
            month += 12
        }
        let zellerCongruence = { (year: Int, month: Int, day: Int) in (year + year/4 - year/100 + year/400 + (13 * month + 8)/5 + day) % 7 }
        return zellerCongruence(year, month, day)
    }
    func getDay(_ date:Date) -> (Int,Int,Int){
              let tmpCalendar = Calendar(identifier: .gregorian)
              let year = tmpCalendar.component(.year, from: date)
              let month = tmpCalendar.component(.month, from: date)
              let day = tmpCalendar.component(.day, from: date)
              return (year,month,day)
    }
    
}
