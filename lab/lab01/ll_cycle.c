#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    node *tortose, *hare;
    tortose = head;
    hare = head;
    while(tortose && hare) {
    	if (!hare || hare->next == NULL) { return 0;}
    	hare = hare->next->next;
    	tortose = tortose->next;
    	if (tortose == hare) {return 1;}
    }
    return 0;
}
