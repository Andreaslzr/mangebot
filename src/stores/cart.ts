import { defineStore } from "pinia";
import { ItemCart, Cart } from "@/models/Cart";

export const useCart = defineStore("robot-cart",{
    state: (): Cart => ({
        robots: [],
        cost: 0.0,
    }),
    persist: true,
    actions: {},
    getters: {}
})