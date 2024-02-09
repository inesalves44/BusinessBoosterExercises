page 50123 EggTypes
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EggType;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Egg Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Egg Type Description field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
        area(Creation)
        {
            action(InsertDefaultEggTypes)
            {
                ApplicationArea = All;
                ToolTip = 'Default eggs';
                Image = Add;

                trigger OnAction()
                var
                    EggType: Record EggType;
                    EggTypeNotEmptyErr: Label 'There are already Egg Types in the table.';
                begin
                    if EggType.IsEmpty then begin
                        EggType.InsertEggType('ET - 01', 'Default');
                        EggType.InsertEggType('ET - 02', 'Base');
                        EggType.InsertEggType('ET - 03', 'White');
                    end
                    else
                        Error(EggTypeNotEmptyErr);
                end;
            }
        }
    }

    var
        myInt: Integer;
}