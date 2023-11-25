# create git tag
VERSION := 0.6.0
GIT_COMMIT_MESSAGE := "Update pod name and readme"
tag:
	git tag -a $(VERSION) -m "Release $(VERSION)"
	git push origin $(VERSION)

git-push-all:
	git add .
	git commit -m $(GIT_COMMIT_MESSAGE)
	git push origin master

git-all: git-push-all tag