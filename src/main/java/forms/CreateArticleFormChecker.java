/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package forms;

import dao.ArticleDao;
import entities.Article;
import entities.Person;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Elisa Bothy
 */
public class CreateArticleFormChecker extends FormChecker<Article> {
    private final int MIN_SUBJECT_LENGTH = 3;
    private final int MAX_SUBJECT_LENGTH = 25;
    private final int MIN_CONTENT_LENGTH = 10;
    private final int MAX_CONTENT_LENGTH = 500;
    private final String SUBJECT_FIELD = "subject";
    private final String CONTENT_FIELD = "content";
    ArticleDao adao;

    public CreateArticleFormChecker(HttpServletRequest request) {
        super(request);
        this.adao = new ArticleDao();
    }

    @Override
    public Article checkForm() {
       Article obj = new Article();
        //hydrater le bean avec les données du formulaire
        String subject = getParameter(SUBJECT_FIELD);
        String content = getParameter(CONTENT_FIELD);
        obj.setContent(content);
        obj.setSubject(subject);
        //vérifier données du formulaire
        if(subject.trim().length() < MIN_SUBJECT_LENGTH){
            setError("subject", "Ce champ doit faire au moins " + MIN_SUBJECT_LENGTH + " charatères");
        }
        if(content.trim().length() < MIN_CONTENT_LENGTH){
            setError("content", "Ce champ doit faire au moins " + MIN_CONTENT_LENGTH + " charatères");
        }
        if(subject.trim().length() > MAX_SUBJECT_LENGTH){
            setError("subject", "Ce champ doit faire maximum " + MAX_SUBJECT_LENGTH + " charatères");
        }
        if(content.trim().length() > MAX_CONTENT_LENGTH){
            setError("content", "Ce champ doit faire maximum " + MAX_CONTENT_LENGTH + " charatères");
        }
        //si formulaire acceptable => vérifier couple login pwd
        if (errors.isEmpty()){
            Article read = adao.readContent(content);
            if (read != null) {
                setError("content", "Veuillez créer un nouvel article, pas un qui existe déjà");
            }else{
                HttpSession session = request.getSession();
                obj.setCreated(Timestamp.valueOf(LocalDateTime.now()));
                obj.setAuthor((Person)session.getAttribute("user"));
                adao.create(obj);
                Article a = adao.readContent(content);
                obj.setId(a.getId());
                setMessage("newArticle", "Vous avez bien créer un nouvel article !");
            }
        }
        //associer les messages d'erreurs et le bean à la requête
        request.setAttribute("errors", errors);
        request.setAttribute("messages", messages);
        request.setAttribute("article", obj);
        
        return obj;
    }
}
