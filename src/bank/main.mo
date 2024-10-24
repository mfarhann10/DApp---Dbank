import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  /* currentValue := 300; */

  stable var startTime = Time.now();
  /* startTime := Time.now(); */
  Debug.print(debug_show (startTime));

  let id = 123456;
  /* Debug.print(debug_show (id)); */

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func topUp(ammount : Float) {
    currentValue += ammount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(ammount : Float) {
    let tempValue : Float = currentValue - ammount;
    if (tempValue >= 0) {
      currentValue -= ammount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Your pocket is not enough");
    };

  };

  /* TopUp(); */

  public func Compound() {
    let currentTime = Time.now();
    let timeElapseNS = currentTime - startTime;
    let timeElapseS = timeElapseNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseS));
    startTime := currentTime;
  };
};
