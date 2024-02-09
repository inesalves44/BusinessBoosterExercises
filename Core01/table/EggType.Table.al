
table 50123 EggType
{
    DataClassification = CustomerContent;
    DrillDownPageId = EggTypes;
    LookupPageId = Eggtypes;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Egg Type Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Egg Type Description';
            DataClassification = CustomerContent;
        }

    }


    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    /// <summary>
    /// InsertEggType.
    /// </summary>
    /// <param name="EggTypeCode">code[20].</param>
    /// <param name="EggTypeDescription">Text[50].</param>
    procedure InsertEggType(EggTypeCode: code[20]; EggTypeDescription: Text[50])
    var
        EggType: Record EggType;
    begin
        Clear(EggType);

        EggType.Code := EggTypeCode;
        EggType.Description := EggTypeDescription;
        EggType.Insert();
    end;

}