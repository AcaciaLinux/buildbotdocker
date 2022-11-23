docker run \
	-e PYTHONUNBUFFERED=1 \
	-v $(pwd)/workdir:/opt/workdir/ \
	--privileged \
	branchbuildbot
