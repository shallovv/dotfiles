#!/usr/bin/env perl

$latex='find . -type f -name "*.tex" -print0 | xargs -0 sed -i "" -e "s/、/, /g" -e "s/。/. /g"; uplatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$bibtex='upbibtex %O %B';
$biber='biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$makeindex='upmendex %O -o %D %S';
$dvipdf='dvipdfmx %O -o %D %S';
$max_repeat=5;
$pdf_mode=3;
$pvc_view_file_via_temporary=0;
$pdf_previewer="open -ga /Applications/Skim.app";
