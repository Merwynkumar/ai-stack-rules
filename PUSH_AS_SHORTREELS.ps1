# PowerShell script to push as shortreels account using Personal Access Token
# This script helps you push to shortreels/ai-stack-rules

param(
    [Parameter(Mandatory=$true)]
    [string]$PersonalAccessToken
)

$RepoUrl = "https://github.com/shortreels/ai-stack-rules.git"
$RemoteUrl = "https://$PersonalAccessToken@github.com/shortreels/ai-stack-rules.git"

Write-Host "🔐 Configuring Git to use shortreels account..." -ForegroundColor Cyan
Write-Host ""

# Update remote URL with token
git remote set-url origin $RemoteUrl
Write-Host "✅ Remote URL updated with authentication" -ForegroundColor Green

# Push to GitHub
Write-Host ""
Write-Host "📤 Pushing to shortreels/ai-stack-rules..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "🌐 Repository URL: https://github.com/shortreels/ai-stack-rules" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "⚠️  Security Note: The token is stored in Git config." -ForegroundColor Yellow
    Write-Host "   Consider removing it after push for security:" -ForegroundColor Yellow
    Write-Host "   git remote set-url origin https://github.com/shortreels/ai-stack-rules.git" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "❌ Failed to push. Please check:" -ForegroundColor Red
    Write-Host "   1. Token is valid and has 'repo' scope" -ForegroundColor Red
    Write-Host "   2. Repository exists: https://github.com/shortreels/ai-stack-rules" -ForegroundColor Red
    Write-Host "   3. You have push access to the repository" -ForegroundColor Red
}

