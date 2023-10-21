#include <gtk/gtk.h>  // Include the GTK+ library for creating graphical interfaces
#include <pthread.h>  // Include the POSIX threads library for creating threads
#include <stdio.h>    // Include the standard I/O library for input/output operations
#include <stdlib.h>   // Include the standard library for general purpose functions
#include <string.h>   // Include the string library for string manipulation functions
#include <sys/types.h>  // Include types library for data types used in system calls
#include <dirent.h>  // Include the directory entries library for handling directories
#include <unistd.h>  // Include the UNIX standard library for miscellaneous symbolic constants and types

// Declaration of the play_new_files function
void *play_new_files(void *arg);

// Global variables
char **old_file_list = NULL;  
int old_file_count = 0;  



// Function to list WAV files in a directory
char **list_wav_files(const char *directory, int *file_count) {
    DIR *dir;  
    struct dirent *ent;  // Directory entry struct
    char **file_list = NULL;  // File list initialized to NULL
    *file_count = 0;  // File count initialized to 0

    // Open the directory
    if ((dir = opendir(directory)) != NULL) {
        // Read directory entries
        while ((ent = readdir(dir)) != NULL) {
            // Check if the file has a .wav extension
            if (strstr(ent->d_name, ".wav") != NULL) {
                // Reallocate memory for the file list and add the file to the list
                file_list = realloc(file_list, (*file_count + 1) * sizeof(char *));
                file_list[*file_count] = strdup(ent->d_name);
                (*file_count)++;
            }
        }
        closedir(dir); 
    } else {
        perror("Could not open directory");  
    }

    return file_list; 
}

// Function to play a file
void play_file(const char *file_path) {
    char command[512];  // Command string
    snprintf(command, sizeof(command), "xdg-open %s", file_path);  // Format the command string
    system(command);  // Execute the command to play the file
}

// Function to monitor for new files and play them
void *play_new_files(void *arg) {
    const char *directory = "/tmp/";  // Directory to monitor
    while (1) {  // Infinite loop
        int new_file_count = 0;  // New file count
        char **new_file_list = list_wav_files(directory, &new_file_count);  // Get the list of new files

        // Look for new files
        for (int i = 0; i < new_file_count; i++) {
            int found = 0;  // Found flag initialized to 0 (false)
            // Compare the new file list with the old file list
            for (int j = 0; j < old_file_count; j++) {
                // Check if the file is already in the old file list
                if (strcmp(new_file_list[i], old_file_list[j]) == 0) {
                    found = 1;  // Set the found flag to 1 (true) if the file is found
                    break;
                }
            }
            
            // If the file is not found in the old file list, play the file
            if (!found) {
                char file_path[512];  // File path string
                snprintf(file_path, sizeof(file_path), "%s/%s", directory, new_file_list[i]);  // Format the file path string
                play_file(file_path);  
            }
        }

        // Free the old file list
        for (int i = 0; i < old_file_count; i++) {
            free(old_file_list[i]);
        }
        free(old_file_list);

        // Update the file list
        old_file_list = new_file_list;
        old_file_count = new_file_count;

        sleep(5);  
    }

    return NULL;  // Return NULL (this line will never be reached due to the infinite loop)
}

// Function to start monitoring (called when the start button is clicked)
void start_monitoring(GtkWidget *widget, gpointer data) {
    pthread_t thread_id;  // Thread ID
    pthread_create(&thread_id, NULL, play_new_files, NULL);  // Create a new thread to run the play_new_files function
}


// Main function
int main(int argc, char *argv[]) {

    // Window widget
    GtkWidget *window;  
    GtkWidget *start_button;
    GtkWidget *box; 

    gtk_init(&argc, &argv);  // Initialize GTK+


    // Create a new top-level window
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Audio Monitor");  
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 100);  
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);  // Connect the destroy signal to the gtk_main_quit function

    // Vertical layout
    box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_container_add(GTK_CONTAINER(window), box); 

    start_button = gtk_button_new_with_label("START");
    g_signal_connect(start_button, "clicked", G_CALLBACK(start_monitoring), NULL);
    gtk_box_pack_start(GTK_BOX(box), start_button, TRUE, TRUE, 0);

    // Show all widgets
    gtk_widget_show_all(window);

    // Enter the GTK+ main event loop
    gtk_main();

    return 0; 
}
