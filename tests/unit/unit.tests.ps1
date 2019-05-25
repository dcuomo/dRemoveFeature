$PWD

.\something.ps1
Describe DescribeTest {
    Context ContextTest {
        It "Should be pass" {
            $true | Should be $true
        }

        CodeCovTest1
        It "Should run CodeCov1" {
            $true | Should be $true
        }
    }
}