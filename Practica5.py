from WScraping import *
import argparse
import time

# Miguel Angel Guerra Rangel

ws = WScraping()

try:

	parser = argparse.ArgumentParser(description="Datos requeridos: c_user, xs, friend_id")
	parser.add_argument("-c_user", type=int, help="Ejemplo: 100006715541190")
	parser.add_argument("-xs", type=str, help="Ejemplo: 31%APLWaajMP31_RSOG%3LAJqwñQPUjkasl")
	parser.add_argument("-friend_id", type=int, help="Ejemplo: 100004489111773")
	dataParams = parser.parse_args()

	ws.setC_user(str(dataParams.c_user))
	ws.setXS(str(dataParams.xs))
	ws.setfriend_id(str(dataParams.friend_id))

except:
		print("[!] Hacen falta parametros")
		print("[!] Cerrando programa...")
		time.sleep(2)
		exit()

url_photo_tag = "https://mbasic.facebook.com/{}/photoset/pb.{}.-2207520000../?owner_id={}&offset=".format(ws.getfriend_id(), ws.getfriend_id(), ws.getfriend_id())
url_photo_upload = "https://mbasic.facebook.com/{}/photoset/pb.{}/?owner_id={}&offset=".format(ws.getfriend_id(), ws.getfriend_id(), ws.getfriend_id())

ws.Pictures(url_photo_tag)
ws.Pictures(url_photo_upload)

print(ws.Data())
