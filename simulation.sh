#!/bin/bash
scale=5
Sumpic=25
amp=1
pathpic='pic'
path2D="${pathpic}/2D"
path3D="${pathpic}/3D"

#rm -rf ${pathpic}
#rm -f log.txt

export LC_CTYPE="en_US.UTF-8"

mkdir -p ${pathpic}
mkdir -p ${path2D}
mkdir -p ${path3D}

wolframscript -file demo.wl
echo "demo png saved"
wolframscript -file EP2D0.wl ${scale} ${scale} 1.4 1.6 1.2 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D00.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D00.png"
wolframscript -file EP3D0.wl ${amp}*${scale} ${scale} 1.4 1.6 1.2 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D00.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D00.png"
wolframscript -file EP2D0.wl ${scale} ${scale} 1.4 1.6 0.8 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D01.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D01.png"
wolframscript -file EP3D0.wl ${amp}*${scale} ${scale} 1.4 1.6 0.8 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D01.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D01.png"
wolframscript -file EP2D0.wl ${scale} ${scale} 1.4 2 1.2 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D02.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D02.png"
wolframscript -file EP3D0.wl ${amp}*${scale} ${scale} 1.4 2 1.2 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D02.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D02.png"

wolframscript -file EP2D1.wl ${scale} ${scale} 1.4 0.8 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D10.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D10.png"
wolframscript -file EP3D1.wl ${amp}*${scale} ${scale} 1.4 0.8 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D10.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D10.png"
wolframscript -file EP2D1.wl ${scale} ${scale} 1.4 1.2 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D11.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D11.png"
wolframscript -file EP3D1.wl ${amp}*${scale} ${scale} 1.4 1.2 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D11.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D11.png"

wolframscript -file EP2D2.wl ${scale} ${scale} 2.5 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D20.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D20.png"
wolframscript -file EP3D2.wl ${scale} ${scale} 2.5 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D20.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D20.png"

wolframscript -file EP2D3.wl ${scale} ${scale} 1.4 0.2 0.2 \"${Sumpic}\" "${path2D}/EP2D30.png" >> log.txt
echo "${Sumpic} ${path2D}/EP2D30.png"
wolframscript -file EP3D3.wl ${scale} ${scale} 1.4 0.2 0.2 \"${Sumpic}\" "${path3D}/EP3D30.png" >> log.txt
echo "${Sumpic} ${path3D}/EP3D30.png"

wolframscript -file d2Dsphere.wl ${scale} ${scale} 1.6 0.6 1.5 0.5 \"${Sumpic}\" "${path2D}/d2Dsph0.png" >> log.txt
echo "${Sumpic} ${path2D}/d2Dsph0.png"
wolframscript -file d3Dsphere.wl ${scale} ${scale} 1.6 0.6 1.5 0.5 \"${Sumpic}\" "${path3D}/d3Dsph0.png" >> log.txt
echo "${Sumpic} ${path3D}/d3Dsph0.png"
wolframscript -file d2Dsphere.wl ${scale} ${scale} 1.55 0.55 1.5 0.5 \"${Sumpic}\" "${path2D}/d2Dsph1.png" >> log.txt
echo "${Sumpic} ${path2D}/d2Dsph1.png"
wolframscript -file d3Dsphere.wl ${scale} ${scale} 1.55 0.55 1.5 0.5 \"${Sumpic}\" "${path3D}/d3Dsph1.png" >> log.txt
echo "${Sumpic} ${path3D}/d3Dsph1.png"
