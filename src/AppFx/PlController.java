/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AppFx;
import java.util.ArrayList;
import java.util.Map;
import java.util.StringTokenizer;
import org.jpl7.*;
/**
 *
 * @author ahmed
 */
public class PlController {
    public static void Finder( ){
        Query q = new Query("consult('Medical Expert System.pl')");
        q.hasSolution();
        q = new Query("start('"+App.P1.getName()+"').");
        Map<String, Term>[] res = q.allSolutions();
        System.out.println(res[0]); 
}
}
