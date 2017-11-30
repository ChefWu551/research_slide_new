package main.com.research.model;

/**
 * Created by lzx on 2017/11/29.
 * 研究报告实体类
 */
public class ResearchPage {


    private String direction;
    private int idValue;
    private String pageBreakString;
    private int readTime;

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public int getIdValue() {
        return idValue;
    }

    public void setIdValue(int idValue) {
        this.idValue = idValue;
    }

    public String getPageBreakString() {
        return pageBreakString;
    }

    public void setPageBreakString(String pageBreakString) {
        this.pageBreakString = pageBreakString;
    }

    public int getReadTime() {
        return readTime;
    }

    public void setReadTime(int readTime) {
        this.readTime = readTime;
    }
}
