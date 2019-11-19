package controller;

import factory.DAOFactory;
import model.DAO.*;
import model.entities_beans.*;
import model.service.ImcCaculation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@WebServlet("/Dashboard")
public class DashboardServlet extends HttpServlet {

    private WeightTodayDAO daoWeight;
    private PressureDAO daoPressure;
    private HydrationDAO daoHydra;
    private GoalsDAO daoGoal;
    private ExercisesDAO daoEx;
    private EatHabitsDAO daoFood;


    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

    public void init() {
        daoWeight = DAOFactory.getWeightTodayDAO();
        daoPressure = DAOFactory.getPressureDAO();
        daoEx = DAOFactory.getExercisesDAO();
        daoFood = DAOFactory.getEatHabitsDAO();
        daoGoal = DAOFactory.getGoalsDAO();
        daoHydra = DAOFactory.getHydraDAO();

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");
            req.setAttribute("uName", loggedUser.getName());

//            Calendar today = (Calendar) session.getAttribute("dateToday");
//            System.out.println("DATA VINDA DO LOGIN É: " + today);
//            System.out.println("Typo: " + today instanceof Object);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Deu merda no DashboardServlet " + e.getMessage());
        }
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Calendar dt;

            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");
            req.setAttribute("uName", loggedUser.getName());

            String dateToday = req.getParameter("dateToday");
//
//            if (dateToday == null) {
//                dt = today;
//            } else {
//                dt = Calendar.getInstance();
//                dt.setTime(sfd.parse(dateToday));
//            }

            dt = Calendar.getInstance();
            dt.setTime(sfd.parse(dateToday));

            System.out.println("CHAMANDO O POST ----- ESTOU AQUI!");

            Long userId = loggedUser.getCpf_id();

            List<WeightToday> weightDB = daoWeight.readWeight(dt, userId);
            System.out.println("Tamanho da lista é: " + weightDB.size());
            for (WeightToday item : weightDB) {
                System.out.println(item.getCode());
            }

            List<Pressure> pressureDB = daoPressure.read(dt, userId);
            System.out.println("Tamanho da lista é: " + pressureDB.size());
            for (Pressure item : pressureDB) {
                System.out.println(item.getCode());
            }

            List<Exercises> exerciseDB = daoEx.read(dt, userId);
            System.out.println("Tamanho da lista é: " + exerciseDB.size());
            for (Exercises item : exerciseDB) {
                System.out.println(item.getCode());
            }


            List<EatHabits> foodDB = daoFood.read(dt, userId);
            System.out.println("Tamanho da lista é: " + foodDB.size());
            for (EatHabits item : foodDB) {
                System.out.println(item.getCode());
            }


            List<Goals> goalDB = daoGoal.readGoals(userId);
            System.out.println("Tamanho da lista é: " + goalDB.size());
            for (Goals item : goalDB) {
                System.out.println(item.getCode());
            }


            List<Hydration> hydraDB = daoHydra.readHydra(dt, userId);
            System.out.println("Tamanho da lista é: " + hydraDB.size());
            for (Hydration item : hydraDB) {
                System.out.println(item.getId());
            }


            //construindo os dados sobre PESO que serão levados para o dashboard.
            boolean scW = buildWeightDashboard(req, loggedUser, weightDB, goalDB);
            System.out.println(scW);

            //construindo os dados sobre Exercicio que serão levados para o dashboard.
            boolean scE = buildExerciseDashboard(req, exerciseDB, goalDB);
            System.out.println(scE);

            //construindo os dados sobre Alimentos Consumidos que serão levados para o dashboard.
            boolean scF = buildEatHabits(req, foodDB, goalDB);
            System.out.println(scF);

            //construindo os dados sobre hidratação que serão levados para o dashboard.
            boolean scH = buildHydra(req, hydraDB, goalDB);
            System.out.println(scH);

            //construindo os dados sobre hidratação que serão levados para o dashboard.
            boolean scPI = buildPresImc(req, pressureDB, loggedUser, goalDB, weightDB);
            System.out.println(scPI);

