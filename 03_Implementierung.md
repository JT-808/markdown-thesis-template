# Implementierung

Beschreibung der Implementierung.

```java
try (FileOutputStream fos = new FileOutputStream("output.bin")) {
    fos.write(data);  // 'data' ist ein Byte-Array
} catch (IOException e) {
    e.printStackTrace();
}
```
