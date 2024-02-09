table 50121 ChickenType
{
    DataClassification = ToBeClassified;
    DrillDownPageId = ChickenTypes;
    LookupPageId = ChickenTypes;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Chicken type Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Chicken type Description';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}