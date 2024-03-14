/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author Elisa Bothy
 */
public class Article implements Serializable{
    private Integer id;
    private String subject;
    private String content;
    private Date created;
    private int author;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Article{");
        sb.append("id=").append(id);
        sb.append(", subject=").append(subject);
        sb.append(", content=").append(content);
        sb.append(", created=").append(created);
        sb.append(", author=").append(author);
        sb.append('}');
        return sb.toString();
    }

    public Article() {
    }

    public Article(Integer id, String subject, String content, Date created, int author) {
        this.id = id;
        this.subject = subject;
        this.content = content;
        this.created = created;
        this.author = author;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.id);
        hash = 41 * hash + Objects.hashCode(this.subject);
        hash = 41 * hash + Objects.hashCode(this.content);
        hash = 41 * hash + Objects.hashCode(this.created);
        hash = 41 * hash + this.author;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Article other = (Article) obj;
        if (this.author != other.author) {
            return false;
        }
        if (!Objects.equals(this.subject, other.subject)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return Objects.equals(this.created, other.created);
    }
    
}
