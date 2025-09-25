package org.tuxos.appinstaller;
import java.io.IOException;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.MenuBar;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.Pane;

public class AppController {
    @FXML
    private MenuBar menuBar;
    @FXML
    private Menu menuFile;
    @FXML
    private Menu menuEdit;
    @FXML
    private Menu menuHelp;
    @FXML
    private MenuItem licenca;
    @FXML
    private Pane popupPane;

    @FXML
    private void MenuHelp() throws IOException {
        popupPane.setVisible(true);
    }


}
