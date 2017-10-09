#!/bin/bash
set -eu
set -o pipefail

project_root=$(git rev-parse --show-toplevel)

echo "ansible-linting of main.yml"
ansible-lint -p \
--exclude=$project_root/roles/galaxy-docker/tasks/delete/delete_export_folder.yml \
--exclude=$project_root/roles/galaxy-docker/tasks/prepare_docker/create_export_directory_folders.yml \
--exclude=$project_root/roles/galaxy-docker/tasks/start_container/install_python_dependencies.yml \
$project_root/main.yml
