package com.ship.bay.entities.carriables;

public class Passenger implements Carriable {

	private final String name;

	public Passenger(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
