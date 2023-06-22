//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI
var buttonIndex = 4;
var announcementsCount = loadAnnouncementData().count - 1
var textsss = "hello"


struct DashboardView: View
{
    let userData = loadUserData()
    let currentUserData = loadCurrentUserData()
    let impacts = loadMapData()
    let announcements = loadAnnouncementData()
    @State var selectedDated: Date = Date()
    @State private var toMaps = false
    @State private var toEvent = false
    @State private var indexs = 0
    //
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
        
        private let calendar: Calendar
        private let monthDayFormatter: DateFormatter
        private let dayFormatter: DateFormatter
        private let weekDayFormatter: DateFormatter
        private let timeFormatter: DateFormatter
        
        @State private var selectedDate = Self.now
        private static var now = Date() // Cache now
        
        init(calendar: Calendar) {
            self.calendar = calendar
            self.monthDayFormatter = DateFormatter(dateFormat: "MM/dd", calendar: calendar)
            self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
            self.weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar)
            self.timeFormatter = DateFormatter(dateFormat: "H:mm", calendar: calendar)
        }
    
    var body: some View {
        NavigationView
        {
            if toEvent
            {
                EventsView(with:loadEvent(date: selectedDate))
            }else if toMaps
            {
                EventsView(with:loadMapData()[indexs])
            }else
            {
                ZStack
                {
                    Color("Beige")
                        .ignoresSafeArea()
                    
                    VStack
                    {
                        ScrollView{
                            VStack {
                                        ScrollView() {
                                            HStack {
                                                VStack(alignment: .center, spacing: 10) {
                                                    Text(Date().formatted(date: .abbreviated, time: .omitted))
                                                        .foregroundColor(.gray)
                                                    
                                                    Text("Today")
                                                        .font(.title.bold())
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.leading)
                                            
                                            CalendarWeekListView(
                                                calendar: calendar,
                                                date: $selectedDate,
                                                content: { date in
                                                    Button(action: {
                                                        selectedDate = date
                                                        
                                                        withAnimation {
                                                            taskModel.currentDay = date
                                                        }
                                                    }) {
                                                        VStack(spacing: 10) {
                                                            Text(dayFormatter.string(from: date))
                                                                .font(.system(size: 15))
                                                                .fontWeight(.semibold)
                                                            
                                                            Text(weekDayFormatter.string(from: date))
                                                                .font(.system(size: 14))
                                                            
                                                            Circle()
                                                                .fill(.white)
                                                                .frame(width: 8, height: 8)
                                                                .opacity(calendar.isDate(date, inSameDayAs: selectedDate) ? 1 : 0)
                                                            
                                                        }
                                                        .foregroundStyle(calendar.isDate(date, inSameDayAs: selectedDate) ? .primary : .secondary)
                                                        .foregroundColor(calendar.isDate(date, inSameDayAs: selectedDate) ? .white : .black)
                                                        .frame(width: 45, height: 90)
                                                        .background(
                                                            ZStack {
                                                                if calendar.isDate(date, inSameDayAs: selectedDate) {
                                                                    Capsule()
                                                                        .fill(Color.blue)
                                                                }
                                                            }
                                                        )
                                                    }
                                                },
                                                title: { date in
                                                    HStack {
                                                        Text(monthDayFormatter.string(from: selectedDate))
                                                            .font(.headline)
                                                            .padding(5)
                                                        Spacer()
                                                    }
                                                    .padding([.bottom, .leading], 10)
                                                }, weekSwitcher: { date in
                                                    Button {
                                                        withAnimation(.easeIn) {
                                                            guard let newDate = calendar.date(
                                                                byAdding: .weekOfMonth,
                                                                value: -1,
                                                                to: selectedDate
                                                            ) else {
                                                                return
                                                            }
                                                            
                                                            selectedDate = newDate
                                                        }
                                                    } label: {
                                                        Label(
                                                            title: { Text("Previous") },
                                                            icon: { Image(systemName: "chevron.left") }
                                                        )
                                                            .labelStyle(IconOnlyLabelStyle())
                                                            .padding(.horizontal)
                                                    }
                                                    Button {
                                                        withAnimation(.easeIn) {
                                                            guard let newDate = calendar.date(
                                                                byAdding: .weekOfMonth,
                                                                value: 1,
                                                                to: selectedDate
                                                            ) else {
                                                                return
                                                            }
                                                            
                                                            selectedDate = newDate
                                                        }
                                                    } label: {
                                                        Label(
                                                            title: { Text("Next") },
                                                            icon: { Image(systemName: "chevron.right") }
                                                        )
                                                            .labelStyle(IconOnlyLabelStyle())
                                                            .padding(.horizontal)
                                                    }
                                                }
                                            )
                                            
                                            TasksView()
                                        }
                        }
                            VStack
                            {

                                    Text("\(textsss)")
                                VStack{
                                    Text(" ")
                                        .padding(5)
    //                                        Text(" Wellcome \(userData[currentUserIndexValue].fullName)")
    //                                            .font(.title3)
                                    Text("Announcements")
                                        .font(.largeTitle)
                                        .bold()
                                    Image(announcements[buttonIndex].immageLinkSource)
                                        .resizable()
                                        .frame(width: 375, height: 200)
                                        .background(Color("Beige").opacity(0.8))
                                        .ignoresSafeArea()
                                        .padding(.horizontal, 20)

                                    swipeGesture()

                                        Text("Copyright © 2023- All Rights Reserved")
                                            .ignoresSafeArea()
                                            .font(.caption2)
                                    Text(announcements[buttonIndex].title)
                                        .frame(width: 330, height: 80)
                                        .padding(.horizontal, 30)
                                        .cornerRadius(10)
                                        .font(.title3)
                                        .background(Color("Beige").opacity(0.8))
                                        .ignoresSafeArea()

                                    Text(announcements[buttonIndex].announcment)
                                        .frame(width: 330, height: 300)
                                        .padding(.horizontal, 30)
                                        .cornerRadius(10)
                                        .background(Color("Beige").opacity(0.8))
                                        .ignoresSafeArea()
                                        .lineLimit(nil)
                                }
                                Section(header: Text("Upcoming Events").font(.title).frame(width: 400, height: 50).background(Color("Beige").opacity(0.8)))
                                {
                                    ForEach(impacts.indices)
                                    {
                                        index in

                                        NavigationLink("\(impacts[index].title)", destination: EventsView(with:loadMapData()[index]))
                                            .frame(width: 330, height: 50)
                                            .background(Color("Clay"))
                                            .cornerRadius(20)
                                            .foregroundColor(Color("DarkBlue"))
                                    }
                                }



                            }
                        }
                }
            }
            
        }
        
    }
    /**
     This function is used to pass the index of the event to the EventsView
     */
//    func findIndex(index: Int)
//    {
//        indexs = index
//    }
}

    struct DashboardView_Previews: PreviewProvider {
        static var previews: some View {
            Group{
                DashboardView(calendar: Calendar(identifier: .gregorian))
            }
        }
}

struct swipeGesture: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return swipeGesture.Coordinator()
    }
    func makeUIView(context: UIViewRepresentableContext<swipeGesture>) -> some UIView {
        let view = UIView()
        view.backgroundColor = .black
        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.right))
        right.direction = .right
        view.addGestureRecognizer(left)
        view.addGestureRecognizer(right)
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<swipeGesture>) {
        
    }
    
    class Coordinator : NSObject{
        @objc func left(){
            if(buttonIndex <= 0)
            {
                buttonIndex = announcementsCount
            }else
            {
                buttonIndex = buttonIndex - 1
            }
            textsss = "left"
        }
        @objc func right(){
            print("Swipe right")
            
            textsss = "right"
        }
    }
}


    func TasksView() -> some View {
        LazyVStack(spacing: 10) {
                    if let tasks = taskModel.filteredTasks {
                        if tasks.isEmpty {
                            Text("No Task")
                                .font(.system(size: 16))
                                .fontWeight(.light)
                                .offset(y: 100)
                        } else {
                            ForEach(tasks) { task in
                                TaskCardView(task: task)
                            }
                        }
                    } else {
                        ProgressView()
                            .offset(y: 100)
                    }
                }
                .padding()
                .padding(10)
                // MARK: - Updating Tasks
                .onChange(of: taskModel.currentDay) { newValue in
                    taskModel.filterTodayTasks()
                }
        }
        
    func TaskCardView(task: Task) -> some View {
            HStack(alignment: .top, spacing: 25) {
                VStack(spacing: 10) {
                    Button(action: {

                    }, label: {
                        Image(systemName: task.doneFlag ? "checkmark" : "")
                            .font(.caption)
                            .frame(width: 5, height: 5)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(
                                Circle()
                                    .foregroundColor(.blue.opacity(0.38))
                            )
                    })

                    Rectangle()
                        .fill(.black)
                        .frame(width: 3)
                }

                VStack {
                    HStack(alignment: .top, spacing: 10) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(task.title)
                                .font(.title2).bold()
                                .foregroundColor(Color.black)

                            Text(task.description)
                                .font(.callout)
                                .foregroundColor(Color.black.opacity(0.8))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        VStack{
                            Text(task.date.formatted(date: .omitted, time: .shortened))
                                .foregroundColor(Color.blue)
                            Spacer()
                                .frame(height: 30)
                            NavigationLink("Visit Event", destination: EventsView(with:loadMapData()[task.index]))
                                .foregroundColor(Color.black)
                                .frame(width: 100, height: 25)
                                .background(Color.blue)
                                .cornerRadius(5)
                        }
                    }

                    Divider()

                }
                .foregroundStyle(taskModel.isCurrentHour(date: task.date) ? .white : .black)
                .padding(taskModel.isCurrentHour(date: task.date) ? 15 : 0)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("CardColor"), Color("CardColor2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .opacity(taskModel.isCurrentHour(date: task.date) ? 1 : 0)
                        .cornerRadius(20)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
        
        
    // MARK: - Component

    public struct CalendarWeekListView<Day: View, Title: View, WeekSwiter: View>: View {
        // Injected dependencies
        private var calendar: Calendar
        @Binding private var date: Date
        private let content: (Date) -> Day
        private let title: (Date) -> Title
        private let weekSwitcher: (Date) -> WeekSwiter
        
        // Constants
        private let daysInWeek = 7
        
        public init(
            calendar: Calendar,
            date: Binding<Date>,
            @ViewBuilder content: @escaping (Date) -> Day,
            @ViewBuilder title: @escaping (Date) -> Title,
            @ViewBuilder weekSwitcher: @escaping (Date) -> WeekSwiter
        ) {
            self.calendar = calendar
            self._date = date
            self.content = content
            self.title = title
            self.weekSwitcher = weekSwitcher
        }
        
        public var body: some View {
            let month = date.startOfMonth(using: calendar)
            let days = makeDays()
            
            VStack {
                HStack {
                    self.title(month)
                    self.weekSwitcher(month)
                }
                HStack {
                    ForEach(days, id: \.self) { date in
                        content(date)
                    }
                    
                }
                
                Divider()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
        
    // MARK: - Conformances
        
    extension CalendarWeekListView: Equatable {
        public static func == (lhs: CalendarWeekListView<Day, Title, WeekSwiter>, rhs: CalendarWeekListView<Day, Title, WeekSwiter>) -> Bool {
            lhs.calendar == rhs.calendar && lhs.date == rhs.date
        }
    }
        
    // MARK: - Helpers
        
    private extension CalendarWeekListView {
        func makeDays() -> [Date] {
            guard let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: date),
                    let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: firstWeek.end - 1)
            else {
                return []
            }
                
            let dateInterval = DateInterval(start: firstWeek.start, end: lastWeek.end)
                
            print(calendar.generateDays(for: dateInterval))
                
            return calendar.generateDays(for: dateInterval)
        }
    }
        
    private extension Calendar {
        func generateDates(
            for dateInterval: DateInterval,
            matching components: DateComponents
        ) -> [Date] {
            var dates = [dateInterval.start]
                
            enumerateDates(
                startingAfter: dateInterval.start,
                matching: components,
                matchingPolicy: .nextTime
            ) { date, _, stop in
                guard let date = date else { return }
                    
                guard date < dateInterval.end else {
                    stop = true
                    return
                }
                    
                dates.append(date)
            }
                
            return dates
        }
            
        func generateDays(for dateInterval: DateInterval) -> [Date] {
            generateDates(
                for: dateInterval,
                    matching: dateComponents([.hour, .minute, .second], from: dateInterval.start)
            )
        }
    }
        
    private extension Date {
        func startOfMonth(using calendar: Calendar) -> Date {
            calendar.date(
                from: calendar.dateComponents([.year, .month], from: self)
            ) ?? self
        }
            
        func startOfDayTime(using calendar: Calendar) -> Date {
            calendar.date(
                from: calendar.dateComponents([.hour, .minute], from: self)
            ) ?? self
        }
    }
        
    private extension DateFormatter {
        convenience init(dateFormat: String, calendar: Calendar) {
            self.init()
            self.dateFormat = dateFormat
            self.calendar = calendar
        }
    }
    // MARK: - Previews

