/*
 * Copyright 2017 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.appengine.java8;

// [START example]
import java.util.*;

import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreFailureException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;



// With @WebServlet annotation the webapp/WEB-INF/web.xml is no longer required.
@WebServlet(name = "HelloAppEngine", value = "/hello")
@SuppressWarnings("serial")
public class HelloAppEngine extends HttpServlet {

  DatastoreService datastore;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        final Query fromCloud = new Query("D");
        PreparedQuery grilledCloud = datastore.prepare(fromCloud);
        List<Entity> posts = grilledCloud.asList(FetchOptions.Builder.withLimit(5));

      System.out.println("soze "+posts.size());
        String recordOutput = "";
        posts.forEach(
          (result) -> {
        // Grab the key and convert it into a string in preparation for encoding
        String keyString = KeyFactory.keyToString(result.getKey());
        // Encode the entity's key with Base64
        // String encodedID = new String(Base64.getUrlEncoder().encodeToString(String.valueOf(keyString).getBytes()));

        // Build up string with values from the Datastore entity
        // String recordOutput;
        // if(result.getProperty("desc") == null) {
        //   recordOutput = "NULL!!";
        // }
        // else {
          // recordOutput += String.format((String)result.getProperty("desc")) + " ";
        // }

        request.setAttribute("outPut", recordOutput);
    });
        request.getRequestDispatcher("/index.jsp").forward(request, response);

  }

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
        // PrintWriter out = req.getWriter();
        // System.out.println("called");
        String desc = req.getParameter("description");
        Entity post = new Entity("D");
        post.setProperty("desc", desc);

        try {
          datastore.put(post);
        } catch (DatastoreFailureException e) {
          throw new ServletException("Datastore fail", e);
        }
        // redirect to a GET request
	    resp.sendRedirect("/hello");
  }

  @Override
public void init() throws ServletException {

  datastore = DatastoreServiceFactory.getDatastoreService();



}




}
      