using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;

[DataObject(true)]
public static class CategoryDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<Category> GetCategories()
    {
        List<Category> categoryList = new List<Category>();
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "SELECT CategoryID, ShortName, LongName "
            + "FROM Categories ORDER BY ShortName";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = 
            cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Category category;
        while (dr.Read())
        {
            category = new Category();
            category.CategoryID = dr["CategoryID"].ToString();
            category.ShortName = dr["ShortName"].ToString();
            category.LongName = dr["LongName"].ToString();
            categoryList.Add(category);
        }
        dr.Close();
        return categoryList;
    }

    private static string GetConnectionString()
    {
        return @"Data Source = localhost\sqlexpress; Initial Catalog = Halloween; Integrated Security = True";
        //return ConfigurationManager.ConnectionStrings
        //    ["HalloweenConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertCategory(Category category)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = "INSERT INTO Categories "
            + " (CategoryID, ShortName, LongName) "
            + " VALUES(@CategoryID, @ShortName, @LongName)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("CategoryID", category.CategoryID);
        cmd.Parameters.AddWithValue("ShortName", category.ShortName);
        cmd.Parameters.AddWithValue("LongName", category.LongName);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteCategory(Category category)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string del = "DELETE FROM Categories "
            + "WHERE CategoryID = @CategoryID "
            + "AND ShortName = @ShortName "
            + "AND LongName = @LongName ";
        SqlCommand cmd = new SqlCommand(del, con);
        cmd.Parameters.AddWithValue("CategoryID", category.CategoryID);
        cmd.Parameters.AddWithValue("ShortName", category.ShortName);
        cmd.Parameters.AddWithValue("LongName", category.LongName);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateCategory(Category original_Category,
        Category category)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string up = "UPDATE Categories "
            + "SET ShortName = @ShortName, "
            + "LongName = @LongName "
            + "WHERE CategoryID = @original_CategoryID "
            + "AND ShortName = @original_ShortName "
            + "AND LongName = @original_LongName";
        SqlCommand cmd = new SqlCommand(up, con);
        cmd.Parameters.AddWithValue("ShortName", category.ShortName);
        cmd.Parameters.AddWithValue("LongName", category.LongName);
        cmd.Parameters.AddWithValue("original_CategoryID", 
            original_Category.CategoryID);
        cmd.Parameters.AddWithValue("original_ShortName", 
            original_Category.ShortName);
        cmd.Parameters.AddWithValue("original_LongName", 
            original_Category.LongName);
        con.Open();
        int updateCount = cmd.ExecuteNonQuery();
        con.Close();
        return updateCount;
    }
}