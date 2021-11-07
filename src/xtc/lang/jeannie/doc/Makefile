default: jeannie.html jeannie.pdf

pub.tgz: jeannie.html jeannie.pdf
	mkdir jeannie
	cp jeannie.html jeannie/index.html
	cp *.jpg *.pdf jeannie/
	cp jeannie.pdf jeannie/
	tar czf pub.tgz jeannie/
	rm -rf jeannie

jeannie.html: jeannie.texinfo
	makeinfo --html --no-split jeannie.texinfo

jeannie.pdf: jeannie.texinfo
	texi2pdf jeannie.texinfo

clean:
	@rm -f *~ jeannie.{aux,cp,cps,fn,ky,log,pg,toc,tp,vr}

cleanall: clean
	@rm -f jeannie.{html,pdf} pub.tgz
