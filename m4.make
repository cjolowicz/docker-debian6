Dockerfile: Dockerfile.m4 *.m4
	m4 Dockerfile.m4 > Dockerfile

clean:
	if [ -f Dockerfile.m4 ] ; then \
            rm -f Dockerfile ; \
	fi

.PHONY: clean
