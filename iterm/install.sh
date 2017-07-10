#!/bin/bash

function installFonts() {
    echo "Now installing SourceCodePro Font"
    cp ./SourceCodePro/*.otf /Library/Fonts/
}

function doIt() {
    installFonts
}

doIt