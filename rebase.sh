echo "[+] Fetching upstream main.."
git fetch upstream main
echo "[+] Rebasing on upstream/main"
git rebase upstream/main
i=0
while [ $? -ne 0 ]; do
    echo "[+] Generating parser"
    #./generate.sh
    tree-sitter generate
    echo "[+] Adding generated parser"
    git add src
    echo "[+] Continuing rebase ($i)"
    i=$((i+1))
    git rebase --continue
done
echo "[+] Rebase completed successfully!"