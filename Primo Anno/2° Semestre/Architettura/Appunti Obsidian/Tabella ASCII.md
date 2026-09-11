# Caratteri di Controllo (0 - 31) + DEL (127)
*Non stampabili. Usati per gestire periferiche e protocolli.*

| Dec | Hex | Binario | Sigla | Nome Completo | Descrizione / Note |
|:---:|:---:|:---:|:---:|:---|:---|
| **0** | 00 | 0000 0000 | **NUL** | Null | Carattere nullo (terminatore stringhe C) |
| **1** | 01 | 0000 0001 | **SOH** | Start of Heading | Inizio intestazione |
| **2** | 02 | 0000 0010 | **STX** | Start of Text | Inizio testo |
| **3** | 03 | 0000 0011 | **ETX** | End of Text | Fine testo |
| **4** | 04 | 0000 0100 | **EOT** | End of Transmission | Fine trasmissione |
| **5** | 05 | 0000 0101 | **ENQ** | Enquiry | Richiesta |
| **6** | 06 | 0000 0110 | **ACK** | Acknowledge | Conferma positiva |
| **7** | 07 | 0000 0111 | **BEL** | Bell | Cicalino / Suono di sistema |
| **8** | 08 | 0000 1000 | **BS** | Backspace | Cancella indietro |
| **9** | 09 | 0000 1001 | **TAB** | Horizontal Tab | Tabulazione orizzontale |
| **10** | 0A | 0000 1010 | **LF** | Line Feed | **A Capo** (nuova riga - Linux/macOS) |
| **11** | 0B | 0000 1011 | **VT** | Vertical Tab | Tabulazione verticale |
| **12** | 0C | 0000 1100 | **FF** | Form Feed | Avanzamento modulo (nuova pagina) |
| **13** | 0D | 0000 1101 | **CR** | Carriage Return | **Ritorno Carrello** (Windows usa CR+LF) |
| **14** | 0E | 0000 1110 | **SO** | Shift Out | Spostamento fuori |
| **15** | 0F | 0000 1111 | **SI** | Shift In | Spostamento dentro |
| **16** | 10 | 0001 0000 | **DLE** | Data Link Escape | Escape collegamento dati |
| **17** | 11 | 0001 0001 | **DC1** | Device Control 1 | Controllo dispositivo 1 (spesso XON) |
| **18** | 12 | 0001 0010 | **DC2** | Device Control 2 | Controllo dispositivo 2 |
| **19** | 13 | 0001 0011 | **DC3** | Device Control 3 | Controllo dispositivo 3 (spesso XOFF) |
| **20** | 14 | 0001 0100 | **DC4** | Device Control 4 | Controllo dispositivo 4 |
| **21** | 15 | 0001 0101 | **NAK** | Negative Acknowledge | Conferma negativa |
| **22** | 16 | 0001 0110 | **SYN** | Synchronous Idle | Attesa sincrona |
| **23** | 17 | 0001 0111 | **ETB** | End of Trans. Block | Fine blocco trasmissione |
| **24** | 18 | 0001 1000 | **CAN** | Cancel | Annulla |
| **25** | 19 | 0001 1001 | **EM** | End of Medium | Fine supporto |
| **26** | 1A | 0001 1010 | **SUB** | Substitute | Sostituto |
| **27** | 1B | 0001 1011 | **ESC** | Escape | Tasto Esc |
| **28** | 1C | 0001 1100 | **FS** | File Separator | Separatore file |
| **29** | 1D | 0001 1101 | **GS** | Group Separator | Separatore gruppo |
| **30** | 1E | 0001 1110 | **RS** | Record Separator | Separatore record |
| **31** | 1F | 0001 1111 | **US** | Unit Separator | Separatore unità |
| **127**| 7F | 0111 1111 | **DEL** | Delete | Cancella |

---

# Simboli, Punteggiatura e Numeri (32 - 64)
*Include lo Spazio, simboli matematici e le cifre decimali.*

