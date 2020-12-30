from WScraping import *
import argparse
import os

parser = argparse.ArgumentParser(description="Datos de Facebook")
parser.add_argument("-c_user", type=str, help='-c_user "100006715541190"')
parser.add_argument("-xs", type=str, help='-xs "31%APLWaajMP31_RSOG%3LAJqwñQPUjkasl"')
parser.add_argument("-friend_id", type=str, help='-friend_id "100004489111773"')
data = parser.parse_args()


if(data.c_user != None):
	c_user = data.c_user
	if(data.xs != None):
		xs = data.xs
		if(data.friend_id != None):
			friend_id = data.friend_id
			ws = WScraping(c_user, xs, friend_id)

			if not os.path.exists(ws.getFriend_id()):
				os.makedirs(ws.getFriend_id())

			url_photo_tag = "https://mbasic.facebook.com/{}/photoset/pb.{}.-2207520000../?owner_id={}&offset=".format(ws.getFriend_id(),
				ws.getFriend_id(), ws.getFriend_id())
			url_photo_upload = "https://mbasic.facebook.com/{}/photoset/t.{}/?owner_id={}&offset=".format(ws.getFriend_id(),
				ws.getFriend_id(), ws.getFriend_id())
			
			cookies = {
				"c_user":str(ws.getC_user()),
				"xs":str(ws.getXs())
			}
			ws.photosScraping(url_photo_tag, cookies)
			ws.photosScraping(url_photo_upload, cookies)
		else:
			print("[!] Hacen falta parametros.")
	else:
		print("[!] Hacen falta parametros.")
else:
	print("[!] Hacen falta parametros.")
