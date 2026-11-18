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
    return 0;
}