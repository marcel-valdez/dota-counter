Dota Counter
============

#### Figure out the best counter heros for a dota match.

The proyect is simple. It scrapes dotabuff.com to get hero
match data. It includes a pre-built map of hero match data
but it can be re-fetched from dotabuff.com.

### How to use

```
$ cd lib
$ ruby counter.rb
```

Then just follow the instructions.

### How to re-fetch data from dotabuff.com

```
$ cd lib
$ ruby counter.rb --reset
```

### Sample program output

```
$ cd lib
$ ruby counter.rb
Loading hero matchup information from local data file
Introduce the hero names you want to counter separated by a space
```

```
sven ursa
Slardar score: -0.49
Omniknight score: -0.58
Crystal Maiden score: -0.5800000000000001
Wraith King score: -0.67
Tiny score: -0.83
Windranger score: -0.92
Ogre Magi score: -1.1
Witch Doctor score: -1.17
Lina score: -1.21
Viper score: -1.33
Dragon Knight score: -1.64
Mirana score: -1.6400000000000001
Medusa score: -1.7700000000000002
Riki score: -1.85
Phantom Assassin score: -2.1399999999999997
Death Prophet score: -2.43
Phantom Lancer score: -2.51
Razor score: -2.71
Silencer score: -2.7199999999999998
Zeus score: -3.38
```

### HAPPY COUNTERING

