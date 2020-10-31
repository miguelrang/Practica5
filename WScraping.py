from bs4 import BeautifulSoup as bs
import requests
import json
import re
import os

# Miguel Angel Guerra Rangel

class WScraping():
    def __init__(self):
        self.c_user = ""
        self.xs = ""
        self.friend_id = ""

    # D A T O S
    def setC_user(self, c_user):
        if(len((c_user)) == 15):
            self.c_user = str(c_user)
        else:
            print("[!] La longitud de su 'id' es muy corta")
            print("o muy corta")
            print("[!] Cerrando programa...")
            exit()
            
    def getC_user(self):
        return self.c_user
    
    
    def setXS(self, xs):
        if(len(xs)) > 10:
            self.xs = str(xs)
        else:
            print("[!] La longitud del 'xs' es muy corta")
            print("[!] Cerrando programa...")
            exit()
    
    def getXS(self):
        return self.xs
    
    
    def setfriend_id(self, friend_id):
        if(len((friend_id)) == 15):
            self.friend_id = str(friend_id)
        else:
            print("[!] La longitud de su 'id' es muy corta")
            print("o muy corta")
            print("[!] Cerrando programa...")
            exit()
    
    def getfriend_id(self):
        return self.friend_id


    # Downloading Pictures from Facebook
    def Pictures(self, http):
        if not os.path.exists(self.friend_id):
            os.makedirs(self.friend_id)


        cookies = {
            "c_user": str(self.c_user),
            "xs": self.xs
        }
        req = requests.Session()
        offset = 0

        while True:
            url = "{}{}".format(http, offset)
            res = req.get(url, cookies=cookies)
            html = res.text
            match = re.findall(r"/photo.php\?fbid=([0-9]*)&amp;", html)
            if match:
                for m in match:
                    print("*" + m + "*")
                    file = open("{}/{}.jpg".format(self.friend_id, m),"wb")
                    res = req.get("https://mbasic.facebook.com/photo/view_full_size/?fbid={}".format(m), cookies=cookies)
                    html = res.text
                    z = re.search(r"a href=\"(.*?)\"", html)
                    if z:
                        url = str(z.groups()[0]).replace("&amp;", "&")
                        res = req.get(url, cookies=cookies)
                        f.write(res.content)
                        f.close()
                    else:
                        break
                offset+=12
                print(offset)
            else:
                break

    

    def Data(self):
        cookies = {
            "c_user": str(self.c_user),
            "xs": str(self.xs)
        }
        type_information = ["about", "about_work_and_education", "about_places",
                            "about_contact_and_basic_info", "about_family_and_relationships",
                            "about_details", "about_life_events"]

        req = requests.Session()
        
        for type_info in type_information:
            # Mediante el for, vamos moviendonos en el
            # arreglo 'type_information' para ir acciendo
            # a las diferentes secciones de información
            # que maneja facebook
            user_profile = "https://www.facebook.com/{}/{}".format(str(self.friend_id), str(type_info))
            
            # Verificamos que la url exista o que
            # este funcionando de manera correcta
            requests.get(user_profile)

            # Una vez validada la página web
            get_req = req.get(user_profile, cookies=cookies)

            requests.get(user_profile)
            
            page_soup = bs(get_req.content, "html.parser")
            print(page_soup)
            script = page_soup.find_all("script", {"type":"application/ld+json"})  
            print(script)        
            for data in script:
                print(data)
                for dat in data:
                    try:
                        print(json.loads(dat))
                    except:
                        print(dat.name)
                print("*****************************")
                print("*****************************")
            exit()
            
