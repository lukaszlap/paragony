from paddleocr import PaddleOCR, draw_ocr
from ast import literal_eval
import json
import PIL.Image
import google.generativeai as genai
import json
import mysql.connector
import easyocr
from wersja import krojenie

genai.configure(api_key="-")

lokalizacja = '../12.png'

def przetworz_obraz(paddleocr, lokalizacja):
    receipt_texts, receipt_boxes = krojenie.paddle_scan(paddleocr, lokalizacja)
    #image_with_boxes = krojenie.draw_boxes_on_image(lokalizacja, receipt_boxes)
    #image_with_text = krojenie.overlay_text_on_image(image_with_boxes, receipt_texts, receipt_boxes)
    #krojenie.show(image_with_text)
    krojenie.export_to_white_background(receipt_texts, receipt_boxes, 'exported_white_background.png')
    #krojenie.show(image_with_boxes)
    #left, top, right, bottom = krojenie.find_edges(receipt_boxes)
    #cropped_image = krojenie.crop_to_document(lokalizacja, left, top, right, bottom)
    #krojenie.show1(cropped_image)
    #return "cropped_image.png"
    return "exported_white_background.png"


# daj ocr ale z easyocr


def ocr_lib_easyocr(filename):
  # Utwórz obiekt Reader z parametrem gpu
  reader = easyocr.Reader(['pl','en'], gpu=True)
  # Wczytaj zdjęcie z pliku
  image = filename
  result = reader.readtext(image, detail=0)
  # Wyświetl wynik rozpoznawania ale jako zwykły tekst
  wynik = ' '.join(result)
  return wynik

paddleocr = PaddleOCR(lang="pl",ocr_version="PP-OCRv4",show_log = False, use_gpu=True)


lokalizacja = str(przetworz_obraz(paddleocr, lokalizacja))


def paddle_scan(paddleocr,img_path_or_nparray):
    result = paddleocr.ocr(img_path_or_nparray,cls=True)
    result = result[0]
    boxes = [line[0] for line in result]       #boundign box 
    txts = [line[1][0] for line in result]     #raw text
    scores = [line[1][1] for line in result]   # scores
    return  txts, result

# perform ocr scan
receipt_image_array = lokalizacja
receipt_texts, receipt_boxes = paddle_scan(paddleocr,receipt_image_array)
print(50*"--","\ntext only:\n",receipt_texts)
#print(50*"--","\nocr boxes:\n",receipt_boxes)


#receipt_texts = ocr_lib_easyocr(lokalizacja)


def geminiAsk(pytanie):
  safety_settings = [
    {
      "category": "HARM_CATEGORY_HARASSMENT",
      "threshold": "BLOCK_NONE",
    },
    {
      "category": "HARM_CATEGORY_HATE_SPEECH",
      "threshold": "BLOCK_NONE",
    },
    {
      "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
      "threshold": "BLOCK_NONE",
    },
    {
      "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
      "threshold": "BLOCK_NONE",
    },
  ]

  generation_config = {
    "temperature": 1,
    "top_p": 0.95,
    "top_k": 64,
    "max_output_tokens": 100
  }

  model = genai.GenerativeModel(
    model_name="gemini-1.5-flash-latest",
    safety_settings=safety_settings,
    generation_config=generation_config,
  )

  response = model.generate_content([pytanie,], stream=False)

  return str(response.text)

safety_settings = [
  {
    "category": "HARM_CATEGORY_HARASSMENT",
    "threshold": "BLOCK_NONE",
  },
  {
    "category": "HARM_CATEGORY_HATE_SPEECH",
    "threshold": "BLOCK_NONE",
  },
  {
    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    "threshold": "BLOCK_NONE",
  },
  {
    "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
    "threshold": "BLOCK_NONE",
  },
]


generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 64,
  "max_output_tokens": 8192
}


img = PIL.Image.open(lokalizacja)
#binaryzacja
img = img.convert('L')
#model = genai.GenerativeModel('gemini-pro-vision')
#model = genai.GenerativeModel('gemini-1.5-flash-latest')

model = genai.GenerativeModel(
  model_name="gemini-1.5-flash-latest",
  safety_settings=safety_settings,
  generation_config=generation_config,
)

