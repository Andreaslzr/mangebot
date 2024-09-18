import { Part } from "./Parts";

export class ItemCart {
    head: Part = new Part();
    leftArm: Part = new Part();
    rightArm: Part = new Part();
    base: Part = new Part();
    torso: Part = new Part();
}

export class Cart {
    robots: Array<ItemCart> = [];
    cost: number = 0.0;
}

