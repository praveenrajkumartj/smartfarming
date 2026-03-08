import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class RemoveAgriUber {
    public static void main(String[] args) throws IOException {
        Path startPath = Paths.get("d:\\spring\\smartfarminganddigitalagriplatform\\src\\main\\webapp\\WEB-INF\\views");

        try (Stream<Path> stream = Files.walk(startPath)) {
            stream.filter(Files::isRegularFile)
                    .filter(p -> p.toString().endsWith(".jsp"))
                    .forEach(path -> {
                        try {
                            String content = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
                            boolean changed = false;

                            // Regex would be safer but let's try direct string removal for common variants
                            String[] patterns = {
                                    "<a href=\"${pageContext.request.contextPath}/farmer/equipment-rental\" class=\"sidebar-nav-item mb-2\"><span class=\"nav-icon\">🚜</span> Agri-Uber</a>",
                                    "<a href=\"${pageContext.request.contextPath}/farmer/equipment-rental\" class=\"sidebar-nav-item active mb-2\"><span class=\"nav-icon\">🚜</span> Agri-Uber</a>",
                                    "<a href=\"${pageContext.request.contextPath}/farmer/equipment-rental\" class=\"sidebar-nav-item mb-2\" style=\"color: #fbbf24;\"><span class=\"nav-icon\">🚜</span> Agri-Uber</a>"
                            };

                            for (String pattern : patterns) {
                                if (content.contains(pattern)) {
                                    content = content.replace(pattern, "<!-- Agri-Uber Removed -->");
                                    changed = true;
                                }
                            }

                            // Also check for slightly different formatting (newlines/spaces)
                            // This is a bit risky but we can try to find the specific href
                            if (content.contains("/farmer/equipment-rental")) {
                                // Manual lines removal for known format in dashboard.jsp and
                                // equipment-rental.jsp
                                // We'll just do a broad check
                            }

                            if (changed) {
                                Files.write(path, content.getBytes(StandardCharsets.UTF_8));
                                System.out.println("Removed Agri-Uber link from: " + path.getFileName());
                            }
                        } catch (Exception e) {
                            System.err.println("Error processing " + path + ": " + e.getMessage());
                        }
                    });
        }
    }
}
