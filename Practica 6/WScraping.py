import requests
import re

class WScraping:
	def __init__(self, c_user, xs, friend_id):
		self.c_user = ""
		self.xs = ""
		self.friend_id = ""
		self.setC_user(c_user)
		self.setXs(xs)
		self.setFriend_id(friend_id)


	###########################################################
	def setC_user(self, c_user):
		if(len(c_user) == 15):
			print("[*] c_user valido")
			self.c_user = str(c_user)
		elif(len(c_user) < 15):
			print("[!] La longitud de su 'id' es muy corto")
			exit()
		elif(len(c_user) > 15):
			print("[!] La longitud de su 'id' es muy largo")
			exit()

	def getC_user(self):
		return self.c_user

	##########################################################
	def setXs(self, xs):
		if(len(xs) >= 25):
			print("[*] xs valido")
			self.xs = xs
		else:
			print("[!] La longitud de su 'xs' es muy corto")
			exit()

	def getXs(self):
		return self.xs

	##########################################################
	def setFriend_id(self, friend_id):
		if(len(friend_id) == 15):
			print("[*] friend_id valido")
			self.friend_id = str(friend_id)
		elif(len(friend_id) < 15):
			print("[!] La longitud de su 'id' es muy corto")
			exit()
		elif(len(friend_id) > 15):
			print("[!] La longitud de su 'id' es muy largo")
			exit()

	def getFriend_id(self):
		return self.friend_id

	###########################################################
	def photosScraping(self, url, cookies):
		req = requests.Session()
		offset = 0

		while True:
			link = "{}{}".format(url, offset)
			res = req.get(link, cookies=cookies)
			html = res.text
			match = re.findall(r"/photo.php\?fbid=([0-9]*)&amp;", html)
			if match:
				for m in match:
					f = open("{}/{}.jpg".format(self.getFriend_id(), m),"wb")
					res = req.get("https://mbasic.facebook.com/photo/view_full_size/?fbid={}".format(m), cookies=cookies)
					html = res.text
					z = re.search(r"a href=\"(.*?)\"", html)
					if z:
						link = str(z.groups()[0]).replace("&amp;", "&")
						res = req.get(link, cookies=cookies)
						f.write(res.content)
						f.close()
					else:
						break
				offset+=12
				print("::: Descargando imagenes...")
			else:
				break
