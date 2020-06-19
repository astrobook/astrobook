clean:
	@echo "Removing _build/"
	rm -rf _build/
	@echo "Done!"

html: clean
	@echo "Building the book..."
	jupyter-book build .
