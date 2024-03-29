FROM ghcr.io/anime-republic/mirrorhunter:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN wget https://github.com/Anshusharma75/prabhu -O /usr/local/bin/prabhu
COPY . .
COPY .netrc /root/.netrc
RUN chmod 600 /usr/src/app/.netrc
RUN chmod +x aria.sh
RUN chmod a+rx /usr/local/bin/prabhu

CMD ["bash","start.sh"]
