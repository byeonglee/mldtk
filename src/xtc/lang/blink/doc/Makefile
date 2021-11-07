default: blink.html blink.pdf

pub.tgz: blink.html blink.pdf
	mkdir blink
	cp blink.html blink/index.html
	cp *.jpg *.pdf blink/
	cp blink.pdf blink/
	tar czf pub.tgz blink/
	rm -rf blink

blink.html: blink.texinfo
	makeinfo --html --no-split blink.texinfo

blink.pdf: blink.texinfo
	texi2pdf blink.texinfo

clean:
	@rm -f *~ blink.{aux,cp,cps,fn,ky,log,pg,toc,tp,vr}

cleanall: clean
	@rm -f blink.{html,pdf} pub.tgz
