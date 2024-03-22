//
//  Question.swift
//  PruefungsfitMitFabiFahrrad
//
//  Created by Rebecca Nußbaumer on 13.03.24.
//

import Foundation
import UIKit

struct Question {
    let questionText: String //Frage
    let answers: [String] // 4 Antworten, bei weniger als 2 Antworten werden leere Strings eingesetzt
    let correctAnswer: Int //Index der korrekten Antwort im Antwort-Array, Zahl von 0-3
    let hinweis: String //Dient als Hinweis bei einer falschen Antwort und als Lernhilfe im Lernmodus
    let image: UIImage //Dient als Veranschaulichung der Frage
    
}

//Array von Question-Objekten, dass alle erstellten Fragen aufnimmt
//Werden im Lernmodus in der erstellten Reihenfolge angezeigt
let questions: [Question] = [
    Question(questionText: "Welche Strahler muss ein Fahrrad haben?", answers: ["roter Rückstrahler", "gelbe Rückstrahler an Speichen", "weißer Rückstrahler", "Alle genannten"], correctAnswer: 3, hinweis: "Das Fahrrad muss mit roten Rückstrahlern hinten, einem weißen Rückstrahler vorne und mit gelben Rückstrahlern an Speichen und Pedalen ausgestattet sein.", image: UIImage(named: "q1")!),
    Question(questionText: "Was solltest du vor jeder Fahrt mit deinem Fahrrad machen?", answers: ["Gar nichts", "Luft aufpumpen", "Strahler reinigen", "Prüfen, ob alles in Ordnung ist"], correctAnswer: 3, hinweis: "Vor jeder Fahrt solltest du prüfen, ob dein Fahrrad die benötigte Ausrüstung besitzt und kontrollieren, ob etwas kaputt ist.", image: UIImage(named: "q1")!),
    Question(questionText: "Welche Farbe sollte der vordere Scheinwerfer haben?", answers: ["Orange", "Rot", "Weiß", "Blau"], correctAnswer: 2, hinweis: "Dein vorderer Scheinwerfer sollte weißes Licht ausstrahlen.", image: UIImage(named: "q3")!),
    Question(questionText: "Was musst du bei jeder Fahrt tragen?", answers: ["Hut", "Knieschützer", "Helm", "Jacke"], correctAnswer: 2, hinweis: "Es ist verpflichtend, bei jeder Fahrt einen Helm aufzusetzen.", image: UIImage(named: "q3")!),
    Question(questionText: "Wie muss dein Helm sitzen?", answers: ["Locker, so dass er noch etwas wackelt", "Sehr fest, sodass es schmerzt", "Zwei Finger Platz unter dem Kinnriemen", "Er muss nicht unbedingt geschlossen sein"], correctAnswer: 2, hinweis: "Dein Helm sollte so eingestellt sein, dass der Kopfring gut passt und dass unter deinem Kinnriemen noch zwei Finger breit Platz ist. Er sollte nicht über das Kinn geschoben werden können.", image: UIImage(named: "q3")!),
    Question(questionText: "Musst du nach einem Aufprall deinen Helm austauschen?", answers: ["Ja", "Nein", "", ""], correctAnswer: 0, hinweis: "Nach einem Unfall könnte dein Helm beschädigt sein und dich nicht mehr sicher schützen - daher musst du einen neuen Helm besorgen.", image: UIImage(named: "q3")!),
    Question(questionText: "Wie sollte deine Kleidung aussehen, wenn du Fahrrad fährst?", answers: ["Möglichst dunkel", "Möglichst hell und reflektierend", "Rote Kleidung ist am besten", "Blaue Kleidung ist am besten"], correctAnswer: 1, hinweis: "Deine Kleidung sollte möglichst hell und reflektierend sein, damit dich die anderen Verkehrsteilnehmer gut sehen können.", image: UIImage(named: "q3")!),
    Question(questionText: "Welche Schuhe sind zum Radfahren geeignet?", answers: ["Ballerinas", "Turnschuhe", "Flip-Flops", "Crocs"], correctAnswer: 1, hinweis: "Du solltest feste, geschlossene Schuhe zum Radfahren tragen - alle anderen könnten zu Verletzungen führen.", image: UIImage(named: "q3")!),
    Question(questionText: "Darfst du deinen Hund auf dem Gepäcksträger transportieren?", answers: ["Ja", "Nein", "", ""], correctAnswer: 1, hinweis: "Dein Hund darf nicht auf dem Gepäcksträger mitfahren, auch wenn er klein ist. Dazu ist ein spezieller Korb notwendig. ", image: UIImage(named: "q3")!),
    Question(questionText: "Was bedeutet dieses Verkehrszeichen?", answers: ["Radfahren verboten", "Radweg", "", ""], correctAnswer: 1, hinweis: "Dieses Zeichen kennzeichnet einen Radweg - hier darfst du mit deinem Fahrrad fahren. Wenn es einen Radweg gibt, musst du sogar auf diesem fahren.", image: UIImage(named: "q3")!),
    Question(questionText: "Darfst du bei diesem Schild weiterfahren?", answers: ["Ja", "Nein", "", ""], correctAnswer: 1, hinweis: "Das ist ein Fahrverbots-Schild - hier darfst du nicht weiterfahren.", image: UIImage(named: "q3")!),
    Question(questionText: "Was bedeutet dieses Schild?", answers: ["Fahrradfahrer ausgenommen, ich darf fahren", "Farradfahrer ausgenommen - ich darf mein Fahrrad schieben", "Ich darf nicht hier fahren", ""], correctAnswer: 0, hinweis: "Bei diesem Schild darf ich weiterfahren, ich muss allerdings gut auf den Verkehr achten.", image: UIImage(named: "q3")!),
    Question(questionText: "Was ist das?", answers: ["Zebrastreifen", "Haltelinie", "Leitlinie", "Richtungspfeile"], correctAnswer: 0, hinweis: "Das ist ein Zebrastreifen, hier musst du Fußgänger darüber gehen lassen und stehen bleiben. ", image: UIImage(named: "q3")!),
    Question(questionText: "Wozu gibt es Richtungspfeile?", answers: ["Zur Orientierung", "Ich darf nur in diese Richtung fahren", "Ich darf nicht in diese Richtung fahren", "Sie gelten nur für Autofahrer"], correctAnswer: 1, hinweis: "Bei Richtungspfeilen darf ich nur in diese Richtung fahren.", image: UIImage(named: "q3")!),
    Question(questionText: "Was sollst du machen, wenn du stehen bleibst?", answers: ["Klingeln", "Laut Stopp rufen", "Einen Fuß am Boden abstellen", "Nach hinten sehen"], correctAnswer: 2, hinweis: "Wenn du stehen bleibst, achte darauf, dass ein Fuß fest am Boden steht.", image: UIImage(named: "q3")!),
    Question(questionText: "In der Fußgängerzone darf ich mit meinem Fahrrad weiterfahren.", answers: ["Richtig", "Falsch", "", ""], correctAnswer: 1, hinweis: "Nein, du musst absteigen und dein Fahrrad schieben. ", image: UIImage(named: "q3")!),
    Question(questionText: "Darf ich auf einem Abbiegestreifen auch gegen die Pfeilrichtung abbiegen?", answers: ["Ja", "Nein", "Nur ausnahmsweise", ""], correctAnswer: 1, hinweis: "Nein, du musst in die Pfeilrichtung abbiegen, sonst könnten dich andere Verkehrsteilnehmer von hinten umfahren.", image: UIImage(named: "q3")!),
    Question(questionText: "Auf was musst du achten, wenn du auf einem Rad- und Fußweg unterwegs bist?", answers: ["Klingeln, damit die Fußgänger aus dem Weg gehen", "Schnell fahren", "Schritttempo fahren", "Das Rad schieben"], correctAnswer: 2, hinweis: "Du musst besonders auf Fußgänger acht geben und daher im Schrittempo fahren. ", image: UIImage(named: "q3")!),
    Question(questionText: "Sind Handzeichen beim Abbiegen Pflicht?", answers: ["Nein, da ich die Balance verlieren könnte", "Nein, es muss niemand wissen, wo ich hinfahre", "Nur auf Abbiegestreifen", "Ja, immer."], correctAnswer: 3, hinweis: "Handzeichen sind immer Pflicht, damit die anderen Verkehrsteilnehmer wissen, wo du hinfahren möchest und so auf dich Acht geben können.", image: UIImage(named: "q3")!),
    Question(questionText: "Wo auf der Fahrbahn sollst du fahren?", answers: ["Mittig", "Rechts", "Links", "Wo es mir gefällt"], correctAnswer: 1, hinweis: "Grundsätzlich fährst du immer so weit rechts, wie nur möglich. Ausnahmen gibt es dann, wenn du etwas ausweichen musst.", image: UIImage(named: "q3")!),
    Question(questionText: "Was bedeutet diese Schleife?", answers: ["Die Lieblingsfarbe der Person ist gelb", "Achtung, diese Person ist taub.", "Schneller vorbeifahren", "Achtung, diese Person ist blind"], correctAnswer: 3, hinweis: "Diese Schleife bedeutet, dass die Person blind ist und somit ist es wichtig, zu klingeln und langsamer zu fahren. Außerdem solltest du mehr Abstand zur Person halten.", image: UIImage(named: "q3")!),
    Question(questionText: "Darfst du bei diese Ampelstellung fahren?", answers: ["Ja", "Nein", "", ""], correctAnswer: 1, hinweis: "Wenn die Ampel gelb ist, musst du stehen bleiben, außer du befindest dich schon auf der Kreuzung. Dann fährst du schnell weiter.", image: UIImage(named: "q3")!),
    Question(questionText: "Musst du bei diesem Schild unbedingt stehen bleiben?", answers: ["Ja", "Nein", "", ""], correctAnswer: 0, hinweis: "Das ist ein Stopp-Schild. Hier musst du auf jedenfalls stehen bleiben und darfst erst wieder weiterfahren, wenn du nach Links und Rechts geschaut hast und kein Fahrzeug zu sehen ist.", image: UIImage(named: "q3")!),

    
]

/* Array von Fragen für das Quiz
Shuffeld zuerst alle Fragen aus dem questions-Array, um dann die ersten 20 Fragen daraus zu wählen - so werden
zufällige Fragen ausgewählt */
var questionsForQuiz = Array(questions.shuffled().prefix(20))
