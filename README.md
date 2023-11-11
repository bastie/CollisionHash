[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbastie%2FCollisionHash%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bastie/CollisionHash) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbastie%2FCollisionHash%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bastie/CollisionHash)

# CollisionHash
 
<span title="standalone implementation of collisions hash algorithm">
Eine eigenständige Implementierung des CollisionHash Algorithmus ohne externe Abhängigkeiten.
</span>

## Motivation

Im Rahmen der Implementierung von *Angriffen* auf einen **modifizierten Blockchain Algorithmus**  bedurfte es eines **speziellen Hashalgorithmus**, welcher lediglich *perfekt*, also kollisionsfrei ist. Obwohl die Geschwindigkeit nicht im Fokus steht, müssen der Algorithmus und damit die Kollisionen mit handelsüblicher Hardware *in akzeptabler Zeit berechenbar* sein. Somit bedurfte es eines kurzen Hash für eine Basis mit wenigen Bits. 

Zudem ist für den Angriffsvektor gegeben, dass die Mutation der Eingabedaten nur in begrenztem, klar definieren Umfang erfolgt. Dies zusammen damit, dass ergänzend der Hash für den Angriff teilweise berechenbar sein soll, ist die Ausgangslage.

## Referenzimplementation

Diese Implementation stellt das CollisionHash Verfahren als Referenzimplementierung<sup>1</sup> unter Nutzung des PearsonHash (*zugrundeliegender Algorithmus*)dar. Alternativ kann ein anderer perfekter 8-Bit Hashalgorithmus verwendet werden. 

Dargestellt wird dabei eine mögliche Mutation von zwei Byte (UInt8, UInt8) und die Implementierung des hier *perfekten* CollisionHash Algorithmus mit einer Länge von zwei Byte (UInt8, UInt8).

## Realisierung

Der Hash besteht aus zwei Teilen. Der erste Teil ist der Hash des zugrundeliegenden Algorithmus als ein Byte (UInt8). Der zweite Teil besteht aus der Berechnung aller **Hashkollisionen in geordneter Reihenfolge**, so dass diese Reihenfolge Grundlage die Position als zweiten Hashteil ist.

Da es sich um einen perfekten Hash für die definierte Ausgangslage handelt, ist der zweite Hashteil immer im Wertebereich eines Byte (UInt8).

Die Umsetzung des Hashalgorithmus erfolgt in Swift, jedoch lediglich weil ich derzeit Swift im Bereich der Desktop Implementierungen bevorzuge.

### Nutzung

    git clone https://github.com/bastie/CollisionHash.git .
    cd CollisionHash
    swift build
    swift test
    swift run -c release


## Quelle

Der Quelltext ist unter https://github.com/bastie/CollisionHash zu finden.

## Lizenz

MIT License

Copyright (c) 2023 Sebastian Ritter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


-----

<sup>1</sup> Selbst diese Implementation hat noch für die Zielaufgabe erheblichen Zeitbedarf, so dass ich dort auf eine Implementierung auf Basis von Nibbles (UInt4) umsteige. Für die Referenzimplementierung erfüllt jedoch diese Variante auf Basis von Byte (UInt8) seinen Zweck.
