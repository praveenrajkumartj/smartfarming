import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class BootstrapInjector {
    public static void main(String[] args) throws IOException {
        Path startPath = Paths.get("d:\\spring\\smartfarminganddigitalagriplatform\\src\\main\\webapp\\WEB-INF\\views");
        String bootstrapCss = "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">";
        String bootstrapJs = "    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>";

        try (Stream<Path> stream = Files.walk(startPath)) {
            stream.filter(Files::isRegularFile)
                    .filter(p -> p.toString().endsWith(".jsp"))
                    .forEach(path -> {
                        try {
                            String content = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
                            boolean changed = false;

                            if (!content.contains("bootstrap.min.css")) {
                                if (content.contains("</head>")) {
                                    // Insert before custom CSS to allow custom overrides
                                    if (content.contains("<link rel=\"stylesheet\"")) {
                                        content = content.replace("<link rel=\"stylesheet\"",
                                                bootstrapCss + "\n    <link rel=\"stylesheet\"");
                                    } else {
                                        content = content.replace("</head>", bootstrapCss + "\n</head>");
                                    }
                                    changed = true;
                                }
                            }

                            if (!content.contains("bootstrap.bundle.min.js")) {
                                if (content.contains("</body>")) {
                                    content = content.replace("</body>", bootstrapJs + "\n</body>");
                                    changed = true;
                                }
                            }

                            if (changed) {
                                Files.write(path, content.getBytes(StandardCharsets.UTF_8));
                                System.out.println("Injected Bootstrap into: " + path.getFileName());
                            }
                        } catch (Exception e) {
                            System.err.println("Error processing " + path + ": " + e.getMessage());
                        }
                    });
        }
    }
}