response = model.generate_content(["""You are POS receipt data expert, parse, detect, recognize and convert following receipt OCR image result into structure receipt data object. 
Don't make up value not in the Input. Output must be a well-formed JSON object. Give me results of the receipt in json format in the syntax, if something is missing, enter null. Be careful some prices of products would be below the name of the product.:
nazwafirmy name of the company. String format.
ulica street. String format.
miasto city. String format.
kodpocztowy postal code. String format.
nazwa name. String format.
ilość means how many products are there, value mostly occurs alone or in front of x and price, with the unit. If you dont have unit its alone! Example 2x8,69 its 2 products. Float format.
jednostka unit locatet next to ilość. String format.
cena price for all products, mostly the result of a mathematical operation. By the end of price is Podatek type A, B, C, D. Float format.
Podatek A and Ptu A its not the same. Podatek its a full sum o the bought products. Ptu its a sum of the tax. A tax often takes on a name like SPRZEDAZ OPODATKOWANA. Float format.
Rabat or OPUST its the same as discount. Its not a products, dont add it to a products list!!! If you see prices with the minus its a discount. Float format.
Mathematical sum up all Rabat or OPUST (ALL DISCOUNTS) price and add to RABAT in json. Float format.
Remember format of the json. If you dont have some data enter null.
Read prices very exactly its very important.
{
  "adres": {
    "nazwafirmy": "Sklep Spożywczy 'Zdrowa Żywność'",
    "ulica": "ul. Zielona 5",
    "miasto": "Warszawa",
    "kodpocztowy": "00-001"
  },
  "produkty": [
    {
      "nazwa": "Chleb",
      "ilość": 1,
      "jednostka": szt,
      "cena": 3.50
      "podatek": "A"
    },
    {
      "nazwa": "Pomidory",
      "ilość": 0.3,
      "jednostka": kg,
      "cena": 2.80,
      "podatek": "D"
    }
  ],
  "podatki": {
    "podatekA": 3.32,
    "podatekB": 9.30,
    "podatekC": 2.14,
    "podatekD": 2.14,
    "PTU A": 2.14,
    "PTU B": 11.44,
    "PTU C": 11.44,
    "PTU D": 11.44,
    "RABAT": -7.32
  },
  "suma": {
    "TOTAL": 11.44
  }
}```json

### Input:
text only:
{receipt_texts}""", img], stream=False)

print(response.text)


wynik = str(response.text)

# Dzielimy tekst na linie
linie = wynik.splitlines()
# Usuwamy pierwszą i ostatnią linię
usuniete_linie = linie[1:-1]
# Łączymy pozostałe linie z powrotem w jeden ciąg tekstowy
wynik = "\n".join(usuniete_linie)

data = json.loads(wynik)

nazwa_firmy = data['adres']['nazwafirmy']
ulica_firmy = data['adres']['ulica']
miasto_firmy = data['adres']['miasto']
suma_total = data['suma']['TOTAL']
podatekA = data['podatki']['podatekA']
podatekB = data['podatki']['podatekB']
podatekC = data['podatki']['podatekC']
podatekD = data['podatki']['podatekD']
PTU_A = data['podatki']['PTU A']
PTU_B = data['podatki']['PTU B']
PTU_C = data['podatki']['PTU C']
PTU_D = data['podatki']['PTU D']
rabat = data['podatki']['RABAT']
rabat = 0 if rabat is None else float(rabat)

# Pobranie wszystkich cen for each bez funckji
def wszystkieProdukty():
    for produkt in data['produkty']:
        print(f"Nazwa produktu: {produkt['nazwa']} - Ilość: {produkt['ilość']}/{produkt['jednostka']} - Cena: {produkt['cena']} - Podatek: {produkt['podatek']}")
    
def suma(rabat):
    suma = 0
    for produkt in data['produkty']:
        suma += float(produkt['cena'])
    return suma-rabat

print(f"Adres firmy: {nazwa_firmy} - {ulica_firmy} - {miasto_firmy} ")
print("*"*20)
wszystkieProdukty()
print("*"*20)
print(f"Podatek A: {podatekA}")
print(f"Podatek B: {podatekB}")
print(f"Podatek C: {podatekC}")
print(f"Podatek D: {podatekD}")
print(f"PTU A: {PTU_A}")
print(f"PTU B: {PTU_B}")
print(f"PTU C: {PTU_C}")
print(f"PTU D: {PTU_D}")
print(f"Rabat: {rabat}")
print("*"*20)
print(f"Suma z operacji matematycznej: {suma(rabat)}")
print(f"Suma total: {suma_total}")

