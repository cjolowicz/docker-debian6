Dockerfile: Dockerfile.m4 *.m4
	m4 Dockerfile.m4 > Dockerfile

clean::
	rm -vf Dockerfile
