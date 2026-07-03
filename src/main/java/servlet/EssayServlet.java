package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

@WebServlet("/submitEssay")
public class EssayServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String essay = request.getParameter("essay");

        if (essay == null || essay.trim().isEmpty()) {
            essay = "";
        }

        int wordCount = essay.isEmpty() ? 0 : essay.split("\\s+").length;

        String grade;

        if (wordCount < 100) {
            grade = "Poor";
        } else if (wordCount < 300) {
            grade = "Average";
        } else {
            grade = "Good";
        }

        double plagiarism = 0.0;

        try {
            Connection con = DBConnection.getConnection();

            // 🔥 PLAGIARISM CHECK
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT content FROM essays");

            int matchWords = 0;
            int totalWords = wordCount;

            while (rs.next()) {
                String oldEssay = rs.getString("content");

                String[] oldWords = oldEssay.split("\\s+");
                String[] newWords = essay.split("\\s+");

                for (String nw : newWords) {
                    for (String ow : oldWords) {
                        if (nw.equalsIgnoreCase(ow)) {
                            matchWords++;
                        }
                    }
                }
            }

            if (totalWords > 0) {
                plagiarism = ((double) matchWords / totalWords) * 100;
            }

            // 🔥 INSERT INTO DATABASE
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO essays(content, word_count, grade, plagiarism) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, essay);
            ps.setInt(2, wordCount);
            ps.setString(3, grade);
            ps.setDouble(4, plagiarism);

            ps.executeUpdate();

            System.out.println("DATA INSERTED SUCCESSFULLY");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 🟢 OUTPUT
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        request.setAttribute("wordCount", wordCount);
        request.setAttribute("grade", grade);
        request.setAttribute("plagiarism", String.format("%.2f", plagiarism));

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}