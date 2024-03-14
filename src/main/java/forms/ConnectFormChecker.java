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
public class ConnectFormChecker extends FormChecker<Person> {
    
    PersonDao pdao = new PersonDao();
    
    public ConnectFormChecker(HttpServletRequest request) {
        super(request);
    }

    @Override
    public Person checkForm() {
        Person obj = new Person();
        //hydrater le bean avec les données du formulaire
        String login = getParameter("login");
        String pwd = getParameter("pwd");
        obj.setLogin(login);
        obj.setPassword(pwd);
        //vérifier données du formulaire
        if(login == null || login.trim().length() == 0){
            setError("login", "Ce champ doit être rempli");
        }
        if(pwd == null || pwd.length() == 0){
            setError("pwd", "Ce champ doit être rempli");
        }
        //si formulaire acceptable => vérifier couple login pwd
        if (errors.isEmpty()){
            Person read = pdao.read(login);
            obj.setId(read.getId());
            if (read == null || !pwd.equals(read.getPassword())) {
                setError("connect", "Ces informations ne vous permettent pas de vous connecter");
            }
        }
        //associer les messages d'erreurs et le bean à la requête
        request.setAttribute("errors", errors);
        request.setAttribute("bean", obj);
        
        return obj;
    }
    
}
