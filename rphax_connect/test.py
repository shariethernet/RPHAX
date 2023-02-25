import re
a = "94b73058-f390-4312-ae0d-6607106f51f8.cfargotunnel.com"
a_split = a.split(".")
if a_split[1] == "cfargotunnel":
    print("match")
else :
    print("No Match")
