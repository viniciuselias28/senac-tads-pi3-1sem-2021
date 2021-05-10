/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClienteDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell i5
 */
public class ExcluirClienteServelet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cpf = request.getParameter("cpf");
        boolean ok = false;
        try {
            ok = ClienteDao.deletar(cpf);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ExcluirClienteServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setStatus(ok? 200:500);
    }

}