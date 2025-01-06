


- task: PowerShell@2
        displayName: Run gradle sonar
        inputs:
            targetType: 'inline'
            pwsh: true
            workingDirectory: ${{ parameters.workingDirectory }}
            script: |
                $searchText = "x-ratelimit-remaining-requests"
                $filteredLine = Get-Content -Path 'curl.sh' | Select-String -Pattern $searchText
                    
                if ($filteredLine) {
                    $splitLine = $filteredLine -split '='
                    $version = $splitLine[1].Trim()
                    $version
                }
                $GRADLE_COMMAND = "./gradlew sonar"
                $GRADLE_COMMAND += " ""-Dsonar.projectVersion=$(version)"""