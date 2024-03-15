/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package forms;

import dao.PersonDao;
import entities.Person;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Elisa Bothy
 */
public class SignUpFormChecker extends FormChecker<Person> {
    private final int MIN_LOGIN_LENGTH = 3;
    private final int MAX_LOGIN_LENGTH = 25;
    private final String LOGIN_FIELD = "login";
    private final String PASSWORD_FIELD = "pwd";
    private final String VERIF_FIELD = "pwd2";
    PersonDao pdao;

    public SignUpFormChecker(HttpServletRequest request) {
        super(request);
        this.pdao = new PersonDao();
    }
    
    
    @Override
    public Person checkForm() {
        Person obj = new Person();
        //hydrater le bean avec les données du formulaire
        String login = getParameter(LOGIN_FIELD);
        String pwd = getParameter(PASSWORD_FIELD);
        String pwd2 = getParameter(VERIF_FIELD);
        obj.setLogin(login);
        obj.setPassword(pwd);
        //vérifier données du formulaire
        if(login.trim().length() < MIN_LOGIN_LENGTH){
            setError("login", "Ce champ doit faire au moins " + MIN_LOGIN_LENGTH + " charatères");
        }
        if(pwd.trim().length() < MIN_LOGIN_LENGTH){
            setError("pwd", "Ce champ doit faire au moins " + MIN_LOGIN_LENGTH + " charatères");
        }
        if(login.trim().length() > MAX_LOGIN_LENGTH){
            setError("login", "Ce champ doit faire maximum " + MAX_LOGIN_LENGTH + " charatères");
        }
        if(pwd.trim().length() > MAX_LOGIN_LENGTH){
            setError("pwd", "Ce champ doit faire maximum " + MAX_LOGIN_LENGTH + " charatères");
        }
        if(!pwd.equals(pwd2)) {
            setError("pwd", "Veuillez entrez les même mots de passe dans les champs");
        }
        //si formulaire acceptable => vérifier couple login pwd
        if (errors.isEmpty()){
            Person read = pdao.read(login);
            if (read != null) {
                setError("connectInscription", "Vous allez vous connectez");
            }else{
                pdao.create(obj);
                Person p = pdao.read(login);
                obj.setId(p.getId());
            }
        }
        //associer les messages d'erreurs et le bean à la requête
        request.setAttribute("errors", errors);
        request.setAttribute("bean", obj);
        
        return obj;
    }
    
}
