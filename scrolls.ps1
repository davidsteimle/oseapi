# https://oldschoolessentials.necroticgnome.com/srd/index.php/Scrolls_and_Maps

$RandomScrollType = New-GenericList -ListType psobject

$RandomScrollType.Add([pscustomobject]@{
    Basic = 1
    Low = 0
    High = 0
    Scroll = '1 spell'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 2
    Low = 0
    High = 0
    Scroll = '2 spells'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 3
    Low = 0
    High = 0
    Scroll = '3 spells'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = '5 spells'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = '7 spells'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 4
    Low = 0
    High = 0
    Scroll = 'Cursed Scroll'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Protection from Elementals'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 5
    Low = 0
    High = 0
    Scroll = 'Protection from Lycanthropes'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Protection from Magic'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 6
    Low = 0
    High = 0
    Scroll = 'Protection from Undead'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 7
    Low = 0
    High = 0
    Scroll = 'Treasure Map: I'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: II'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: III'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: IV'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: V'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: VI'
})
$RandomScrollType.Add([pscustomobject]@{
    Basic = 8
    Low = 0
    High = 0
    Scroll = 'Treasure Map: VII'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: VIII'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: IX'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: X'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: XI'
})
$RandomScrollType.Add([pscustomobject]@{
    Low = 0
    High = 0
    Scroll = 'Treasure Map: X1I'
})

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
    switch($RomanNumeral){
        'I' {
            ''
            break
        }
        'II' {
            ''
            break
        }
        'III' {
            ''
            break
        }
        'IV' {
            ''
            break
        }
        'V' {
            ''
            break
        }
        'VI' {
            ''
            break
        }
        'VII' {
            ''
            break
        }
        'VIII' {
            ''
            break
        }
        'IX' {
            ''
            break
        }
        'X' {
            ''
            break
        }
        'XI' {
            ''
            break
        }
        'XII' {
            ''
            break
        }
        default{
            ''
        }
    }
}
