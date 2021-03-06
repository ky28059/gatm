FOLDERNAME=$1

cd "${FOLDERNAME}"

echo "Building ${FOLDERNAME} Stage 1"
pdflatex -shell-escape -file-line-error -interaction=nonstopmode *answers.tex | grep ".*:[0-9]*:.*"
echo "Rendering Asymptote"
asy *answers-*.asy
echo "Building ${FOLDERNAME} Stage 2"
pdflatex -shell-escape -file-line-error -interaction=nonstopmode *answers.tex | grep ".*:[0-9]*:.*"
echo "Building ${FOLDERNAME} Stage 3"
pdflatex -shell-escape -file-line-error -interaction=nonstopmode *answers.tex | grep ".*:[0-9]*:.*"
