import requests # type: ignore
import pyotp # type: ignore
import base64
import json

userid = '18222095'
shared_secret = 'seleksister2418222095Furina'

encoded_secret = base64.b32encode(shared_secret.encode()).decode()

totp = pyotp.TOTP(encoded_secret, interval=30, digits=8, digest=pyotp.hashlib.sha256)
password = totp.now()

print(password)

credentials = f"{userid}:{password}"
encoded_credentials = base64.b64encode(credentials.encode()).decode()

url = 'http://sister21.tech:7787/recruitment/submit/a'
header = {
	'Content-Type': 'application/json',
	'Authorization': f'Basic {encoded_credentials}'
}

payload = {
	"fullname" : "Wisyendra Lunarmalam",
	"link" : "https://github.com/wisye/Seleksi-Sister-2024/blob/main/Bagian%20A/18222095_1e802.pdf",
	"message" : "MILF (Man I Love Furina), ku ngerjain bareng edbert buat sisparter"
}

response = requests.post(url, headers=header, data=json.dumps(payload))

print(f"Status Code: {response.status_code}")
print("Response Body:")
print(response.text)

print()
print(response)