| Dec | Hex | Binario | Char | Descrizione |
|:---:|:---:|:---:|:---:|:---|
| **32** | 20 | 0010 0000 | **SPC** | Spazio |
| **33** | 21 | 0010 0001 | **!** | Punto esclamativo |
| **34** | 22 | 0010 0010 | **"** | Virgolette doppie |
| **35** | 23 | 0010 0011 | **#** | Cancelletto (Hash) |
| **36** | 24 | 0010 0100 | **$** | Dollaro |
| **37** | 25 | 0010 0101 | **%** | Percentuale |
| **38** | 26 | 0010 0110 | **&** | E commerciale (Ampersand) |
| **39** | 27 | 0010 0111 | **'** | Apice singolo |
| **40** | 28 | 0010 1000 | **(** | Parentesi tonda aperta |
| **41** | 29 | 0010 1001 | **)** | Parentesi tonda chiusa |
| **42** | 2A | 0010 1010 | ***** | Asterisco |
| **43** | 2B | 0010 1011 | **+** | Più |
| **44** | 2C | 0010 1100 | **,** | Virgola |
| **45** | 2D | 0010 1101 | **-** | Meno / Trattino |
| **46** | 2E | 0010 1110 | **.** | Punto |
| **47** | 2F | 0010 1111 | **/** | Slash (Barra) |
| **48** | 30 | 0011 0000 | **0** | Cifra Zero |
| **49** | 31 | 0011 0001 | **1** | Cifra Uno |
| **50** | 32 | 0011 0010 | **2** | Cifra Due |
| **51** | 33 | 0011 0011 | **3** | Cifra Tre |
| **52** | 34 | 0011 0100 | **4** | Cifra Quattro |
| **53** | 35 | 0011 0101 | **5** | Cifra Cinque |
| **54** | 36 | 0011 0110 | **6** | Cifra Sei |
| **55** | 37 | 0011 0111 | **7** | Cifra Sette |
| **56** | 38 | 0011 1000 | **8** | Cifra Otto |
| **57** | 39 | 0011 1001 | **9** | Cifra Nove |
| **58** | 3A | 0011 1010 | **:** | Due punti |
| **59** | 3B | 0011 1011 | **;** | Punto e virgola |
| **60** | 3C | 0011 1100 | **<** | Minore di |
| **61** | 3D | 0011 1101 | **=** | Uguale |
| **62** | 3E | 0011 1110 | **>** | Maggiore di |
| **63** | 3F | 0011 1111 | **?** | Punto interrogativo |
| **64** | 40 | 0100 0000 | **@** | Chiocciola (At) |

---

# Maiuscole e Simboli Vari (65 - 96)

| Dec | Hex | Binario | Char |
|:---:|:---:|:---:|:---:|
| **65** | 41 | 0100 0001 | **A** |
| **66** | 42 | 0100 0010 | **B** |
| **67** | 43 | 0100 0011 | **C** |
| **68** | 44 | 0100 0100 | **D** |
| **69** | 45 | 0100 0101 | **E** |
| **70** | 46 | 0100 0110 | **F** |
| **71** | 47 | 0100 0111 | **G** |
| **72** | 48 | 0100 1000 | **H** |
| **73** | 49 | 0100 1001 | **I** |
| **74** | 4A | 0100 1010 | **J** |
| **75** | 4B | 0100 1011 | **K** |
| **76** | 4C | 0100 1100 | **L** |
| **77** | 4D | 0100 1101 | **M** |
| **78** | 4E | 0100 1110 | **N** |
| **79** | 4F | 0100 1111 | **O** |
| **80** | 50 | 0101 0000 | **P** |
| **81** | 51 | 0101 0001 | **Q** |
| **82** | 52 | 0101 0010 | **R** |
| **83** | 53 | 0101 0011 | **S** |
| **84** | 54 | 0101 0100 | **T** |
| **85** | 55 | 0101 0101 | **U** |
| **86** | 56 | 0101 0110 | **V** |
| **87** | 57 | 0101 0111 | **W** |
| **88** | 58 | 0101 1000 | **X** |
| **89** | 59 | 0101 1001 | **Y** |
| **90** | 5A | 0101 1010 | **Z** |
| **91** | 5B | 0101 1011 | **[** |
| **92** | 5C | 0101 1100 | **\** |
| **93** | 5D | 0101 1101 | **]** |
| **94** | 5E | 0101 1110 | **^** |
| **95** | 5F | 0101 1111 | **_** |
| **96** | 60 | 0110 0000 | **`** |

---

# Minuscole e Simboli Finali (97 - 126)

|   Dec   | Hex |  Binario  |  Char  |
| :-----: | :-: | :-------: | :----: |
| **97**  | 61  | 0110 0001 | **a**  |
| **98**  | 62  | 0110 0010 | **b**  |
| **99**  | 63  | 0110 0011 | **c**  |
| **100** | 64  | 0110 0100 | **d**  |
| **101** | 65  | 0110 0101 | **e**  |
| **102** | 66  | 0110 0110 | **f**  |
| **103** | 67  | 0110 0111 | **g**  |
| **104** | 68  | 0110 1000 | **h**  |
| **105** | 69  | 0110 1001 | **i**  |
| **106** | 6A  | 0110 1010 | **j**  |
| **107** | 6B  | 0110 1011 | **k**  |
| **108** | 6C  | 0110 1100 | **l**  |
| **109** | 6D  | 0110 1101 | **m**  |
| **110** | 6E  | 0110 1110 | **n**  |
| **111** | 6F  | 0110 1111 | **o**  |
| **112** | 70  | 0111 0000 | **p**  |
| **113** | 71  | 0111 0001 | **q**  |
| **114** | 72  | 0111 0010 | **r**  |
| **115** | 73  | 0111 0011 | **s**  |
| **116** | 74  | 0111 0100 | **t**  |
| **117** | 75  | 0111 0101 | **u**  |
| **118** | 76  | 0111 0110 | **v**  |
| **119** | 77  | 0111 0111 | **w**  |
| **120** | 78  | 0111 1000 | **x**  |
| **121** | 79  | 0111 1001 | **y**  |
| **122** | 7A  | 0111 1010 | **z**  |
| **123** | 7B  | 0111 1011 | **{**  |
| **124** | 7C  | 0111 1100 | **\|** |
| **125** | 7D  | 0111 1101 | **}**  |
| **126** | 7E  | 0111 1110 | **~**  |