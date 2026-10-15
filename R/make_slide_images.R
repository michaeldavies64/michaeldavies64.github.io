# Turns a project's deck.pdf into slide images for its page.
#
# Usage, from the project root, after replacing deck.pdf:
#   Rscript R/make_slide_images.R projects/performance/rebuilding-match-insight
#
# Writes slides/slide-01.png, slide-02.png, ... and _slides.md (the list the page includes).
# Then render the site and commit the folder as usual.

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) stop("Give the project folder, e.g. projects/performance/my-project")
dir <- args[1]
pdf <- file.path(dir, "deck.pdf")
if (!file.exists(pdf)) stop("No deck.pdf in ", dir)

out <- file.path(dir, "slides")
dir.create(out, showWarnings = FALSE)
unlink(list.files(out, pattern = "\\.png$", full.names = TRUE))

n <- pdftools::pdf_info(pdf)$pages
files <- file.path(out, sprintf("slide-%02d.png", seq_len(n)))
invisible(pdftools::pdf_convert(pdf, format = "png", dpi = 120, filenames = files, verbose = FALSE))

imgs <- sprintf("![](slides/%s){fig-alt=\"Slide %d of %d\"}", basename(files), seq_len(n), n)
lines <- c("::: {.md-slides}", "", paste0(imgs, "\n"), ":::")
writeLines(lines, file.path(dir, "_slides.md"))
message("Wrote ", n, " slide images and _slides.md in ", dir)
