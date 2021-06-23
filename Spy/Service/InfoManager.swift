//
//  DataManager.swift
//  Spy
//
//  Created by Илья Тюрин on 17.04.2021.
//

class InfoManager {
    
    static let shared = InfoManager()
    private init() {}
    
    let imagesForLocations = ["allLocations",
                              "countries",
                              "sports",
                              "travels",
                              "culture",
                              "child",
                              "timeMachine",
                              "adult"]
    
    let titlesForFAQ = ["Как играть?",
                        "Игровой процесс",
                        "Очередность вопросов",
                        "Как победить?",
                        "Таймер",
                        "Ты шпион?",
                        "Ты гражданин?",
                        "Несколько шпионов"]
    
    let definitionsForFAQ = ["После начала игры все игроки поочередно узнают свою роль. В игре две роли - граждане и шпионы. Всем гражданам показывается определенна локация. Шпион же локации не знает. Цель у граждан - вычислить шпиона или шпионов, если вы выбрали несколько. Цель шпиона - не выдать себя, при этом, догадавшись, о какой локации говорят граждане.",
                             "Игра начинается после запуска таймера. Задавайте друг другу вопросы о локации, указаной на карточке. Выбирайте не слишком очевидные вопросы, чтобы шпион не догадался. К примеру: «В этом месте нужна спецодежда?», «Это место есть в нашем городе?».  Постарайтесь понять, кто действительно знает о какой локации идет речь, а кто делает вид, пока время не истекло.",
                             "Первым игроком, задающим вопрос будет тот, кто последний узнал свою роль. Кому задавать вопрос выбирает сам игрок. Затем, вопрос задает тот, кто только что ответил, снова выбирая свою цель.",
                             "До окончания таймера у граждан есть право начать голосование против того игрока, которого они считают наиболее подозрительным. Если после голосования оказалось, что игрок является гражданином, шпион побеждает.  Если же этот игрок оказывается шпионом, то ему предстоит с одной попытки угадать локацию. Если он прав, победа, если не угадал - победа граждан. Также, если голосование не было проведено до окончания таймера шпион автоматически побеждает.",
                             "Вы также можете выбрать время игры, установив таймер на определенное значение. Попробуйте разные варианты. Если времени будет слишком много - шпион точно успеет угадать локацию, если же мало, граждане просто не успеют вычислить шпиона.",
                             "Постарайся понять, о какой локации говорят граждане, и не выдать себя первым же неправильным ответом. Если до окончания таймера ты уже точно понимаешь, о чем идет речь, у тебя есть право досрочно угадать локацию. Если угадал - побеждаешь!",
                             "Подумай, какой вопрос задать следующим. К примеру, если локация будет «Япония», не нужно спрашивать «Любят ли в этой локации есть суши?», ответ будет да или нет, шпиону не составит труда попасть в один из двух ответов. Лучше спроси, к примеру: «Какое блюдо наиболее распространено в этой локации?». Вариативность ответов больше, а значит, шпиону намного сложнее попасть в точку.",
                             "Чтобы гражданам победить, нужно вычислить всех шпионов. Если на первом голосовании граждане угадали шпиона, то игра продолжается, пока не угадают всех."]
}

enum Groupes: String {
    case allLocations = "Все локации"
    case coutries = "Страны"
    case sports = "Спорт"
    case travels = "Путешествия"
    case culture = "Культура"
    case child = "Дети"
    case timeMachine = "Машина времени"
    case adult = "Для взрослых"
    
    var allLocation: [String] {
        Groupes.coutries.definition +
            Groupes.sports.definition +
            Groupes.travels.definition +
            Groupes.culture.definition +
            Groupes.child.definition +
            Groupes.timeMachine.definition +
            Groupes.adult.definition
    }
    
    var definition: [String] {
        switch self {
        case .coutries:
            return ["Россия", "Беларусь", "Япония", "США", "Украина", "Великобритания", "Франция", "Италия", "Китай", "Индия", "Канада", "Греция", "Южная Корея", "Турция", "Нигер", "Ирак", "ЮАР", "Мексика", "Чили", "Аргентина", "Куба", "Доминикана", "Бразилия", "Исландия", "Германия", "Египет", "Саудовская Аравия", "Казахстан", "Австралия"]
        case .sports:
            return ["Спортивная площадка", "Поле для гольфа", "Футбольный стадион", "Серфинг", "Хоккейная арена", "Бассейн", "Гоночный трек", "Тренажерный зал", "Теннисный корт", "Велосипедная дорожка", "Пляжный воллейбол", "Трасса для мото-кросса", "Ралли", "Трамплин для прыжков в воду", "Бобслей", "Горнолыжный спуск", "Октагон"]
        case .travels:
            return ["Самолет", "Корабль", "Подводная лодка", "Автобус", "Трамвай", "Космический корабль", "Метро", "Поезд", "Автомобиль", "Такси", "Скейтборд", "Хостел", "Отель", "Палатка", "Пляж", "Автосервис"]
        case .culture:
            return ["Галерея", "Музей", "Театр", "Планетарий", "Кинотеатр", "Выставка", "Концертный зал", "Экскурсия", "Палеонтологический музей", "Ресторан", "Церковь", "Корпоративная вечеринка", "Казино"]
        case .child:
            return ["Детская площадка", "Школа", "Детский сад", "Зоопарк", "Каток", "Цирк", "Пиццерия", "Урок физкультуры", "Урок труда", "Торговый центр", "День рождения", "За гаражами", "Батутный центр", "Лазертаг", "Парк аттракционов"]
        case .timeMachine:
            return ["Первая мировая война", "Вторая мировая", "Древняя греция", "Древний Рим", "Город будущего", "1980-е", "1990-е", "2000-е", "СССР", "Средневековье", "Дикий запад", "Каменный век", "Мезозой", "Палеолит"]
        case .adult:
            return ["Стрип-клуб", "Гей-клуб", "Интим-магазин", "Дом престарелых", "Общага", "Тюрьма", "Массажный салон", "Спальня", "Курилка", "Вытрезвитель", "Общество анонимных алкоголиков"]
        case .allLocations:
            return allLocation
        }
    }
    
}

