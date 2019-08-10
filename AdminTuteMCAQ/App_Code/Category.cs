public class Category
{
    private string categoryID;
    private string shortName;
    private string longName;

	public Category()
	{
	}

    public string CategoryID
    {
        get
        {
            return categoryID;
        }
        set
        {
            categoryID = value;
        }
    }

    public string ShortName
    {
        get
        {
            return shortName;
        }
        set
        {
            shortName = value;
        }
    }

    public string LongName
    {
        get
        {
            return longName;
        }
        set
        {
            longName = value;
        }
    }
}