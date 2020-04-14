import os


def	shell(comando): return os.popen(comando).read().strip()






### SCRIPTS ###
###############

def f_hora():
	global hora
	hora = shell("date '+%H:%M'")

def f_fecha():
	global fecha
	fecha = shell("date '+%d-%m-%Y'")

def f_volumen(): # ¿Pasarlo a which?
	global volumen
	v = int(shell("amixer get Master").split()[-2].replace("]", "").replace("[", "").replace("%", ""))

	if shell("amixer get Master").split()[-1].replace("]", "").replace("[", "") == "off": # Comprueba si está muteado
		volumen = "\ue04f" + str(v) + "%"
	elif v <= 0:
		volumen = "\ue04e" + str(v) + "%"
	elif v > 0 and v <= 20:
		volumen = "\ue050" + str(v) + "%"
	elif v > 20:
		volumen = "\ue05d" + str(v) + "%"

def f_usuario():
	global usuario
	usuario = shell("echo $USER@$(hostname)")

#def	escritorios() {
#	for i in $(bspc query -D -m --names); do  #Como un mismo escritorio se repite por cada monitor, cuando los listo aparecen los de todos los monitores, así que solo cojo los del primer monitor # bspc query -D --names | head -n "$(( $(bspc query -D | wc -l) / $(bspc query -M | wc -l) ))"
#	if [[ $i = $(bspc query -D -d --names) ]]; then escritorios="$escritorios%{B#b43e46} $i %{B-}"
#		else escritorios="$escritorios $i "; fi
#	done
#	echo "$escritorios"
#}

#conexión = " ? "
#segundo_plano = " ? "
#notificaciones = " ? "
#batería = " ? "

### Recursos del PC

def f_INTELuso():
	global INTELuso
	INTELuso = "%{F#41978a}\ue026%{F-}" + str(shell("grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print substr(usage,0,2)}'")) + "%"

def f_INTELtemp():
	global INTELtemp
	INTELtemp = "%{F#41978a}\ue01d%{F-}" + str(shell("sensors | grep Package | awk '{print substr($4, 2, 2)}'")) + "°"

def f_NVIDIAuso():
	global NVIDIAuso
	NVIDIAuso = "%{F#a09e13}\ue026%{F-}" + str(shell("nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits")) + "%"

def f_NVIDIAtemp():
	global NVIDIAtemp
	NVIDIAtemp = "%{F#a09e13}\ue01d%{F-}" + str(shell("nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits")) + "°"

def f_RAMuso():
	global RAMuso
	RAMuso = "%{F#f3b133}\ue028%{F-}" + str(shell("free | grep Mem | awk '{print substr($3*100/$2,0,2)}'")) + "%"







### LISTENERS ###
#################

# Estos loopps se ejecutarán con latencias diferentes con asyncio y servirán como listeners para alimentar al bucle final que escribe los datos en Lemonbar

# Grupo 1. No se necesita un loop, es algo que no va a cambiar
f_usuario()

# Grupo 2. Latencia de 1 minuto, si consigo sincronizarlo con el minutero de f_hora()
f_hora()
f_fecha()
#f_batería()

# Grupo 3. Latencia de 2 segundos
f_INTELuso()
f_INTELtemp()
f_NVIDIAuso()
f_NVIDIAtemp()
f_RAMuso()
#f_conexión()
#f_segundo_plano

# Grupo 4. Latencia de 0.1 segundos o menor.
f_volumen()
	
# Grupo 5. Latencia de 0.1 segundos o menor.
#f_escritorios()

# Grupo 6. Latencia de 0.1 segundos o menor.
#f_notificaciones()






### ESCRIBIR LEMONBAR ###
#########################


while True:
	f_hora()
	print("%{S1}" +
		"%{l}" + "escritorios" +
		"%{c}" + "música"  +
		"%{r}" + NVIDIAuso + NVIDIAtemp + " " + RAMuso + " " + INTELuso + INTELtemp + "    2oplano notificacion bateria conex" + " " + volumen + " " + hora + "  ")