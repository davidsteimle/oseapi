<#
https://oldschoolessentials.necroticgnome.com/srd/index.php/Scrolls_and_Maps
#>

[cmdletbinding()]
param(
    [switch]$Expert
)

function New-GenericList{
    [cmdletbinding()]
    param(
        [string]$ListType
    )
    New-Object "system.Collections.Generic.List[$ListType]"
}

function Get-RandomScrollType{
    [cmdletbinding()]
    param()
    $RandomScrollType = New-GenericList -ListType psobject

    $RandomScrollType.Add([pscustomobject]@{
        Basic = 1
        Low = 1
        High = 15
        Scroll = '1 spell'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 2
        Low = 16
        High = 25
        Scroll = '2 spells'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 3
        Low = 26
        High = 31
        Scroll = '3 spells'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 32
        High = 34
        Scroll = '5 spells'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 35
        High = 35
        Scroll = '7 spells'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 4
        Low = 36
        High = 40
        Scroll = 'Cursed Scroll'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 41
        High = 50
        Scroll = 'Protection from Elementals'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 5
        Low = 51
        High = 60
        Scroll = 'Protection from Lycanthropes'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 61
        High = 65
        Scroll = 'Protection from Magic'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 6
        Low = 66
        High = 75
        Scroll = 'Protection from Undead'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 7
        Low = 76
        High = 78
        Scroll = 'Treasure Map: I'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 79
        High = 80
        Scroll = 'Treasure Map: II'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 81
        High = 82
        Scroll = 'Treasure Map: III'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 83
        High = 83
        Scroll = 'Treasure Map: IV'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 84
        High = 84
        Scroll = 'Treasure Map: V'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 85
        High = 85
        Scroll = 'Treasure Map: VI'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 86
        High = 86
        Scroll = 'Treasure Map: VII'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Basic = 8
        Low = 87
        High = 90
        Scroll = 'Treasure Map: VIII'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 91
        High = 95
        Scroll = 'Treasure Map: IX'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 96
        High = 96
        Scroll = 'Treasure Map: X'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 97
        High = 98
        Scroll = 'Treasure Map: XI'
    })
    $RandomScrollType.Add([pscustomobject]@{
        Low = 99
        High = 100
        Scroll = 'Treasure Map: X1I'
    })
    $RandomScrollType
}

function Get-RandomScrollSpellLevel{
    [cmdletbinding()]
    param()
    $RandomScrollSpellLevel = New-GenericList -ListType psobject

    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 1
        High = 25
        Arcane = 1
        Divine = 1
    })
    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 26
        High = 50
        Arcane = 2
        Divine = 2
    })
    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 51
        High = 70
        Arcane = 3
        Divine = 3
    })
    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 71
        High = 85
        Arcane = 4
        Divine = 4
    })
    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 86
        High = 95
        Arcane = 5
        Divine = 5
    })
    $RandomScrollSpellLevel.Add([pscustomobject]@{
        Low = 96
        High = 100
        Arcane = 6
        Divine = 5
    })
    $RandomScrollSpellLevel
}

function Get-DieRoll{
    [cmdletbinding()]
    param(
        [int32]$Sides = 6
    )
    1..$Sides | Get-Random
}

function Get-Percentile{
    [cmdletbinding()]
    param()
    $Ones = 0..9 | Get-Random
    Write-Verbose "Ones = $Ones"
    $Tens = (0..9 | Get-Random) * 10
    Write-Verbose "Tens = $Tens"
    $Roll = $Ones + $Tens
    if($Roll -lt 1){ $Roll = 100 }
    Write-Verbose "Roll = $Roll"
    $Roll
}

function Get-SpellType { 
    [cmdletbinding()]
    param()
    @($(@('arcane') * 3), 'divine') | Get-Random 
}

function Get-TreasureMap{
    [cmdletbinding()]
    param(
        [string]$TreasureMapType
    )
    $RomanNumeralTest = $TreasureMapType -match "\s(I|II|III|IV|V|VI|VII|VIII|IX|X|XI|XII)$"
    $RomanNumeral = $Matches[0]
    $RomanNumeral.Trim()
    Write-Verbose $RomanNumeral
    $Description = switch($RomanNumeral){
        'I' {
            '1 magic item'
            break
        }
        'II' {
            '1d6 x 10 gems and 2d10 pieces of jewelry'
            break
        }
        'III' {
            '2 magic items'
            break
        }
        'IV' {
            '3 magic items (no swords)'
            break
        }
        'V' {
            '3 magic items and 1 potion'
            break
        }
        'VI' {
            '3 magic items, 1 scroll, 1 potion'
            break
        }
        'VII' {
            '5d6 gems and 2 magic items'
            break
        }
        'VIII' {
            'hoard worth 1d4 X 1,000gp'
            break
        }
        'IX' {
            'hoard worth 5d6 X 1,000gp'
            break
        }
        'X' {
            'hoard worth 5d6 X 1,000gp and 1 magic item'
            break
        }
        'XI' {
            'hoard worth 5d6 X 1,000gp and 5d6 gems'
            break
        }
        'XII' {
            'hoard worth 6d6 X 1,000gp'
            break
        }
        default{
            ''
        }
    }
    Write-Verbose $Description
    $Description
}






function Get-MyScroll{
    [cmdletbinding()]
    param(
        [string]$Game
    )
    Write-Verbose $Game
    $RandomScrollType = Get-RandomScrollType
    if($Game -eq 'Basic'){
        $RandomScrollType = $RandomScrollType | Where-Object -FilterScript { $null -ne $PSItem.Basic }
        $DieRoll = Get-DieRoll -Sides 8
        $MyScroll = $RandomScrollType | Where-Object -Property Basic -eq $DieRoll
    } else {
        Write-Verbose $Game
        $DieRoll = Get-Percentile
        $MyScroll = $(
            $RandomScrollType | ForEach-Object {
                if(($PSItem.Low -le $DieRoll) -and ($PSItem.High -ge $DieRoll)){
                    $PSItem
                }
            }
        )
    }
    switch($MyScroll){
        {$PSItem.Scroll -match 'spell'} {
            #
            break
        }
        {$PSItem.Scroll -match 'treasure'} {
            $MyScroll | Add-Member -MemberType NoteProperty -Name Decription -Value $(Get-TreasureMap -TreasureMapType $PSItem.Scroll)
            break
        }
    }
    $MyScroll
}
