import requests
from bs4 import BeautifulSoup
import re


def scrape_page(url):
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    data = soup.find("table", {"class": "wikitable sortable"})
    data_dict = {}
    # I realize I could have automatically gathered the columns, but I wanted some slight adjustments
    cols = ["mun", "map_index", "mun_type", "pop", "housing_units", "total_area", "water_area", "land_area", "pop_density", "housing_density"]
    index = 0
    for items in data.find_all("tr")[1:-1:1]:
        data = items.find_all("td")
        town = data[0].text
        print(town)
        if "Township" in town:
            if town != "FreeholdTownship" and town != "MillstoneTownship" and town != "NeptuneTownship" and town != "ShrewsburyTownship":
                town = town[:town.index("Township")]
        town = re.sub(r"(\w)([A-Z])", r"\1 \2", town).rstrip()
        data_dict[index] = {
            "mun": town,
            "map_index": int(data[1].text),
            "mun_type": data[2].text,
            "pop": int(data[3].text.replace(",", "")),
            "housing_units": int(data[4].text.replace(",", "")),
            "total_area": float(data[5].text),
            "water_area": float(data[6].text),
            "land_area": float(data[7].text),
            "pop_density": float(data[8].text.replace(",", "")),
            "housing_density": float(data[9].text.replace(",", ""))
        }
        index += 1
    return data_dict


def print_data(dict):
    # Prints data for SQL file
    for key, value in dict.items():
        print(f"(DEFAULT, '{value['mun']}', {value['map_index']}, '{value['mun_type']}', {value['pop']}, {value['housing_units']}, "
              f"{value['total_area']}, {value['water_area']}, {value['land_area']},"
              f" {value['pop_density']}, {value['housing_density']}),")


def main():
    url = "https://en.wikipedia.org/wiki/Monmouth_County,_New_Jersey"
    data = scrape_page(url)
    print_data(data)


main()
