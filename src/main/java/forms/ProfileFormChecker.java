/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package forms;

import dao.PersonDao;
import entities.Person;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Elisa Bothy
 */
public class ProfileFormChecker extends FormChecker<Person>{
    private final int MIN_LOGIN_LENGTH = 3;
    private final int MAX_LOGIN_LENGTH = 25;
    private final String PASSWORDNOW_FIELD = "pwdNow";
    private final String PASSWORDNEW_FIELD = "pwdNew";
    private final String VERIF_FIELD = "pwdNew2";
    PersonDao pdao;

    public ProfileFormChecker(HttpServletRequest request) {
        super(request);
        this.pdao = new PersonDao();
    }
    
    
    @Override
    public Person checkForm() {
        Person obj = new Person();
        //hydrater le bean avec les données du formulaire
        String pwdNow = getParameter(PASSWORDNOW_FIELD);
        String pwdNew = getParameter(PASSWORDNEW_FIELD);
        String pwdNew2 = getParameter(VERIF_FIELD);
        obj.setPassword(pwdNew);
        //vérifier données du formulaire
        HttpSession session = request.getSession();
        Person p = (Person) session.getAttribute("user");
        System.out.println(p.getPassword());
        if(!pwdNow.equals(p.getPassword())){
             setError("now", "Veuillez entrer votre mot de passe actuel");
        }
        if(pwdNow.isEmpty()){
            setError("now", "Ce champ doit être rempli");
        }
        if(pwdNew.trim().length() < MIN_LOGIN_LENGTH){
            setError("newPwd", "Ce champ doit faire au moins " + MIN_LOGIN_LENGTH + " charatères");
        }
        if(pwdNew.trim().length() > MAX_LOGIN_LENGTH){
            setError("newPwd", "Ce champ doit faire minimum " + MAX_LOGIN_LENGTH + " charatères");
        }
        if(!pwdNew.equals(pwdNew2)) {
            setError("newPwd", "Veuillez entrez les même mots de passe dans les champs");
        }
        //si formulaire acceptable => vérifier couple login pwd
        if (errors.isEmpty()){
            pdao.update(obj);
        }
        //associer les messages d'erreurs et le bean à la requête
        request.setAttribute("errors", errors);
        request.setAttribute("bean", obj);
        
        return obj;
    }
    
}
