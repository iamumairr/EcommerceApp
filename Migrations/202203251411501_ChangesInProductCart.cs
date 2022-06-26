namespace ECommerceApp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangesInProductCart : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.ProductCarts", "UnitPrice", c => c.Decimal(precision: 18, scale: 2));
            AlterColumn("dbo.ProductCarts", "SubTotal", c => c.Decimal(precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.ProductCarts", "SubTotal", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AlterColumn("dbo.ProductCarts", "UnitPrice", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
    }
}
