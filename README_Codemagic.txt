CARICAMENTO SU GITHUB/CODEMAGIC

IMPORTANTE: su GitHub NON caricare questo ZIP come singolo file.
Estrai lo ZIP e carica TUTTO il contenuto della cartella nel repository.
Nella radice del repository devono comparire:
- app/
- build.gradle
- settings.gradle
- gradle.properties
- gradlew
- codemagic.yaml

Poi su Codemagic collega il repository e avvia il workflow "android-keyboard".
Il workflow produce:
app/build/outputs/apk/debug/app-debug.apk
