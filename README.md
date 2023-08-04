This script outputs namespaces, images, and checksums in running Kubernetes cluster pods

On any VM where the kubectl utility is installed (if necessary, it can be installed on any VM), we create a script, for example in the home directory:
vi ~/k8s_images_sha.sh

Copy the contents of the script into it and save it.

Making the script executable:
chmod +x ~/k8s_images_sha.sh

Running the script:
~/k8s_images_sha.sh
 
Logs are saved to a file in the same directory where the script itself is located:
img_sha256.txt
img_sha256_uniq.txt