# Utwórz funkcje która pobierze wszystkie nazwy kategori produktów z bazy danych SELECT `nazwa_kategorii` FROM `kategorie` i zwróci je po przecinku
def pobierzKategorie():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="paragony"
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT `nazwa_kategorii` FROM `kategorie`")
    kategorie = mycursor.fetchall()
    mydb.close()
    kategorie = [kategoria[0] for kategoria in kategorie]
    return ", ".join(kategorie)


def dodajProdukty(produkty, id_paragonu):
    mydb = mysql.connector.connect(
        host="localhost", 
        user="root",
        password="",
        database="paragony"
    )
    mycursor = mydb.cursor()
    kategorie = pobierzKategorie()
    for produkt in produkty:
        #klasyfikacja = str(geminiAsk(f"Skategoryzuj produkt z paragonu {produkt['nazwa']} do jednej z mojej listy [kategorii: jedzenie, napoje, chemia, ubrania, elektronika, kosmetyki, usługi, zakupy_online]. Daj tylko nazwe tej kategorii w tym formacie: {{\"kategoria\": \"jedzenie\"}}"))
        klasyfikacja = str(geminiAsk(f"Skategoryzuj produkt z paragonu {produkt['nazwa']} do jednej z mojej listy [kategorii: {kategorie}]. Daj tylko nazwe tej kategorii w tym formacie: {{\"kategoria\": \"jedzenie\"}} Zawsze stosuj ten format. Jezeli nie jesteś w stanie skategoryzować produktu, wpisz inne."))
        print(klasyfikacja)
        #zawartość kategoria
        kategoria = json.loads(klasyfikacja)['kategoria']
        #Pobierz z bazy danych id kategorii o nazwie w klasyfikacja sql
        mycursor.execute("SELECT id_kategorii FROM Kategorie WHERE nazwa_kategorii = %s", (kategoria,))
        #Daj id kategorii do zmiennej
        id_kategorii = mycursor.fetchone()[0]
        sql = "INSERT INTO `produkty` (`id`, `id_paragonu`, `nazwa_produktu`, `cena`, `ilosc`, `jednostka`, `typ_podatku`, `id_kategorii`) VALUES (NULL, %s, %s, %s, %s, %s, %s, %s)"
        val = (id_paragonu, produkt['nazwa'], produkt['cena'], produkt['ilość'], produkt['jednostka'], produkt['podatek'], id_kategorii)
        mycursor.execute(sql, val)
    mydb.commit()
    #print(mycursor.rowcount, "record inserted.")
    mydb.close()
    return f"Udalo sie :) id to: {id_paragonu}"

#Daj funkcje która utworzy paragon w mysql
#Tworzenie paragonu:
#INSERT INTO `paragony` (`id`, `id_uzytkownika`, `id_firmy`, `ulica`, `miasto`, `suma`, `rabat`, `data_dodania`) VALUES (NULL, '1', '2', 'cos', 'cos', '11', '2', current_timestamp());
def dodajParagon(id_uzytkownika, id_firmy, ulica, miasto, suma, rabat, produkty):
    mydb = mysql.connector.connect(
        host="localhost", 
        user="root",
        password="",
        database="paragony"
    )
    mycursor = mydb.cursor()
    sql = "INSERT INTO `paragony` (`id`, `id_uzytkownika`, `id_firmy`, `ulica`, `miasto`, `suma`, `rabat`, `data_dodania`) VALUES (NULL, %s, %s, %s, %s, %s, %s, current_timestamp())"
    val = (id_uzytkownika, id_firmy, ulica, miasto, suma, rabat)
    mycursor.execute(sql, val)
    mydb.commit()
    #print(mycursor.rowcount, "record inserted.")
    id_paragonu = mycursor.lastrowid  # Pobieramy ID paragonu
    #print(mycursor.rowcount, "record get.")
    mydb.close()
    return dodajProdukty(produkty, id_paragonu)
  
wynik = dodajParagon(1, 2, ulica_firmy, miasto_firmy, suma_total, rabat, data['produkty'])
print(wynik)
  


