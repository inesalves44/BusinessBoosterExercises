/// <summary>
/// Codeunit Installation (ID 50120).
/// </summary>
/// 
codeunit 50120 Installation
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        InsertDefaultChickenTypes();
    end;

    local procedure InsertDefaultChickenTypes()
    var
        ChickenType: Record ChickenType;
    begin

        Clear(ChickenType);

        if not ChickenType.IsEmpty() then
            exit;

        InsertChickenTypes('001', 'chiken 1');
        InsertChickenTypes('002', 'chiken 2');
        InsertChickenTypes('003', 'chiken 3');

    end;

    local procedure InsertChickenTypes(ChickenTypeCode: code[20]; ChickenTypeDescription: Text[50])
    var
        ChickenType: Record ChickenType;
    begin
        Clear(ChickenType);
        ChickenType.Code := chickenTypecode;
        chickentype.Description := ChickenTypeDescription;
        ChickenType.Insert();
    end;
}

