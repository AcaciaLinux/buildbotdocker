echo "==========================================="
echo "BUILDING LEAF BINARY!"
cd leafbinary
bash buildalpine.sh
cd ..

echo "==========================================="

echo "BUILDING DOCKER CONTAINER!"
docker build --rm --no-cache -t branchbuildbot .

echo "==========================================="
echo "SETUP COMPLETED."
