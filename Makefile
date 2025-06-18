.DEFAULT_GOAL := all

abs_builddir="`pwd`"
RPMBUILDOPTS	= --define "_sourcedir $(abs_builddir)" \
		  --define "_specdir $(abs_builddir)" \
		  --define "_builddir $(abs_builddir)" \
	 	  --define "_srcrpmdir $(abs_builddir)" \
	 	  --define "_rpmdir $(abs_builddir)"

all:

check:

clean:
	rm -f upstream-ci-dummy-rpm.spec

rpm:
	export LOG_MESSAGE="$(date +'%a %b %d %Y') CI build robot ${BUILD_NUMBER}"
	sed \
		-e "s#@version@#${BUILD_NUMBER}#g" \
		-e "s#@logmessage1@#* $$(date +'%a %b %d %Y') CI build robot - ${BUILD_NUMBER}#g" \
		-e "s#@logmessage2@#- updated from commit ${GIT_COMMIT} by ${GIT_COMMITTER_NAME}#g" \
		ha-functional-testing-extras.spec.in > ha-functional-testing-extras.spec
	rpmbuild --nodeps $(RPMBUILDOPTS) -ba ha-functional-testing-extras.spec
