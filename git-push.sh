#!/bin/bash
cd /home/orel/redshift-odbc-versions/Ov2.1.13F1.0.0-BLL
git add .github/workflows/build-msi.yml
git add COMMIT_MESSAGE.txt
git add .vcpkg-ignore
git commit -F COMMIT_MESSAGE.txt
git push origin Ov2.1.13F1.0.0-BLL
