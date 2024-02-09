table 50127 EggProductionLine
{
    DataClassification = CustomerContent;
    DrillDownPageId = EggProductionLineList;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; Line; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line';
        }
        field(3; "Chicken No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Chicken no.';
            TableRelation = Chicken;
            trigger OnValidate()
            begin
                CalcFields(ChickenDescription);
            end;
        }
        field(4; ChickenDescription; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Chicken.Description where("No." = field("Chicken No.")));
            Caption = 'Chicken Description';
        }
        field(5; "Egg Production Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Egg Production Date';
        }
        field(6; "Egg type code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Egg Type Code';
            TableRelation = EggType;
            trigger OnValidate()
            begin
                CalcFields("Egg type description");
            end;
        }
        field(7; "Egg type description"; Text[100])
        {
            Caption = 'Egg Type Description';
            FieldClass = FlowField;
            CalcFormula = lookup(EggType.Description
                                    where(Code = field("Egg type code")));
        }
        field(8; Quantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
        }
    }

    keys
    {
        key(Key1; "No.", Line)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

}