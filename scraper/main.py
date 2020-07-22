import requests
from bs4 import BeautifulSoup
from datetime import datetime
import json
import re


def get_all_urls(url):
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    # Finds all urls that supply data in the correct format
    urls = [url.a["href"] for url in soup.find("div", {"id": "content"}).ul.find_all("li")
            if "Monmouth County has" in url.a.text][:-2]
    # Deletes urls with improper format (no data)
    del urls[-7]
    del urls[-6]
    # Flips order so it populates DB with earlier data first
    urls = reversed(urls)
    print("URLs acquired")
    # API url
    api_url = "http://localhost:8080/api/v1/data"
    # For each url, scrape the data and send the results to the API
    for page_url in urls:
        data, date = scrape_page(page_url)
        add_data(data, api_url, date)


def get_recent_url(url):
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    # Finds the content div, gets the first li, then retrieves the link from the a tag
    latest_url = soup.find("div", {"id": "content"}).li.a["href"]
    print("URL acquired")
    return latest_url


def scrape_page(url):
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    data = soup.find("div", {"id": "pp_content_area"})
    data_dict = {}
    for li in data.ul.findAll("li"):
        text = li.text.replace("\r\n", "").rstrip()
        if " " not in text.split(":")[1]:
            text = text.replace(":", ": ")
        town, cases = text.split(": ")
        cases = cases.lstrip()
        if " " in cases:
            cases = cases[:cases.index(" ")]
        data_dict[town] = int(cases)
    string_dates = [date.text.rstrip() for date in data.find_all("strong") if ", " in date.text]
    if "DRAFT" in string_dates[0]:
        string_dates[0] = string_dates[0].replace("DRAFT", "").rstrip()
    date = datetime.strptime(string_dates[0], "%B %d, %Y").strftime("%Y/%m/%d")
    return data_dict, date


def add_data(data, url, date):
    with open("town_map.json", "r") as f:
        town_map = json.load(f)
    for key, value in data.items():
        # Another early discrepancy
        if key == "Morganville" or key == "Neptune" or key == "Ocean Grove" or key == "Shrewsbury":
            continue
        # Called Millstone instead of M.T in earlier releases
        if key == "Millstone":
            town_id = town_map["Millstone Township"]
        else:
            town_id = town_map[re.sub('\s+', ' ', key)]
        post_data = {
            "town_id": town_id,
            "cases": value,
            "day_date": date
        }
        requests.post(url, post_data)
        print(f"Added {key} with {value} cases on {date}")


def main():
    home_url = "https://www.visitmonmouth.com/page.aspx?Id=5017"
    get_all_urls(home_url)
    # url = get_recent_url(home_url)
    # data, date = scrape_page(url)
    # api_url = "http://localhost:8080/api/v1/data"
    # add_data(data, api_url, date)


main()
