object MainDataModule: TMainDataModule
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    ConnectionName = 'conciergeapp'
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Normal'
      
        'Database=C:\Users\Laborat'#243'rio\Documents\Embarcadero\Studio\Proje' +
        'cts\ConciergeApp\DataModules\database.s3db')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 128
    Top = 80
  end
  object FDQuery1: TFDQuery
    Left = 264
    Top = 72
  end
end
