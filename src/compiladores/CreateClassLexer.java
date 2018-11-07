package compiladores;

import java.io.File;

public class CreateClassLexer {
    public static void main(String[] args) {
        String cwd = System.getProperty("user.dir");
        String path = String.format("%s/src/compiladores/%s", cwd, "lexer.flex");
        generarLexer(path);

    }

    public static void generarLexer(String path) {
        File file = new File(path);
        jflex.Main.generate(file);
    }
}
