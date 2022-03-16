using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MMS.web.Migrations
{
    public partial class up : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Devicetype",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "IsNotification",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "LastLogin",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "Latitude",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "RegionID",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "SocialId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "SocialType",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "isFirstTimeLogin",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "isSocial",
                table: "AspNetUsers");

            migrationBuilder.RenameColumn(
                name: "Longitude",
                table: "AspNetUsers",
                newName: "AccountID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "AccountID",
                table: "AspNetUsers",
                newName: "Longitude");

            migrationBuilder.AddColumn<string>(
                name: "Devicetype",
                table: "AspNetUsers",
                maxLength: 20,
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsNotification",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "LastLogin",
                table: "AspNetUsers",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Latitude",
                table: "AspNetUsers",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "RegionID",
                table: "AspNetUsers",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "SocialId",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SocialType",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "isFirstTimeLogin",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "isSocial",
                table: "AspNetUsers",
                nullable: true);
        }
    }
}
