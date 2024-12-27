Bitte erstelle aus folgendem Text Anki Karten. 
Decke dabei alle Aspekte des Textes ab. 
Es ist sehr wichtig, dass du auf die 20 Regeln des Anki Karten erstellens achtest. 

Erstelle die Karten als CSV. Formatiere die Karten so: `frage \t antwort`. Eine Karte pro Zeile


```text
6.1.1 Nebenläufigkeit, atomare Aktionen und Race Conditions
Nebenläufigkeit. Der Begriff Nebenläufigkeit bezeichnet bei Betriebssystemen ganz
allgemein die parallele oder quasi-parallele Ausführung von Befehlen auf einer
CPU oder mehreren CPUs bzw. Rechnerkernen. Prozesse bzw. Threads werden in
Multiprogramming-Systemen nebenläufig ausgeführt. Durch verdrängende
Scheduling-Verfahren kann ein Prozess bzw. Thread jederzeit suspendiert und ein
anderer aktiviert werden. Es obliegt dem Betriebssystem, welcher Befehl von wel-
chem Prozess als nächstes ausgeführt wird, was zu einem gewissen Nichtdetermi-
nismus führt. Der Programmierer einer Anwendung kann dies jedenfalls nicht
beeinflussen.
Nun kommt es aber häufig vor, dass gewisse Codeteile des Betriebssystems oder
auch von Anwendungen nicht unterbrochen bzw. zumindest nicht bei der Abar-
beitung beeinflusst werden sollten, da es sonst evtl. zu Inkonsistenzen kommen
kann. Solche Codebereiche können als atomare Aktionen aufgefasst werden. Ty-
pisch sind diese bei der Bearbeitung gemeinsamer Datenstrukturen oder Dateien
(shared data structures, shared files) und auch bei der gemeinsamen Nutzung von
Hardware-Komponenten (shared hardware) wie Drucker.
Atomare Aktion. Atomare Aktionen sind also Codebereiche, die in einem Stück, also
atomar, ausgeführt werden müssen und (logisch) nicht unterbrochen werden dür-
fen. Die im Rahmen einer atomaren Aktion bearbeiteten Ressourcen (Objekte, Da-
tenbereiche) müssen dem Prozess bzw. Thread, der die atomare Aktion ausführt,
exklusiv zugeordnet sein und dürfen ihm nicht entzogen werden. Eine Unterbre-
chung durch eine Scheduling-Entscheidung des Betriebssystems ist aber jederzeit
möglich. Die Problematik soll anhand von zwei einfachen Beispielen erläutert
werden:
Beispiel 1: In Betriebssystemen werden oftmals verkettete Listen z.B. von PCBs
(Prozessliste eines Schedulers) verwaltet, die von mehreren Prozessen zugreifbar
sind. Hängt ein Prozess nun ein neues Objekt am Anfang der Liste ein und wird
dabei durch einen anderen Prozess, der das gleiche tun möchte, unterbrochen, so
kann es möglicherweise zu einer Inkonsistenz kommen.
Das Einhängen in die Liste besteht aus zwei Operationen, die aufgrund einer
Scheduling-Entscheidung des Betriebssystems jederzeit unterbrechbar sind. Ist A
das neue Objekt, so sind dies die beiden folgenden Operationen, wobei Anker die
Anfangsadresse der Liste ist:
A.next := Anker;
Anker := Adresse(A);
Wird die aus den zwei Operationen bestehende zusammengehörige Aktion nach
der ersten Operation bzw. während einer der beiden Operationen unterbrochen, so
kann ein anderer Prozess, der die gleichen Variablen verwendet, leicht ein Problem
verursachen. Der Grund ist, dass die zusammengehörigen Operationen nicht ato-
mar sind, da hierzu mehrere Maschinenbefehle ausgeführt werden, nach denen
jeweils eine Unterbrechung stattfinden kann. Daher müssen die zwei Operationen
in einer atomaren Aktion (ganz oder gar nicht) ohne Beeinflussung von nebenläu-
figen Prozessen ausgeführt werden (siehe Abbildung 6-1).
Ein Problem ergibt sich z.B. bei folgender Ablaufsequenz, wenn die neuen Elemen-
te A 1 und A2 eingehängt werden sollen, die Operationen aber verzahnt ausgeführt
werden:
A1.next := Anker;
A2.next := Anker;
Anker := Adresse(A1);
Anker := Adresse(A2);
In diesem Fall verliert man das Element A1.
Beispiel 2: Ein weiteres, einfaches aber sehr einleuchtendes Beispiel, wie es zu
einem Problem durch nebenläufige Ausführung eines Programmstücks kommen
kann, ist das Inkrementieren eines einfachen Zählers. Die Erhöhung eines Zählers
in einer nebenläufig bearbeiteten Variablen (also einem Speicherbereich in einem
durch mehrere Prozesse bzw. Threads zugänglichen Adressbereich) kann nämlich
nicht in einem Maschinenzyklus abgearbeitet werden und ist daher unterbrechbar.
In Abbildung 6-2 ist zunächst ein problemloser Ablauf skizziert, in dem zwei Pro-
zesse A und B, jeweils ohne unterbrochen zu werden, einen Zähler erhöhen. Der
Zählerwert ist anfangs 0 und danach ordnungsgemäß 6
Wenn nun, wie in Abbildung 6-3 dargestellt, Prozess A den Zähler (in ein Register)
einliest und danach unterbrochen wird, dann Prozess B ihn ebenfalls liest, im An-
schluss daran (im Register) erhöht und auf den Speicherplatz zurückschreibt (vom
Register in den Hauptspeicher), kann die Änderung von B verloren gehen. Diese
Inkonsistenz wird auch als Lost Update bezeichnet und ist ein Synchronisations-
problem, das nicht nur bei Betriebssystemen, sondern auch im Bereich der Daten-
banken häufig diskutiert wird.
Abbildung 6-2: Normaler Verlauf beim Inkrementieren eines Zählers
Geht man im Beispiel davon aus, dass der Zähler (counter) anfangs auf 0 stand, so
steht er nach Abarbeitung der Befehle durch die Prozesse A und B auf 1, sollte aber
eigentlich auf 6 stehen. Die Erhöhung durch Prozess B um 5 geht verloren.
Das Lesen, Erhöhen und Zurückschreiben des Zählers müsste in einer atomaren
Aktion ausgeführt werden. Das Lost-Update-Problem wird umso akuter, je mehr
Prozesse/Threads um den Zähler konkurrieren.
bbildung 6-3: Lost-Update-Problem beim Inkrementieren eines Zählers
Race Conditions. Die erläuterten Probleme treten auf, weil mehrere Prozesse un-
kontrolliert auf gemeinsam genutzte Ressourcen zugreifen. Man lässt den Prozes-
sen freien Lauf beim Zugriff, und es ist nicht vorhersehbar, wann der Scheduler
einen laufenden Prozess unterbricht und einem anderen die CPU zuteilt. Dies kann
in kritischen Situationen erfolgen, ohne dass man es beeinflussen kann. Diese Situ-
ation bezeichnet man in der Informatik auch als Race Condition oder zeitkritischen
Ablauf.
Race Conditions sind also Situationen, bei denen zwei oder mehr Prozesse gemein-
same Betriebsmittel nutzen und die Endergebnisse der Nutzung von der zeitlichen
Reihenfolge der Operationen abhängen (Ehses 2005). Diese Situationen muss man
in den Griff bekommen, was z.B. durch eine Kontrolle über die Ausführungsrei-
henfolge erfolgen kann.
```
