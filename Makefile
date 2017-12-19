# HTML conversion; requires "pandoc"

htmlfiles: docker-quick-reference.html README.html urls.html commands.html

%.html: %.md
	pandoc $< -o $(basename $<).html

