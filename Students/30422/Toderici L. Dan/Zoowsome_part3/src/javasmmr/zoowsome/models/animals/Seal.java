package javasmmr.zoowsome.models.animals;

import static javasmmr.zoowsome.repositories.AnimalRepository.createNode;

import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLStreamException;

import javasmmr.zoowsome.services.factories.Constants;

public class Seal extends Aquatic {
	public Seal()
	{
		super(6.5,0.25);
		this.setName("Marie");
		this.setNrOfLegs(2);
		this.setAvgSwimDepth(100);
		this.setTypeOfWater(TypesOfWater.freshWater);
	}
	public Seal(String name, int nrOfLegs, int avgSwimDepth,TypesOfWater waterType)
	{
		super(6.5,0.25);
		this.setName(name);
		this.setNrOfLegs(nrOfLegs);
		this.setAvgSwimDepth(avgSwimDepth);
		this.setTypeOfWater(waterType);
	}
	public Seal( int avgSwimDepth,TypesOfWater waterType)
	{
		super(6.5,0.25);
		this.setName("Marie");
		this.setNrOfLegs(2);
		this.setAvgSwimDepth(avgSwimDepth);
		this.setTypeOfWater(waterType);
	}
	
	public void encodeToXml(XMLEventWriter eventWriter) throws XMLStreamException
	{
		super.encodeToXml(eventWriter);
		createNode(eventWriter, Constants.XML_TAGS.DISCRIMINANT, Constants.Animal.Aquatic.Seal);
	}
}
