#include <iostream>
#include <queue>
#include <random>
#include "VariadicTable.h"
#define EXPECTED_CUSTOMER_COUNT 10
using namespace std;

VariadicTable<int, int, int, int, int> customersInfos({"EnterTime", "ServiceTime", "StartTime", "FinishedTime", "CurrentQueueSize"});
class Customer{
public:
    int timeOfEnteringTheBarberShop;
    int timeOfStartingTheJobByBarber;
    int timeOfFinishingTheJobByBarber;
    int serviceTime;
/**
 * Creates Customer.
 * @param interArrival time of entering the barber shop
 * @param serviceTime
 */
    void setCustomer(int interArrival, int serviceTime){
        this->timeOfEnteringTheBarberShop       = interArrival;
        this->serviceTime                       = serviceTime;
    }
};

class Barber{
public:
    bool idle = true;
    Customer        currentCustomer;
    queue<Customer> queueOfCustomers;
    struct statistics_t{
        int averageWaitingTimeForCustomers      = 0;
        int averageIdleTimeForBarber            = 0;
        int averageQueueLength                  = 0;
    } statistics;
/**
 * Checks if the barber is available to serve. If it is yes, pop customer from the queue.
 * @param customer : first customer in the queue
 * @param newArrival : the recent customer of the barber's shop
 * @return
 */
    bool availableToService(Customer customer, int newArrival) {
        if(idle || queueOfCustomers.size() == 0){
            currentCustomer                                 = customer;
            currentCustomer.timeOfStartingTheJobByBarber    = currentCustomer.timeOfEnteringTheBarberShop;
            currentCustomer.timeOfFinishingTheJobByBarber   = currentCustomer.timeOfStartingTheJobByBarber + currentCustomer.serviceTime;
            queueOfCustomers.pop();
            idle = false;
            customersInfos.addRow(
                    currentCustomer.timeOfEnteringTheBarberShop,
                    currentCustomer.serviceTime,
                    currentCustomer.timeOfStartingTheJobByBarber,
                    currentCustomer.timeOfFinishingTheJobByBarber, 0);
            return idle;
        }
        else if(currentCustomer.timeOfFinishingTheJobByBarber <= newArrival){
            if(customer.timeOfEnteringTheBarberShop > currentCustomer.timeOfFinishingTheJobByBarber){ //barber is idle.
                customer.timeOfStartingTheJobByBarber   = customer.timeOfEnteringTheBarberShop;
                customer.timeOfFinishingTheJobByBarber  = customer.timeOfStartingTheJobByBarber + customer.serviceTime;
                statistics.averageIdleTimeForBarber    += (customer.timeOfEnteringTheBarberShop - currentCustomer.timeOfFinishingTheJobByBarber);
            }
            else{
                customer.timeOfStartingTheJobByBarber       = currentCustomer.timeOfFinishingTheJobByBarber;
                customer.timeOfFinishingTheJobByBarber      = customer.timeOfStartingTheJobByBarber + customer.serviceTime;
                statistics.averageWaitingTimeForCustomers  += (customer.timeOfStartingTheJobByBarber - customer.timeOfEnteringTheBarberShop);
            }
            currentCustomer                             = customer;
            queueOfCustomers.pop();
            statistics.averageQueueLength              += this->queueOfCustomers.size();
            idle = false;
            customersInfos.addRow(
                    currentCustomer.timeOfEnteringTheBarberShop,
                    currentCustomer.serviceTime,
                    currentCustomer.timeOfStartingTheJobByBarber,
                    currentCustomer.timeOfFinishingTheJobByBarber,
                    queueOfCustomers.size());
            return idle;
        }
        return false;
    }
};


int main() {
    random_device rd;
    default_random_engine engine(rd());
    uniform_int_distribution<int> interArrivalTime(5, 25);
    uniform_int_distribution<int> serviceTime(15, 35);
    Barber barber;

    for(int i = 0; i < EXPECTED_CUSTOMER_COUNT; i++){
        Customer customer;
        if(i == 0){
            int interArrival    = interArrivalTime(engine);
            int service      = serviceTime(engine);
            customer.setCustomer(interArrival, service);
            barber.queueOfCustomers.push(customer);
        }
        else{
            int interArrival    = barber.queueOfCustomers.back().timeOfEnteringTheBarberShop + interArrivalTime(engine);
            int service         = serviceTime(engine);
            customer.setCustomer(interArrival, service);
            barber.queueOfCustomers.push(customer);
        }
        barber.availableToService(barber.queueOfCustomers.front(), barber.queueOfCustomers.back().timeOfEnteringTheBarberShop);
    }
    while(!barber.queueOfCustomers.empty()){
        barber.availableToService(barber.queueOfCustomers.front(), barber.currentCustomer.timeOfFinishingTheJobByBarber);
    }

    customersInfos.print(cout);

    VariadicTable<double, double, double> statisticsVt({"AverageIdleTimeForBarber", "AverageWaitingTimeForCustomer", "AverageQueueLength"});
    statisticsVt.addRow((double) barber.statistics.averageIdleTimeForBarber / EXPECTED_CUSTOMER_COUNT,
                        (double) barber.statistics.averageWaitingTimeForCustomers / EXPECTED_CUSTOMER_COUNT,
                        (double) barber.statistics.averageQueueLength / EXPECTED_CUSTOMER_COUNT);
    statisticsVt.print(cout);
    return 0;
}
