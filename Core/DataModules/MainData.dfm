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
    Left = 40
    Top = 16
  end
  object FDQuery1: TFDQuery
    Left = 160
    Top = 16
  end
  object CountriesTable: TFDTable
    Connection = FDConnection1
    TableName = 'Countries'
    Left = 40
    Top = 104
    object CountriesTableId: TAutoIncField
      FieldName = 'Id'
    end
    object CountriesTableName: TStringField
      FieldName = 'Name'
    end
    object CountriesTableCode: TStringField
      FieldName = 'Code'
    end
    object CountriesTableActived: TBooleanField
      FieldName = 'Actived'
    end
  end
  object UsersTable: TFDTable
    Connection = FDConnection1
    TableName = 'Users'
    Left = 40
    Top = 184
    object UsersTableId: TAutoIncField
      FieldName = 'Id'
    end
    object UsersTableUsername: TStringField
      FieldName = 'Username'
    end
    object UsersTablePassword: TStringField
      FieldName = 'Password'
    end
    object UsersTableEmail: TStringField
      FieldName = 'Email'
    end
    object UsersTableTelephone: TStringField
      FieldName = 'Telephone'
    end
    object UsersTableCreated_At: TDateTimeField
      FieldName = 'Created_At'
    end
    object UsersTableUpdated_At: TDateTimeField
      FieldName = 'Updated_At'
    end
  end
  object ZonesTable: TFDTable
    Connection = FDConnection1
    TableName = 'Zones'
    Left = 152
    Top = 104
    object AutoIncField1: TAutoIncField
      FieldName = 'Id'
    end
    object StringField1: TStringField
      FieldName = 'Name'
    end
    object StringField2: TStringField
      FieldName = 'Code'
    end
    object ZonesTableCountryId: TReferenceField
      FieldName = 'CountryId'
    end
    object ZonesTableActived: TBooleanField
      FieldName = 'Actived'
    end
  end
  object AddressesTable: TFDTable
    Connection = FDConnection1
    TableName = 'Addresses'
    Left = 256
    Top = 104
    object AddressesTableId: TAutoIncField
      FieldName = 'Id'
    end
    object AddressesTableStreet1: TStringField
      FieldName = 'Street1'
    end
    object AddressesTableStreet2: TStringField
      FieldName = 'Street2'
    end
  end
end
