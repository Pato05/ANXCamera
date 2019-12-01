package com.miui.filtersdk.filter.helper;

import com.miui.filtersdk.filter.helper.FilterFactory;

public enum FilterType {
    A1_DOC(FilterFactory.FilterScene.AI),
    A2_FLOWER(FilterFactory.FilterScene.AI),
    A3_FOOD(FilterFactory.FilterScene.AI),
    A4_PPT(FilterFactory.FilterScene.AI),
    A5_SKY(FilterFactory.FilterScene.AI),
    A6_SUNRISE_SUNSET(FilterFactory.FilterScene.AI),
    A7_CAT(FilterFactory.FilterScene.AI),
    A8_DOG(FilterFactory.FilterScene.AI),
    A9_GREEN_PLANTS(FilterFactory.FilterScene.AI),
    A10_NIGHT(FilterFactory.FilterScene.AI),
    A11_SNOW(FilterFactory.FilterScene.AI),
    A12_SEA(FilterFactory.FilterScene.AI),
    A13_AUTUMN(FilterFactory.FilterScene.AI),
    A14_CANDLELIGHT(FilterFactory.FilterScene.AI),
    A15_CAR(FilterFactory.FilterScene.AI),
    A16_GRASS(FilterFactory.FilterScene.AI),
    A17_MAPLE_LEAVES(FilterFactory.FilterScene.AI),
    A18_SUCCULENT(FilterFactory.FilterScene.AI),
    A19_BUILDING(FilterFactory.FilterScene.AI),
    A20_CITY(FilterFactory.FilterScene.AI),
    A21_CLOUD(FilterFactory.FilterScene.AI),
    A22_OVERCAST(FilterFactory.FilterScene.AI),
    A23_BACKLIGHT(FilterFactory.FilterScene.AI),
    A24_SILHOUETTE(FilterFactory.FilterScene.AI),
    A25_HUMAN(FilterFactory.FilterScene.AI),
    A26_JEWELRY(FilterFactory.FilterScene.AI),
    A27_BUDDHA(FilterFactory.FilterScene.AI),
    A28_COW(FilterFactory.FilterScene.AI),
    A29_CURRY(FilterFactory.FilterScene.AI),
    A30_MOTORBIKE(FilterFactory.FilterScene.AI),
    A31_TEMPLE(FilterFactory.FilterScene.AI),
    A32_BEACH(FilterFactory.FilterScene.AI),
    A33_DRIVING(FilterFactory.FilterScene.AI),
    L_NATURE(FilterFactory.FilterScene.LIGHTING),
    L_STAGE(FilterFactory.FilterScene.LIGHTING),
    L_MOVIE(FilterFactory.FilterScene.LIGHTING),
    L_RAINBOW(FilterFactory.FilterScene.LIGHTING),
    L_SHUTTER(FilterFactory.FilterScene.LIGHTING),
    L_DOT(FilterFactory.FilterScene.LIGHTING),
    L_LEAF(FilterFactory.FilterScene.LIGHTING),
    L_HOLI(FilterFactory.FilterScene.LIGHTING),
    N_BERRY(FilterFactory.FilterScene.NORMAL),
    N_COOKIE(FilterFactory.FilterScene.NORMAL),
    N_DELICACY(FilterFactory.FilterScene.NORMAL),
    N_FADE(FilterFactory.FilterScene.NORMAL),
    N_FILM(FilterFactory.FilterScene.NORMAL),
    N_KOIZORA(FilterFactory.FilterScene.NORMAL),
    N_LATTE(FilterFactory.FilterScene.NORMAL),
    N_LIGHT(FilterFactory.FilterScene.NORMAL),
    N_LIVELY(FilterFactory.FilterScene.NORMAL),
    N_QUIET(FilterFactory.FilterScene.NORMAL),
    N_SODA(FilterFactory.FilterScene.NORMAL),
    N_WARM(FilterFactory.FilterScene.NORMAL),
    B_FAIRYTALE(FilterFactory.FilterScene.BEAUTY),
    B_JAPANESE(FilterFactory.FilterScene.BEAUTY),
    B_MINT(FilterFactory.FilterScene.BEAUTY),
    B_MOOD(FilterFactory.FilterScene.BEAUTY),
    B_NATURE(FilterFactory.FilterScene.BEAUTY),
    B_PINK(FilterFactory.FilterScene.BEAUTY),
    B_ROMANCE(FilterFactory.FilterScene.BEAUTY),
    B_MAZE(FilterFactory.FilterScene.BEAUTY),
    B_WHITEANDBLACK(FilterFactory.FilterScene.BEAUTY),
    B_M_TEA(FilterFactory.FilterScene.BEAUTY),
    B_M_LILT(FilterFactory.FilterScene.BEAUTY),
    B_M_SEPIA(FilterFactory.FilterScene.BEAUTY),
    B_M_WHITEANDBLACK(FilterFactory.FilterScene.BEAUTY),
    B_STORY(FilterFactory.FilterScene.BEAUTY),
    B_RIDDLE(FilterFactory.FilterScene.BEAUTY),
    B_MOVIE(FilterFactory.FilterScene.BEAUTY),
    S_FILM(FilterFactory.FilterScene.STICKER),
    S_YEARS(FilterFactory.FilterScene.STICKER),
    S_POLAROID(FilterFactory.FilterScene.STICKER),
    S_FOREST(FilterFactory.FilterScene.STICKER),
    S_WHITEANDBLACK(FilterFactory.FilterScene.STICKER),
    S_BYGONE(FilterFactory.FilterScene.STICKER),
    N_WHITEANDBLACK(FilterFactory.FilterScene.NORMAL);
    
    public FilterFactory.FilterScene mScene;

    private FilterType(FilterFactory.FilterScene filterScene) {
        this.mScene = filterScene;
    }

    public FilterFactory.FilterScene getFilterScene() {
        return this.mScene;
    }
}