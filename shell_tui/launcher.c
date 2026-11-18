#include <ncurses.h>

void init_colors() {
    if (has_colors() == FALSE) {
        endwin();
        printf("Seu terminal não suporta cores. \n");
        return;
    }
    start_color();
    init_pair(1, COLOR_WHITE, COLOR_BLUE);
}

int main() {
    initscr();
    noecho();
    curs_set(0);
    init_colors();
    bkgd(COLOR_PAIR(1));
    mvprintw(3, 5, "Bem vindo ao Shell TUI do TUX OS");
    mvprintw(5, 5, "Pressione qualquer tecla para continuar...");
    refresh();
    getch();
    int height = 10;
    int width = 40;
    int lines = (LINES - height) / 2;
    int cols = (COLS - width) / 2;
    WINDOW *menu_principal = newwin(height, width, lines, cols);
    box(menu_principal, 0, 0);
    getch();
    endwin();
    return 0;
}
