// просто человек, может говорить о своём настроении
class Person {
    let firstName : String
    let secondName : String
    var age : Int
    
    init(firstName: String, secondName : String, age : Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.age = age
    }
    
    func getMood () {
        print("У меня прекрасное настроение")
    }
}

// класс работника библиотеки, челик может работать и говорить о своём настроении
class Worker : Person {
    let id : Int
    var workExperience : Int
    var levelOfResponsibility : LevelOfResponsibility
    private var salary : Int
    
    init(firstName: String, secondName : String, age : Int, id : Int, workExperience : Int, levelOfResponsibility : LevelOfResponsibility) {
        self.id = id
        self.workExperience = workExperience
        self.levelOfResponsibility = levelOfResponsibility
        self.salary = 0
        super.init(firstName: firstName, secondName: secondName, age: age)
        self.salary = countSalary()
    }
    
    override func getMood() {
        print("У МЕНЯ ХОРОШЕЕ НАСТРОЕНИЕ, НО Я МНОГО РАБОТАЮ")
    }
    
    func doWork() {
        fatalError("We don't know this.")
    }
    
    private func countSalary() -> Int {
        let supplement = workExperience * 1000
        switch levelOfResponsibility {
        case .specialist:
            return 50000 + supplement
        case .responsibleEmployee:
            return 70000 + supplement
        case .manager:
            return 100000 + supplement
        case .director:
            return 150000 + supplement
        case .owner:
            return 200000 + supplement
        }
    }
}

// перечисление уровней ответственности работников
enum LevelOfResponsibility {
    case specialist
    case responsibleEmployee
    case manager
    case director
    case owner
}

// читатель, юзер библэотеки
class Reader : Person {
    var amountOfReadenBooks : Int?
    let id : Int
    
    init(firstName: String, secondName : String, age : Int, id : Int, amountOfReadenBooks : Int?) {
        self.id = id
        self.amountOfReadenBooks = amountOfReadenBooks
        super.init(firstName: firstName, secondName: secondName, age: age)
    }
    
    override func getMood() {
        print("У меня всё милкис, я люблю читать")
    }
    
    func readBook (book: Book) {
        print("Я читаю крутую книгу: \(book.name)")
    }
}

// протокол работы библиотекаря
protocol ILabrarian {
    var booksInLibrary: [Book] {get set}
    func getBookById(id: Int) -> Book?
}

// библиотекарь
class Librarian : Worker, ILabrarian {
    var booksInLibrary: [Book]
    
    init(booksInLibrary: [Book], firstName: String, secondName : String, age : Int, id : Int, workExperience : Int, levelOfResponsibility : LevelOfResponsibility) {
        self.booksInLibrary = booksInLibrary
        super.init(firstName: firstName, secondName: secondName, age: age, id: id, workExperience: workExperience, levelOfResponsibility: levelOfResponsibility)
    }
    
    func getBookById(id: Int) -> Book? {
        for book in booksInLibrary {
            if book.id == id {return book}
        }
        print("Такой книжки нету(")
        return nil
    }
    
    override func getMood() {
        print("Прекрасное место библиотека, тут спокойно, я в порядке")
    }
    
    override func doWork() {
        print("Сейчас я работаю, обычно я на работе с 9 до 21")
    }
}

// к нижка
struct Book {
    let name : String
    let id : Int
    let countOfPapers : Int
    let author : String
    let bookType : BookType
    
    init (countOfPapers: Int, author: String, bookType: BookType, name: String, id: Int) {
        self.author = author
        self.countOfPapers = countOfPapers
        self.bookType = bookType
        self.id = id
        self.name = name
    }
}

// тип книжки
enum BookType {
    case classicLitruture
    case singhfictionLitruture
    case childrenLitruture
    case phycologistLitruture
}

// какое-то место в библе
struct PlaceInLibrary {
    let placeType : PlaceType
    var placesToSeatCount : Int
    var rating : Int
}

// тип места в библе
enum PlaceType {
    case eatZone
    case readZone
    case chillZone
    case otherZone
}

// протокол общей работы библиотеки
protocol ILibraryWork {
    var placesInLibrary : [PlaceInLibrary] { get }
    var workersInLibrary : [Worker] { get set }
    
    func addWorkExperienceToWorkers (experience: Int)
    func countRatingOfLibrary () -> Int
}

// функции библиотеки
class LibraryWork : ILibraryWork{
    var placesInLibrary: [PlaceInLibrary]
    var workersInLibrary: [Worker]
    
    init(placesInLibrary: [PlaceInLibrary], workersInLibrary: [Worker]) {
        self.workersInLibrary = workersInLibrary
        self.placesInLibrary = placesInLibrary
    }
    
    func countRatingOfLibrary() -> Int {
        var rating = 0
        for place in placesInLibrary{
            rating += place.rating
        }
        return rating
    }
    
    func addWorkExperienceToWorkers (experience: Int) {
        for worker in workersInLibrary {
            worker.workExperience += experience
        }
    }
}

// структура автомата навигации
struct HelperMachine {
    let size : Int
    let color : String
    func tellAboutLibrary () {
        print("Национа́льная библиоте́ка Респу́блики Татарста́н (тат. Татарстан Республикасы Милли китапханәсе) — главное книгохранилище Республики Татарстан для национальных, республиканских, русских и зарубежных изданий. Она содержит более трех миллионов двухсот тысяч документов, в том числе более 100 тысяч документов на татарском языке и еще 100 тысяч на иностранных языках[1].")
    }
}



