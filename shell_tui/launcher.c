#include <ncurses.h>

int main() {
    initscr();
    noecho();
    curs_set(0);
    if (has_colors() == FALSE) {
        endwin();
        printf("Seu terminal não suporta cores. \n");
        return 1;
    }

    start_color();
    init_pair(1, COLOR_WHITE, COLOR_BLUE);
    bkgd(COLOR_PAIR(1));
    mvprintw(3, 5, "Bem vindo ao Shell TUI do TUX OS");
    mvprintw(5, 5, "Pressione qualquer tecla para continuar...");
    refresh();
    getch();
    int height = 10, width = 40, lines = (LINES / 2), cols = (COLS / 2);
    WINDOW *menu_principal = newwin(height, width, lines, cols);
    box(menu_principal, 0, 0);
    return 0;
}