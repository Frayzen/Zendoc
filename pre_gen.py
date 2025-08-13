import os
import re
from pathlib import Path

def set_filename_titles(docs_dir="docs"):
    for root, _, files in os.walk(docs_dir):
        for file in files:
            if file.endswith(".md"):
                print("file")
                path = Path(root) / file
                filename = Path(file).stem
                
                with open(path, 'r+', encoding='utf-8') as f:
                    content = f.read()
                    
                    # Add or update frontmatter
                    if not content.startswith('---\n'):
                        content = f"---\ntitle: {filename}\n---\n\n{content}"
                    elif re.match(r'^---\n.*title:.*\n---', content, re.DOTALL):
                        content = re.sub(r'(^---\n.*?title:).*?(\n---)', 
                                        fr'\1 {filename}\2', 
                                        content, 
                                        flags=re.DOTALL)
                    else:
                        content = content.replace('---\n', f'---\ntitle: {filename}\n', 1)
                    
                    f.seek(0)
                    f.write(content)
                    f.truncate()

if __name__ == "__main__":
    set_filename_titles()
