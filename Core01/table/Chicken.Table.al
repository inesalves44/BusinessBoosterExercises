table 50120 Chicken
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Chicken Type Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Chicken Type Code';
            TableRelation = ChickenType;
            Editable = true;
            trigger onValidate()
            begin
                CalcFields("Chicken Type Description");
            end;
        }
        field(4; "Last Modified Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Last Modified Date';
        }
        field(5; Picture; MediaSet)
        {
            DataClassification = CustomerContent;
            Caption = 'Picture';
        }
        field(6; "Chicken Type Description"; Text[100])
        {
            FieldClass = FlowField;
            Editable = false;
            Caption = 'Chicken Type Description';
            CalcFormula = lookup(ChickenType.Description where(Code = field("Chicken Type Code")));
        }
        field(7; NumberOfEggsProduced; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Number of eggs produced';
            Editable = false;
            CalcFormula = sum(EggProductionLine.Quantity
                                where("Chicken No." = field("No."),
                                        "Egg Production Date" = field(DateFilter),
                                        "Egg type code" = field(EggTypeFilter)));
        }
        field(13; DateFilter; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(14; EggTypeFilter; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = EggType;
            Caption = 'Egg Type Filter';
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description, "Chicken Type Code") { }
        fieldgroup(Brick; Description, Picture) { }
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
    var
        EggproductionLine: Record EggProductionLine;
        ChickenHasEggsErr: Label 'The Chicken %1 %2 has eggs, you can''t detele it.', Comment = '%1 = Chicken No. ; %2 = Chicken Description';
    begin
        Clear(EggproductionLine);

        EggproductionLine.SetRange("Chicken No.", Rec."No.");

        if not EggproductionLine.IsEmpty then
            Error(ChickenHasEggsErr, "No.", Description);
    end;

    trigger OnRename()
    begin

    end;

}