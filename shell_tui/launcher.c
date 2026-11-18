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
    init_pair(1, COLOR_BLUE, COLOR_WHITE);
    bkgd(COLOR_PAIR(1));
    mvprintw(3, 5, "Bem vindo ao Shell TUI do TUX OS");
    mvprintw(5, 5, "Pressione qualquer tecla para sair...");
    refresh();
    getch();
    endwin();
    return 0;
}