properties {
    # Set this to $true to create a module with a monolithic PSM1
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Help.DefaultLocale = 'en-US'
    $PSBPreference.Test.OutputFile = 'out/testResults.xml'
}

task Default -depends Test

task Test -FromModule PowerShellBuild -minimumVersion '0.6.1'

task PublishDocs -depends Build {
    exec {
        docker run -v "$($psake.build_script_dir)`:/docs" -e 'CI=true' --entrypoint 'sh' squidfunk/mkdocs-material:latest -c 'pip install -r requirements.txt && mkdocs gh-deploy --force'
    }
}
