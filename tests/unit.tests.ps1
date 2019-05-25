Describe DescribeTest {
    Context ContextTest {
        It "Should be pass" {
            $true | Should be $true
        }

        It "Should be fail" {
            $true | Should be $false
        }
    }
}