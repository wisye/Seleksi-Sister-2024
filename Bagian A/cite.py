import requests # type: ignore
from bs4 import BeautifulSoup
from datetime import datetime

def url_to_simple_ieee_citation(url):
	try:
		response = requests.get(url)
		response.raise_for_status()
		soup = BeautifulSoup(response.text, 'html.parser')
		title = soup.find('title').text.strip()
		citation = f'"{title}," [Online]. Available: [{url}]({url}). [Accessed: {datetime.now().strftime("%Y, %B %d")}]'
		return citation
	except Exception as e:
		return f"Error generating citation for URL {url}: {str(e)}"

def generate_citations_from_file(file_path, output_file_path):
	with open(file_path, 'r') as file, open(output_file_path, 'w') as output_file:
		content = file.read().strip()
		urls = content.split('\n\n')
		for url in urls:
			citation = url_to_simple_ieee_citation(url)
			output_file.write(citation + '\n\n')

generate_citations_from_file('references.txt', 'citations.md')