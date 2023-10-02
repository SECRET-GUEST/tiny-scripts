#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>

// Modifiez ces variables selon vos besoins
const char *inputDirectory = "YOUR/PATH/HERE";
const char *outputDirectory = "YOUR/PATH/HERE";

void collectExtensions(const char *path, char ***extensions, int *count);
void createExtensionDirectories(const char *path, char **extensions, int count);
void organizeFiles(const char *inputPath, const char *outputPath);
void removeEmptyDirectories(const char *path);
int copyFile(const char *srcPath, const char *destPath);

int main(void) {
    char **extensions = NULL;
    int count = 0;

    collectExtensions(inputDirectory, &extensions, &count);
    createExtensionDirectories(outputDirectory, extensions, count);

    organizeFiles(inputDirectory, outputDirectory);
    removeEmptyDirectories(inputDirectory);

    for (int i = 0; i < count; i++) free(extensions[i]);
    free(extensions);

    return 0;
}

void collectExtensions(const char *path, char ***extensions, int *count) {
    DIR *dir = opendir(path);
    if (!dir) {
        perror("Unable to open directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) continue;

        char *fullpath;
        asprintf(&fullpath, "%s/%s", path, entry->d_name);

        struct stat s;
        if (stat(fullpath, &s) == -1) {
            perror("stat");
            free(fullpath);
            continue;
        }

        if (S_ISDIR(s.st_mode)) collectExtensions(fullpath, extensions, count);
        else if (S_ISREG(s.st_mode)) {
            char *ext = strrchr(entry->d_name, '.');
            if (ext && ext != entry->d_name) {
                ext++;

                int found = 0;
                for (int i = 0; i < *count && !found; i++)
                    if (strcmp((*extensions)[i], ext) == 0) found = 1;

                if (!found) {
                    *extensions = realloc(*extensions, (*count + 1) * sizeof(char *));
                    (*extensions)[*count] = strdup(ext);
                    (*count)++;
                }
            }
        }
        free(fullpath);
    }

    closedir(dir);
}

void createExtensionDirectories(const char *path, char **extensions, int count) {
    for (int i = 0; i < count; i++) {
        char *newDir;
        asprintf(&newDir, "%s/%s", path, extensions[i]);

        if (mkdir(newDir, 0777) == -1 && errno != EEXIST) perror("mkdir");

        free(newDir);
    }
}

int copyFile(const char *srcPath, const char *destPath) {
    FILE *src = fopen(srcPath, "rb");
    if (!src) {
        perror("fopen src");
        return -1;
    }

    FILE *dest = fopen(destPath, "wb");
    if (!dest) {
        perror("fopen dest");
        fclose(src);
        return -1;
    }

    char buffer[8192];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), src)) > 0)
        if (fwrite(buffer, 1, bytesRead, dest) != bytesRead) {
            perror("fwrite");
            fclose(src);
            fclose(dest);
            return -1;
        }

    fclose(src);
    fclose(dest);
    return 0;
}

void organizeFiles(const char *inputPath, const char *outputPath) {
    DIR *dir = opendir(inputPath);
    if (!dir) {
        perror("Unable to open directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) continue;

        char *fullInputPath;
        asprintf(&fullInputPath, "%s/%s", inputPath, entry->d_name);

        struct stat s;
        if (stat(fullInputPath, &s) == -1) {
            perror("stat");
            free(fullInputPath);
            continue;
        }

        if (S_ISDIR(s.st_mode)) organizeFiles(fullInputPath, outputPath);
        else if (S_ISREG(s.st_mode)) {
            char *ext = strrchr(entry->d_name, '.');
            if (ext && ext != entry->d_name) {
                ext++;

                char *extDir;
                asprintf(&extDir, "%s/%s", outputPath, ext);
                mkdir(extDir, 0777);

                char *newPath;
                asprintf(&newPath, "%s/%s", extDir, entry->d_name);

                if (rename(fullInputPath, newPath) == -1) {
                    if (errno == EXDEV) {
                        if (copyFile(fullInputPath, newPath) == 0)
                            remove(fullInputPath);
                        else
                            perror("copyFile");
                    } else
                        perror("rename");
                }

                free(extDir);
                free(newPath);
            }
        }

        free(fullInputPath);
    }

    closedir(dir);
}

void removeEmptyDirectories(const char *path) {
    DIR *dir = opendir(path);
    if (!dir) {
        perror("Unable to open directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) continue;

        char *fullpath;
        asprintf(&fullpath, "%s/%s", path, entry->d_name);

        struct stat s;
        if (stat(fullpath, &s) == -1) {
            perror("stat");
            free(fullpath);
            continue;
        }

        if (S_ISDIR(s.st_mode)) {
            removeEmptyDirectories(fullpath);
            if (rmdir(fullpath) == -1 && errno != ENOTEMPTY) perror("rmdir");
        }

        free(fullpath);
    }

    closedir(dir);
}