#include <ncurses.h>

int main() {
    initscr();
    mvprintw(3, 10, "---LAUNCHER TUXOS---");
    mvprintw(5, 10, "Pressione uma tecla para continuar...");
    refresh();
    getch();
    endwin();
    return 0;
}