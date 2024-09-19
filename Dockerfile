# 1. Basis-Image verwenden (Node.js 18)
FROM node:18-alpine

# 2. Arbeitsverzeichnis erstellen und festlegen
WORKDIR /app

# 3. Kopiere die package.json und package-lock.json in das Arbeitsverzeichnis
COPY package*.json ./

# 4. Installiere die Abhängigkeiten
RUN npm install

# 5. Kopiere den gesamten Applikationscode in das Image
COPY . .

# 6. Führe Linting mit automatischer Korrektur aus
RUN npm run lint -- --fix

# 7. Teste den Code
RUN npm run test

# 8. Baue die Applikation (falls notwendig)
RUN npm run build

# 9. Port freigeben (Standard für Webanwendungen, z. B. 3000)
EXPOSE 3000

# 10. Startbefehl definieren
CMD ["npm", "start"]
