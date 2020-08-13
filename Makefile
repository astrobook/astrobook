# This file enables to automate testing and maintenance tasks

SRC_DIR = ./content
DWG_DIR = ./drawings
IMG_DIR = ./drawings/images
BUILD_DIR = ./_build

ASY_FILES:= $(wildcard $(DWG_DIR)/*.asy)

.PHONY: clean drawings

clean:
	@echo "Cleaning workspace..."
	rm -rf $(BUILD_DIR)
	@echo "Done!"

html: drawings
	@echo "Building the book..."
	jupyter-book build .

clean-images:
	@echo "Cleaning *.png drawings..."
	rm -rf $(IMG_DIR)/*.png
	@echo "Done!"

drawings:
	@echo "Rendering drawings..."
	mkdir -p $(IMG_DIR)
	asy -v $(DWG_DIR)/*.asy
	mv *.png $(IMG_DIR)/
	@echo "Done!"