            if (scE && scF && scH && scPI && scW) {
                System.out.println("TUDO TRUE - DAShBOARD");
                req.setAttribute("sucess", "Dados Encontrados :)");
            } else {
                System.out.println("TUDO FALSE - DAShBOARD");
                req.setAttribute("err", "Não encontrei os dados :(");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Deu merda no DashboardServlet " + e.getMessage());
            req.setAttribute("err", "Não encontrei os dados :(");
        }
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    private boolean buildPresImc(HttpServletRequest req, List<Pressure> pressureDB, User loggedUser, List<Goals> goalDB, List<WeightToday> weightDB) {

        String type = TypeGoals.PESO_IDEAL.toString();

        // recuperando a meta de peso cadastrada.
        double goalWeightBD = 0;
        goalWeightBD = getGoals(goalDB, goalWeightBD, type);

        // essa meta é calculada automaticamente pelo sistema. Param: peso registrado na meta e altura inicial
        double goalImc = ImcCaculation.evaluateImc(goalWeightBD, loggedUser.getInitHeight());

        //esse é o calculo do IMC atual. Param: ultimo peso registrado e altura inicial
        double lastWeightDB = (weightDB.get(weightDB.size() - 1)).getWeightDay();
        double imcCurrent = ImcCaculation.evaluateImc(lastWeightDB, loggedUser.getInitHeight());

        //calculo da pressão sist. mm média
        double mmAvgPressure = 0;
        for (Pressure mmPressure : pressureDB) {
            mmAvgPressure += mmPressure.getSistolica_mm();
        }

        mmAvgPressure = mmAvgPressure / pressureDB.size();

        //calculo da pressão sist. hg média
        double hgAvgPressure = 0;
        for (Pressure hgPressure : pressureDB) {
            hgAvgPressure += hgPressure.getSistolica_hg();
        }
        hgAvgPressure = hgAvgPressure / pressureDB.size();

        PresImcDashboard pimc = new PresImcDashboard(goalImc, imcCurrent, mmAvgPressure, hgAvgPressure);

        req.setAttribute("pImcDash", pimc);

        return true;
    }

    private boolean buildHydra(HttpServletRequest req, List<Hydration> hydraDB, List<Goals> goalDB) {
        String type = TypeGoals.NIVEL_HIDRATACAO.toString();
        int qtdGlassDB = hydraDB.size();

        double gainHydraDB = 0;
        for (Hydration qtd : hydraDB) {
            gainHydraDB += qtd.getQtd();
        }

        double goalHydraDB = 0;
        goalHydraDB = getGoals(goalDB, goalHydraDB, type);

        HydraDashboard hd = new HydraDashboard(goalHydraDB, gainHydraDB, qtdGlassDB);

        req.setAttribute("hydraDash", hd);

        return true;
    }

    private boolean buildEatHabits(HttpServletRequest req, List<EatHabits> foodDB, List<Goals> goalDB) {
        String type = TypeGoals.HABITO_ALIMENTAR.toString();

        double gainCalories = 0;
        for (EatHabits eatHabits : foodDB) {
            gainCalories += eatHabits.getCalories();
        }

        int qtdMainMeal = 0, qtdSnack = 0, qtdCoffeeTea = 0;
        for (EatHabits eatHabits : foodDB) {
            if (eatHabits.getMeal().equals("coffeeBrk") || eatHabits.getMeal().equals("tea")) {
                qtdCoffeeTea += 1;
            } else if (eatHabits.getMeal().equals("snack") || eatHabits.getMeal().equals("ceia")) {
                qtdSnack += 1;
            } else {
                qtdMainMeal += 1;
            }
        }

        double goalFoodsDB = 0;
        goalFoodsDB = getGoals(goalDB, goalFoodsDB, type);


        EatHabitsDashboard ehd = new EatHabitsDashboard(goalFoodsDB, gainCalories, qtdCoffeeTea, qtdSnack, qtdMainMeal);

        req.setAttribute("foodDash", ehd);

        return true;
    }

    private boolean buildExerciseDashboard(HttpServletRequest req, List<Exercises> exerciseDB, List<Goals> goalDB) {
        int qtdExercisesDB = exerciseDB.size();
        String type = TypeGoals.ATIVIDADE_FISICA.toString();

        double lostCalories = 0;
        for (Exercises exercises : exerciseDB) {
            lostCalories += exercises.getCalories();
        }

        //TODO - preciso desenvolver a soma de tempo do calendário.
        double goalExerciseDB = 0;
        goalExerciseDB = getGoals(goalDB, goalExerciseDB, type);

        Calendar timeExercisesDB = null;
        for (Exercises exercises : exerciseDB) {
            System.out.println(exercises.getTime());
        }

//        ExerciseDashboard ed = new ExerciseDashboard(goalExerciseDB, lostCalories, qtdExercisesDB, timeExercisesDB);

//        req.setAttribute("exerciseDash", ed);

        return true;
    }


    private boolean buildWeightDashboard(HttpServletRequest req, User loggedUser, List<WeightToday> weightDB, List<Goals> goalDB) {
        // Recuperando os dados quadrante PESO.
        // recuperando o último peso registrado na lista de pesos que veio do DB
        double lastWeightDB = (weightDB.get(weightDB.size() - 1)).getWeightDay();
        double initWeightDB = loggedUser.getInitWeight();
        double lostWeight = initWeightDB - lastWeightDB;
        String type = TypeGoals.PESO_IDEAL.toString();
        double goalWeightBD = 0;

        goalWeightBD = getGoals(goalDB, goalWeightBD, type);

        WeightDashboard wd = new WeightDashboard(goalWeightBD, lostWeight, lastWeightDB, initWeightDB);

        req.setAttribute("weightDash", wd);

        return true;
    }

    private double getGoals(List<Goals> goalList, double goal, String type) {
        int i = 0;
        while (i < goalList.size()) {

            if (goalList.get(i).getDescptGoal().equals(type)) {
                goal = goalList.get(i).getQtdGoal();
                System.out.println("Tem que imprimir as metas: " + goal);
            }
            i++;
        }
        return goal;
    }
}

