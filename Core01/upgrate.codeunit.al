/// <summary>
/// Codeunit Upgrate (ID 50130).
/// </summary>
codeunit 50130 Upgrate
{
    Subtype = Upgrade;

    local procedure onUpdateAppPerCompany()
    var
        info: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(info);

        if info.DataVersion().Major() = 1 then begin
            UpgrateChicken('1', '001', 'Type 01');
            UpgrateChicken('2', '002', 'Type 02');
            UpgrateChicken('3', '003', 'Type 03');
            exit;
        end;

        Error('The upgrate is not compatible');
    end;

    local procedure UpgrateChicken(oldCode: Code[20]; newcode: code[20]; newdescription: text[50])
    var
        chickenTypes: record ChickenType;
    begin
        if chickenTypes.get(oldCode) then begin
            chickenTypes.Rename(newcode);
            chickenTypes.Description := newdescription;
            chickenTypes.Modify();
        end;
    end;
}