# PowerShell script to test GitHub Personal Access Token

param(
    [Parameter(Mandatory=$true)]
    [string]$Token
)

Write-Host "🔍 Testing GitHub Personal Access Token..." -ForegroundColor Cyan
Write-Host ""

# Test 1: Check if token can access user account
Write-Host "Test 1: Checking user account access..." -ForegroundColor Yellow
try {
    $headers = @{
        "Authorization" = "token $Token"
        "Accept" = "application/vnd.github.v3+json"
    }
    
    $user = Invoke-RestMethod -Uri "https://api.github.com/user" -Headers $headers
    
    Write-Host "✅ Token is valid!" -ForegroundColor Green
    Write-Host "   User: $($user.login)" -ForegroundColor Green
    Write-Host "   Name: $($user.name)" -ForegroundColor Green
    Write-Host "   Email: $($user.email)" -ForegroundColor Green
} catch {
    Write-Host "❌ Token is invalid or expired" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Test 2: Check if token can access the repository
Write-Host "Test 2: Checking repository access..." -ForegroundColor Yellow
try {
    $repo = Invoke-RestMethod -Uri "https://api.github.com/repos/shortreels/ai-stack-rules" -Headers $headers
    
    Write-Host "✅ Repository is accessible!" -ForegroundColor Green
    Write-Host "   Repository: $($repo.full_name)" -ForegroundColor Green
    Write-Host "   Visibility: $($repo.visibility)" -ForegroundColor Green
    Write-Host "   Default Branch: $($repo.default_branch)" -ForegroundColor Green
} catch {
    Write-Host "❌ Cannot access repository" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   This might mean:" -ForegroundColor Yellow
    Write-Host "   - Repository doesn't exist" -ForegroundColor Yellow
    Write-Host "   - Token doesn't have 'repo' scope" -ForegroundColor Yellow
    Write-Host "   - Token is from wrong account" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "✅ All tests passed! Token is valid and has correct permissions." -ForegroundColor Green
Write-Host ""
Write-Host "🚀 You can now push using:" -ForegroundColor Cyan
Write-Host "   git push https://$Token@github.com/shortreels/ai-stack-rules.git main" -ForegroundColor White

