import java.util.*;
public class Plane {
	
	private String NAME;
	private int NrOfComps;
	private int PROFIT;
	
	private int NrOfCompartments = 0;
	private int planeType;
	private int TICKET_PRICE=100;
	private static int planeProfit=0;
	private static String planeName;
	
//	Compartment compartment = new Compartment();
	

	Set<Compartment> Compartment = new LinkedHashSet<>();
	Set<String> PlaneName = new LinkedHashSet<>();
	
	public SortedSet<Compartment> passengerCompartment = new TreeSet<>(new myComparator());
	public SortedSet<Compartment> cargoItemComps = new TreeSet<>(new myComparator());
	
	
//	Compartments.add(Math.abs(new Random().nextInt(100)));
	
	public Plane(String name, int nrOfComps, int profit){
		
		this.NAME = name;
		this.NrOfComps = nrOfComps;
		this.PROFIT = profit;
	}
	
	public void addPassengerComps(Compartment compartment){
		
		passengerCompartment.add(compartment);
		this.NrOfCompartments += 1;
	    this.planeProfit =this.planeProfit +100;
	}
	
	public String getPlaneName(){
		
		return this.NAME;
	}
	
	public int getPlaneProfit(){
		
		return this.PROFIT;
	}
	
	public int getNrOfComps(int NrOfComps){
		
		return this.NrOfComps;
	}
	
}

class myComparator implements Comparator<Compartment> {

	@Override
	public int compare(Compartment comp1, Compartment comp2) {
		
		return comp1.getCompsName().compareTo(comp2.getCompsName());
	}

	
	}
