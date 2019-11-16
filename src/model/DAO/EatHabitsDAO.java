package model.DAO;


import model.entities_beans.EatHabits;

public interface EatHabitsDAO {

     boolean create(EatHabits food);

    public void getAll();

    public void update( );

    public void delete();
}
