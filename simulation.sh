#!/bin/bash
scale=2
pathpic='pic'
path2D="${pathpic}/2D"
path3D="${pathpic}/3D"

rm -f log.txt

mkdir -p ${pathpic}
mkdir -p ${path2D}
mkdir -p ${path3D}

wolframscript -file EP2D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path2D}/EP2D00.png" >> log.txt
wolframscript -file EP3D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path3D}/EP3D00.png" >> log.txt
#wolframscript -file EP2D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path2D}/EP2D01.png"
#wolframscript -file EP3D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path3D}/EP3D01.png"
#wolframscript -file EP2D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path2D}/EP2D02.png"
#wolframscript -file EP3D0.wl ${scale} ${scale} 1.1 1.2 1 0.05 0.05 "${path3D}/EP3D02.png"

wolframscript -file EP2D1.wl ${scale} ${scale} 1.1 1 0.05 0.05 "${path2D}/EP2D10.png"
#wolframscript -file EP3D1.wl ${scale} ${scale} 1.1 1 0.05 0.05 "${path3D}/EP3D10.png"
#wolframscript -file EP2D1.wl ${scale} ${scale} 1.1 1 0.05 0.05 "${path2D}/EP2D11.png"
#wolframscript -file EP3D1.wl ${scale} ${scale} 1.1 1 0.05 0.05 "${path3D}/EP3D11.png"

#wolframscript -file EP2D2.wl ${scale} ${scale} 1 0.05 0.05 "${path2D}/EP2D20.png"
#wolframscript -file EP3D2.wl ${scale} ${scale} 1 0.05 0.05 "${path3D}/EP3D20.png"

#wolframscript -file EP2D3.wl ${scale} ${scale} 1.1 0.05 0.05 "${path2D}/EP2D30.png"
#wolframscript -file EP3D3.wl ${scale} ${scale} 1.1 0.05 0.05 "${path3D}/EP3D30.png"
