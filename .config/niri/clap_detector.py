import pyaudio
import numpy as np
import time
import os

# --- НАСТРОЙКИ ---
THRESHOLD = 6000         # Минимальная пиковая громкость для хлопка
RATIO_THRESHOLD = 4.0    # Во сколько раз пик должен превышать средний шум (защита от речи)
CHUNK = 1024            
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100
CLAP_COOLDOWN = 0.8     # Время между хлопками
MAX_DELAY = 0.9          # Максимальное время для двойного хлопка

CMD = "qs -c noctalia-shell ipc call wallpaper random all"

p = pyaudio.PyAudio()
stream = p.open(format=FORMAT, channels=CHANNELS, rate=RATE,
                input=True, frames_per_buffer=CHUNK)

print("Слушаю хлопки с защитой от речи...")
last_clap_time = 0

while True:
    try:
        data = np.frombuffer(stream.read(CHUNK, exception_on_overflow=False), dtype=np.int16)
        peak = np.max(np.abs(data))
        mean = np.mean(np.abs(data)) + 1 # +1 во избежание деления на ноль
        
        # Хлопок — это когда звук ОЧЕНЬ громкий И резко выделяется на фоне общего шума
        if peak > THRESHOLD and (peak / mean) > RATIO_THRESHOLD:
            current_time = time.time()
            if CLAP_COOLDOWN < (current_time - last_clap_time) < MAX_DELAY:
                print("Зафиксирован двойной хлопок!")
                os.system(CMD)
                last_clap_time = 0
                time.sleep(1.5) # Защитная пауза, чтобы не поймать эхо
            else:
                last_clap_time = current_time
    except KeyboardInterrupt:
        break

stream.stop_stream()
stream.close()
p.terminate()
