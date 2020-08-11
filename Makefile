# This file enables to automate testing and maintenance tasks

SRC_DIR = ./content
DWG_DIR = ./drawings
IMG_DIR = ./drawings/images
BUILD_DIR = ./_build

ASY_FILES:= $(wildcard $(DWG_DIR)/*.asy)

.PHONY: clean drawings

clean:
	@echo "Cleaning workspace..."
	rm -rf $(BUILD_DIR) $(IMG_DIR)/*.png
	@echo "Done!"

html: drawings
	@echo "Building the book..."
	jupyter-book build .

clean-drawings:
	@echo "Cleaning *.png drawings..."
	rm -rf drawings/*.png
	@echo "Done!"

drawings:
	@echo "Rendering drawings..."
	mkdir -p $(IMG_DIR)
	asy $(DWG_DIR)/*.asy
	mv *.png $(IMG_DIR)/
	@echo "Done!"
