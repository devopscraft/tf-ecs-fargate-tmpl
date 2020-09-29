Zadanie 2

Klient naszej firmy przyszedł do nas z następującymi wymaganiami biznesowymi:
- chcemy zaprojektować aplikację frontendową w duchu PWA/SPA, która komunikuje się z API wystawionym w chmurze
- aplikacja frontendowa wysyła do API porcje danych do przetwarzania o różnym stopniu komplikacji oraz rozmiarze
- API jest wysoko dostępne, klienci naszej aplikacji możliwie nigdy nie mogą zobaczyć, że mamy jakiekolwiek problemy z ich requestami
- jesteśmy skłonni zaimplementować podejście asynchroniczne, tak aby żaden fail nie został zwrócony prosto do interfejsu użytkownika
- API w trakcie przetwarzania danych produkuje spore ilości danych "przejściowych", do których musi mieć szybki i uporządkowany dostęp. Dane przejściowe tworzą między sobą relacje, mają również określone struktury, po których musimy mieć możliwość filtrowania oraz przeszukiwania.
- API jest tworzone przez trzy różne zespoły. Jeden z nich jest odpowiedzialny za integrację z aplikacją frontendową, drugi z nich za przetwarzanie danych przejściowych oraz generowanie wyjściowych danych, a trzeci z nich zapewnia warstwę korekcji danych, która analizuje dane wyjściowe i dokonuje ich korekty w oparciu o poprzednie "generacje"
- wszystkie trzy zespoły korzystają z innych języków programowania do realizacji swoich zadań

Zaproponuj architekturę aplikacji uwzględniającą infrastrukturę AWS, oraz elementy architektury kodu (jeśli uważasz za potrzebne), które zrealizują podane wymagania.  
  
Ad.1. SPA => to wystarczy nam S3 bucket i CloudFront do serwowania frontu  
Ad.2. By user nie widział problemów potrzebny nam element po środku, kolejka/cache między FE a API, np. klaster RabbitMQ  
Ad.3. Dane przejściowe zapisać do S3, przeszukiwać poprzez AWS Athena, albo postawić obok Prestosql  
Ad.4. Front jest oddzielony od API, dane przejściowe lądują na S3, integracja przechodzi przez oddzielny element (kolejki) zatem wszystkie trzy zespoły powinny móc pracować bez wchodzenia sobie w drogę.  
Ad.5. Pozostaje kwestia sieci, całość można zamknąć w standardowym VPC z klastrem RabbitMQ w prywatnej części  
Ad.6. Część API sami hostujemy czy jest nam po prostu wystawiona w chmurze?    

