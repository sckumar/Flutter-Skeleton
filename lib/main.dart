curl -X PUT \  
  -H "Authorization: token YOUR_PAT" \  
  -H "Accept: application/vnd.github.v3+json" \  
  https://api.github.com/repos/:owner/:repo/contents/lib/main.dart \  
  -d '{  
    "message": "Update main.dart",  
    "content": "base64-encoded-content",  
    "branch": "master",  
    "sha": "current-sha"  
  }'