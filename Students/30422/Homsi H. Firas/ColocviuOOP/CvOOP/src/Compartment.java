import java.util.*;

public class Compartment {

	SortedSet<String> CompsName = new TreeSet<>();
	SortedSet<Integer> randomComps = new TreeSet<>();
	SortedSet<Passenger> personSet = new TreeSet<>();
	SortedSet<CargoItem> cargoSet = new TreeSet<>();

	public SortedSet<Passenger> passengerCompartment = new TreeSet<>(new myPassengerComparator());
	public SortedSet<CargoItem> CargoCompartment = new TreeSet<>(new myCargoComparator());

	public final int ticketPrice = 100;
	public static int totalProfit;
	public int compartmentProfit;
	public String name;
	
	public Compartment(String name){
		this.name = name;
	}
	
	
	public void addPerson(Passenger passenger) {

		passengerCompartment.add(passenger);
		this.compartmentProfit = this.compartmentProfit + ticketPrice;

	}
	
	public void addCargo(CargoItem cargoItem) {

		CargoCompartment.add(cargoItem);
		this.compartmentProfit = this.compartmentProfit + cargoItem.getProfit();
	}
	

	public void createCompsName() {

		CompsName.add(UUID.randomUUID().toString());
	}
	
	public String getCompsName(){
		
		//return CompsName; //nu merge nici daca bag Compartment compartment
		return null;
	}

	public void createNrOfComps() {
		randomComps.add(Math.abs(new Random().nextInt(100)));
	}

	public void getNrOfComps() {
		System.out.println(randomComps);
	}
}


class myCargoComparator implements Comparator<CargoItem> {

	@Override
	public int compare(CargoItem o1, CargoItem o2) {
		
		return o1.getCargoName().compareTo(o2.getCargoName());
	}
}

class myPassengerComparator implements Comparator<Passenger> {

	@Override
	public int compare(Passenger p1, Passenger p2) {
		
		return p1.getPassengerName().compareTo(p2.getPassengerName());
	}
}

