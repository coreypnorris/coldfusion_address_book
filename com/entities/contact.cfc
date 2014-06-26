component persistent="true" output="false" table="contacts" {
  property name="id" column="id" fieldtype="id" generator="increment";
  property name="name" ormtype="text";     
  property name="address" ormtype="text";
  property name="phone" ormtype="text";
  property name="createdDateTime" ormtype="timestamp"; 
  property name="modifiedDateTime" ormtype="timestamp";
}