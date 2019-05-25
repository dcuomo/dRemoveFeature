$PWD

.\tests\unit\something.ps1
Describe DescribeTest {
    Context ContextTest {
        It "Should be pass" {
            $true | Should be $true
        }

        It "Should run CodeCov1" {
            $true | Should be $true
        }
    }
}