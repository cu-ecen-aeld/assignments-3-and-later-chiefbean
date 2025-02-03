#include <syslog.h>
#include <stdio.h>

int main(int argc, char **argv) {
    char *filename = argv[1];
    char *writestr = argv[2];

    openlog("writer", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_USER);

    if (argc < 3) {
        syslog(LOG_ERR, "ERROR: Not enough arguments specified");
        return 1;
    }

    FILE *file = fopen(filename, "w+");
    if (file == NULL) {
        syslog(LOG_ERR, "ERROR: File does not exist");
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, filename);
    fprintf(file, "%s", writestr);
    fclose(file);

    return 0;
}