import mysql.connector

# Pobierz wszystkie paragony
def pobierzParagony():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="paragony"
    )
    mycursor = mydb.cursor()
    mycursor.execute("""SELECT 
    p.id, 
    p.data_dodania,
    f.nazwa_firmy,
    p.ulica, 
    p.miasto,
    p.suma,
    p.rabat,
    p.id_firmy  
FROM Paragony p
JOIN Firmy f ON p.id_firmy = f.id
""") 
    paragony = mycursor.fetchall()
    mydb.close()
    return paragony

#print(pobierzParagony())
#Wyświetl wszystkie paragony i dane o firmie,ulicy,sumie.
def showParagony():
    paragony = pobierzParagony()
    for paragon in paragony:
        print(f"ID: {paragon[0]} - Data dodania: {paragon[1]} - Firma: {paragon[2]} - Ulica: {paragon[3]} - Miasto: {paragon[4]} - Suma: {paragon[5]} - Rabat: {paragon[6]}")
       # print("*"*20)

#Pobierz produkty z paragonu
def pobierzProdukty(id_paragonu):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="paragony"
    )
    mycursor = mydb.cursor()
    #mycursor.execute("SELECT * FROM produkty WHERE id_paragonu = %s", (id_paragonu,))
    mycursor.execute("""SELECT produkty.*, kategorie.nazwa_kategorii AS nazwa_kategorii
FROM produkty
JOIN kategorie ON produkty.id_kategorii = kategorie.id_kategorii
WHERE produkty.id_paragonu = %s""", (id_paragonu,))
    return mycursor.fetchall()

#Wyświetl produkty z paragonu
def showProdukty(id_paragonu):
    produkty = pobierzProdukty(id_paragonu)
    for produkt in produkty:
        print(f"Nazwa produktu: {produkt[2]} - Kategoria: {produkt[8]} - Ilość: {produkt[4]}/{produkt[5]} - Cena: {produkt[3]} - Podatek: {produkt[6]}")

# pokaz wszystkie paragony18
showParagony()
# wybierz paragon
wejscie = int(input("Podaj id paragonu: "))
showProdukty(wejscie)

#Stwórz plik json z wszystkimi danymi
import json
from datetime import datetime
from decimal import Decimal  # Assuming you're using the Decimal class

def saveToJson():
    paragony = pobierzParagony()
    paragony_dict = []
    
    for paragon in paragony:
        if wejscie == paragon[0]:
            paragon_dict = {
                "id": paragon[0],
                "data_dodania": paragon[1].isoformat(),  # Convert datetime to ISO format string
                "firma": paragon[2],
                "ulica": paragon[3],
                "miasto": paragon[4],
                "suma": float(paragon[5]),  # Convert Decimal to float
                "rabat": float(paragon[6]),  # Convert Decimal to float
                "id_firmy": paragon[7]
            }
            #Dodaj produkty
            produkty = pobierzProdukty(paragon[0])
            produkty_dict = []
            for produkt in produkty:
                produkt_dict = {
                    "id": produkt[0],
                    "id_paragonu": produkt[1],
                    "nazwa_produktu": produkt[2],
                    "cena": float(produkt[3]),
                    "ilosc": produkt[4],
                    "jednostka": produkt[5],
                    "podatek": produkt[6],
                    "id_kategorii": produkt[7],
                    "nazwa_kategorii": produkt[8]
                }
                produkty_dict.append(produkt_dict)
            paragon_dict["produkty"] = produkty_dict
            paragony_dict.append(paragon_dict)
        with open("paragony.json", "w") as file:
            json.dump(paragony_dict, file, indent=4)

import io
from PIL import Image, ImageDraw, ImageFont

# Funkcja do generowania obrazu paragonu
def generate_receipt_image(receipt_data):
    """Generuje obraz paragonu na podstawie danych z paragonu."""

    # Ustawienia obrazu
    width = 400
    height = 600
    font_size = 14
    margin = 10
    line_height = font_size + 5

    # Utworzenie pustego obrazu
    image = Image.new("RGB", (width, height), (255, 255, 255))
    draw = ImageDraw.Draw(image)

    # Załadowanie czcionki
    font = ImageFont.truetype("arial.ttf", font_size)

    # Dodanie danych firmy
    draw.text((margin, margin), f"{receipt_data['firma']}", font=font, fill=(0, 0, 0))
    draw.text((margin, margin + line_height), f"{receipt_data['ulica']}", font=font, fill=(0, 0, 0))
    draw.text((margin, margin + 2 * line_height), f"{receipt_data['miasto']}", font=font, fill=(0, 0, 0))

    # Dodanie daty
    draw.text((margin, margin + 4 * line_height), f"Data dodania: {receipt_data['data_dodania']}", font=font, fill=(0, 0, 0))

    # Dodanie produktów # cena z lewej strony
    y = margin + 6 * line_height
    for product in receipt_data['produkty']:
        draw.text((margin, y), f"{product['nazwa_produktu']} x {product['ilosc']}\{product['jednostka']}  {product['cena']:.2f}", font=font, fill=(0, 0, 0))
        y += line_height

    # Dodanie sumy
    draw.text((margin, y + line_height), f"Suma: {receipt_data['suma']:.2f}", font=font, fill=(0, 0, 0))
    draw.text((margin, y + 2 * line_height), f"Rabat: {receipt_data['rabat']:.2f}", font=font, fill=(0, 0, 0))

    # Zwrócenie obrazu
    return image

# Przykład użycia funkcji 
saveToJson()
# Data z pliku json paragony.json
# Załaduj z pliku json
receipt_data = []
with open("paragony.json", "r") as file:
    receipt_data = json.load(file)
    for paragon in receipt_data:
        if wejscie == paragon["id"]:
            receipt_data = paragon
            break

# Generowanie obrazu paragonu
receipt_image = generate_receipt_image(receipt_data)

# Zapisywanie obrazu
receipt_image.save(f"paragon_{wejscie}.png")
