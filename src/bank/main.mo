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

  public query func checkBalance() : async Float {
    return currentValue;
  };

  /* TopUp(); */

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
