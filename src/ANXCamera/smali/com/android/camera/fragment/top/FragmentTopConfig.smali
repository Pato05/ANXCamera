.class public Lcom/android/camera/fragment/top/FragmentTopConfig;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopConfig.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;
.implements Lcom/android/camera/protocol/ModeProtocol$TopAlert;


# static fields
.field private static final EXPAND_STATE_CENTER:I = 0x2

.field private static final EXPAND_STATE_LEFT:I = 0x0

.field private static final EXPAND_STATE_LEFT_FROM_SIBLING:I = 0x1

.field private static final EXPAND_STATE_RIGHT:I = 0x4

.field private static final EXPAND_STATE_RIGHT_FROM_SIBLING:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FragmentTopConfig"

.field public static final TIP_HINT_DURATION_2S:I = 0x7d0

.field public static final TIP_HINT_DURATION_3S:I = 0xbb8


# instance fields
.field private mAiSceneResources:[I

.field private mAutoZoomResources:[I

.field private mConfigViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentAiSceneLevel:I

.field private mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

.field private mDisplayRectTopMargin:I

.field private mExpandView:Landroid/support/v7/widget/RecyclerView;

.field private mFilterResources:[I

.field private mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

.field private mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

.field private mIsRTL:Z

.field private mIsShowExtraMenu:Z

.field private mIsShowTopLyingDirectHint:Z

.field private mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

.field private mLightingResource:[I

.field private mLiveMusicSelectResources:[I

.field private mLiveShotAnimator:Landroid/animation/ObjectAnimator;

.field private mLiveShotResource:[I

.field private mMacroResources:[I

.field private mMiMovieResources:[I

.field private mMimojiCreateLayout:Landroid/view/View;

.field private mSuperEISResources:[I

.field private mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

.field private mTopConfigMenu:Landroid/view/View;

.field private mTopDrawableWidth:I

.field private mTopExtraParent:Landroid/view/ViewGroup;

.field private mTotalWidth:I

.field private mUltraPixelPhotographyIconResources:[I

.field private mUltraPixelPhotographyTipResources:[I

.field private mUltraPixelPhotographyTipString:[Ljava/lang/String;

.field private mUltraPixelPortraitResources:[I

.field private mUltraWideBokehResources:[I

.field private mUltraWideResource:[I

.field private mVideoBokehResource:[I

.field private mVideoRecordingStarted:Z

.field private mViewPadding:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private alertHDR(IZZZ)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    if-eqz p4, :cond_3

    if-nez p1, :cond_2

    if-eqz p3, :cond_3

    const/16 p3, 0xc2

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    :cond_1
    goto :goto_0

    :cond_2
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 p4, 0x1

    invoke-virtual {p3, p4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    :cond_3
    :goto_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertHDR(IZ)V

    return-void
.end method

.method private alertTopMusicHint(ILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMusicTip(ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method private expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/android/camera/fragment/top/ExpandAdapter;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/fragment/top/ExpandAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;)V

    nop

    const/16 v2, 0xd6

    if-ne p3, v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d017a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    mul-int/2addr v2, p1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0022

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    mul-int/2addr v2, p1

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v3, 0x7f0d0017

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    const/4 v3, 0x3

    mul-int/2addr p1, v3

    nop

    nop

    nop

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v5, 0x800003

    if-ne v4, v5, :cond_2

    move v4, v1

    goto :goto_1

    :cond_2
    nop

    move v4, v0

    :goto_1
    if-eqz v4, :cond_3

    nop

    move v1, v0

    goto :goto_2

    :cond_3
    nop

    :goto_2
    iget-boolean v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v5, :cond_4

    rsub-int/lit8 v1, v1, 0x4

    :cond_4
    packed-switch v1, :pswitch_data_0

    move p1, v0

    move v1, p1

    move v3, v1

    goto :goto_4

    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/2addr p1, v3

    sub-int v3, v1, v2

    goto :goto_4

    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    sub-int v3, v1, v2

    goto :goto_4

    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    sub-int v3, v1, v2

    goto :goto_4

    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    nop

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    goto :goto_3

    :pswitch_4
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    nop

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v1

    sub-int p1, v1, p1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    nop

    :goto_3
    move v3, v1

    move v1, v0

    :goto_4
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    iput-object v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v6

    iput v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput p1, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-virtual {v5, p3, v6}, Lcom/android/camera/fragment/top/LastAnimationComponent;->hideOtherViews(ILjava/util/List;)V

    if-nez v4, :cond_5

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput-object p2, p3, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    sub-int/2addr v1, p2

    invoke-virtual {p3, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->translateAnchorView(I)V

    :cond_5
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz p2, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    sub-int v0, p2, v2

    nop

    :cond_6
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    sub-int/2addr p1, v0

    sub-int/2addr v3, v0

    invoke-virtual {p2, p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->showExtraView(II)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f0001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    if-ltz p1, :cond_0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-object p1
.end method

.method private getAiSceneResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020134
        0x7f020135
    .end array-data
.end method

.method private getAutoZoomResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020095
        0x7f020096
    .end array-data
.end method

.method private getFilterResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02014a
        0x7f02014b
    .end array-data
.end method

.method private getFocusPeakImageResource()I
    .locals 3
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_peak_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    const-string/jumbo v1, "zh"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    const v0, 0x7f02013c

    return v0

    :cond_0
    const v0, 0x7f02013f

    return v0

    :cond_1
    if-eqz v0, :cond_2

    const v0, 0x7f02013e

    return v0

    :cond_2
    const v0, 0x7f02013d

    return v0
.end method

.method private getInitialMargin(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;)I
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigsSize()I

    move-result v0

    :goto_0
    if-gtz v0, :cond_1

    return v1

    :cond_1
    iget v2, p1, Lcom/android/camera/data/data/config/TopConfigItem;->index:I

    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v4, 0x1

    const v5, 0x800003

    const v6, 0x800005

    packed-switch v0, :pswitch_data_0

    if-nez v2, :cond_7

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return v1

    :pswitch_0
    if-nez v2, :cond_3

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    iget v5, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_1
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_3

    :cond_3
    if-ne v2, v4, :cond_5

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    iget v6, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_2
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    :cond_5
    :goto_3
    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return v1

    :pswitch_1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_6

    goto :goto_4

    :cond_6
    iget v6, p1, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_4
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return v1

    :cond_7
    sub-int/2addr v0, v4

    if-ne v2, v0, :cond_8

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return v1

    :cond_8
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    div-int/2addr p1, v0

    mul-int/2addr p1, v2

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr p1, p2

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getLightingResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02014c
        0x7f02014d
    .end array-data
.end method

.method private getLiveShotResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020130
        0x7f020131
    .end array-data
.end method

.method private getMacroResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200c0
        0x7f0200c1
    .end array-data
.end method

.method private getMiMovieResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200c4
        0x7f0200c5
    .end array-data
.end method

.method private getMoreResources()I
    .locals 1

    const v0, 0x7f02014e

    return v0
.end method

.method private getMusicSelectResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02010b
        0x7f02010e
    .end array-data
.end method

.method private getPortraitResources()I
    .locals 1

    const v0, 0x7f02014f

    return v0
.end method

.method private getSettingResources()I
    .locals 1

    const v0, 0x7f020147

    return v0
.end method

.method private getSuperEISResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200d6
        0x7f0200d7
    .end array-data
.end method

.method private getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is not added yet"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    return-object v0
.end method

.method private getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const/16 v1, 0xf5

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    return-object v0
.end method

.method private getUltraPixelPortraitResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200df
        0x7f0200e0
    .end array-data
.end method

.method private getUltraWideBokehResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02017a
        0x7f02017b
    .end array-data
.end method

.method private getUltraWideResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020199
        0x7f02019a
    .end array-data
.end method

.method private getVideoBokehResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02014f
        0x7f020150
    .end array-data
.end method

.method private initTopView()V
    .locals 12

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v1, 0x7f0e00ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v2, 0x7f0e00ee

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v3, 0x7f0e00ef

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v4, 0x7f0e00f0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v5, 0x7f0e00f1

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v6, 0x7f0e00f2

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v7, 0x7f0e00f3

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v8, 0x7f0e00f4

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v9, 0x7f0e00f5

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0e00f6

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    iget-object v10, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v11, 0x7f0e00f7

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v6, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v7, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v8, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v9, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v10, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    iget-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static synthetic lambda$reInitAlert$0(Lcom/android/camera/fragment/top/FragmentTopConfig;Lcom/android/camera/fragment/top/FragmentTopAlert;Z)V
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigCommonTip()V

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfFlash(Z)V

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfHdr(Z)V

    invoke-virtual {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateMusicHint()V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertUpdateValue(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateLyingDirectHint(ZZ)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xc1

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;

    if-eqz p1, :cond_0

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;->reShowMoon()V

    nop

    :cond_0
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa4

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckVideoUltraClearTip()V

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckParameterResetTip(Z)V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckRaw()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMacroMode()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckSubtitleMode()V

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private reConfigCommonTip()V
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHandGestureOpen()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getHandGestureRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f090294

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelOn()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentUltraPixel()Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(ILjava/lang/String;)V

    :cond_1
    const-string v0, "-1"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const v0, 0x7f090220

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPortraitFrontOn()Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f090391

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    :cond_3
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSuperEISEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_4

    const v0, 0x7f090397

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    :cond_4
    return-void
.end method

.method private reConfigTipOfFlash(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_4

    const-string v1, "101"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "2"

    invoke-virtual {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(ILjava/lang/String;ZZ)V

    goto :goto_1

    :cond_2
    const-string v1, "5"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "5"

    invoke-virtual {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(ILjava/lang/String;ZZ)V

    goto :goto_1

    :cond_3
    const/16 v0, 0x8

    const-string v1, "1"

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(ILjava/lang/String;ZZ)V

    goto :goto_1

    :cond_4
    :goto_0
    const-string v0, "1"

    invoke-virtual {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(ILjava/lang/String;ZZ)V

    :cond_5
    :goto_1
    return-void
.end method

.method private reConfigTipOfHdr(Z)V
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "live"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    invoke-direct {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    invoke-direct {p0, v0, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-direct {p0, v2, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    :cond_3
    :goto_1
    return-void
.end method

.method private reConfigTipOfSubtitle()V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningSubtitle()Lcom/android/camera/data/data/runing/ComponentRunningSubtitle;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningSubtitle;->isEnabled(I)Z

    move-result v0

    const v1, 0x7f0903c8

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertSubtitleHint(II)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertSubtitleHint(II)V

    :goto_0
    return-void
.end method

.method private resetImages()V
    .locals 11

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v2

    invoke-static {v1, v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(IIZ)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/widget/ImageView;

    const/4 v0, 0x1

    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    const/4 v0, 0x0

    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v10

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v10

    move-object v2, v9

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    move-result v0

    invoke-virtual {v9}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    if-eqz v1, :cond_0

    iget v1, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    iget v2, v10, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v1, v2, :cond_0

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v9}, Landroid/widget/ImageView;->clearAnimation()V

    invoke-virtual {v9, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-static {v9, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {v9}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    :cond_1
    const/4 v0, 0x4

    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private setTopImageResource(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z
    .locals 8

    nop

    nop

    nop

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    iget v1, p1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/16 v2, 0xa7

    const v3, 0x7f0900ee

    const v4, 0x7f09028f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v1, :pswitch_data_0

    packed-switch v1, :pswitch_data_1

    packed-switch v1, :pswitch_data_2

    packed-switch v1, :pswitch_data_3

    packed-switch v1, :pswitch_data_4

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_2d

    :sswitch_0
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMacroResources:[I

    aget p3, p3, v7

    :goto_0
    move v6, p3

    goto :goto_1

    :cond_0
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMacroResources:[I

    aget p3, p3, v6

    goto :goto_0

    :goto_1
    nop

    goto :goto_4

    :sswitch_1
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v7

    :goto_2
    move v6, p3

    goto :goto_3

    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v6

    goto :goto_2

    :goto_3
    nop

    nop

    :goto_4
    move v3, v4

    goto/16 :goto_30

    :sswitch_2
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isMiMovieOpen(I)Z

    move-result p4

    if-eqz p4, :cond_2

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMiMovieResources:[I

    aget p4, p4, v7

    :goto_5
    move v6, p4

    goto :goto_6

    :cond_2
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMiMovieResources:[I

    aget p4, p4, v6

    goto :goto_5

    :goto_6
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->getAiSceneOpen(I)Z

    move-result p3

    if-eqz p3, :cond_3

    const p3, 0x7f0900f2

    :goto_7
    move v3, p3

    goto :goto_8

    :cond_3
    const p3, 0x7f0900f3

    goto :goto_7

    :goto_8
    goto/16 :goto_30

    :sswitch_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object p3

    aget-object p4, p3, v7

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_4

    aget-object p3, p3, v7

    invoke-direct {p0, v6, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopMusicHint(ILjava/lang/String;)V

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    aget p3, p3, v7

    goto/16 :goto_2e

    :cond_4
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    aget p3, p3, v6

    goto/16 :goto_2e

    :sswitch_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result p3

    const-string p4, "FragmentTopConfig"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "setTopImageResource: VIDEO_BOKEH isSwitchOn = "

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p3, :cond_5

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v7

    :goto_9
    move v6, p4

    goto :goto_a

    :cond_5
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v6

    goto :goto_9

    :goto_a
    if-eqz p3, :cond_6

    const p3, 0x7f09021a

    :goto_b
    move v3, p3

    goto :goto_c

    :cond_6
    const p3, 0x7f09021b

    goto :goto_b

    :goto_c
    goto/16 :goto_30

    :sswitch_5
    const/16 p4, 0xae

    if-eq p3, p4, :cond_7

    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p3, v5}, Lcom/android/camera/CameraSettings;->isFaceBeautyOn(ILcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result p3

    goto :goto_d

    :cond_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveBeautyOpen()Z

    move-result p3

    nop

    :goto_d
    if-eqz p3, :cond_8

    const p3, 0x7f02009b

    :goto_e
    move v6, p3

    goto :goto_f

    :cond_8
    const p3, 0x7f02009a

    goto :goto_e

    :goto_f
    const v3, 0x7f090100

    goto/16 :goto_30

    :sswitch_6
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getSettingResources()I

    move-result v6

    const v3, 0x7f0900f7

    goto/16 :goto_30

    :sswitch_7
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSubtitleEnabled(I)Z

    move-result p3

    if-eqz p3, :cond_9

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v7

    :goto_10
    move v6, p3

    goto :goto_11

    :cond_9
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v6

    goto :goto_10

    :goto_11
    const v3, 0x7f0903c8

    if-nez p5, :cond_21

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfSubtitle()V

    goto/16 :goto_30

    :sswitch_8
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTopConfigEntryRes(I)I

    move-result v6

    nop

    goto/16 :goto_30

    :sswitch_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelOn()Z

    move-result p3

    if-eqz p3, :cond_a

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyIconResources:[I

    aget p4, p4, v7

    goto :goto_12

    :cond_a
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyIconResources:[I

    aget p4, p4, v6

    :goto_12
    if-eqz p3, :cond_b

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyTipString:[Ljava/lang/String;

    aget-object p3, p3, v7

    goto :goto_13

    :cond_b
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyTipString:[Ljava/lang/String;

    aget-object p3, p3, v6

    :goto_13
    nop

    move v3, v6

    move v6, p4

    goto/16 :goto_31

    :pswitch_0
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSuperEISEnabled(I)Z

    move-result p3

    if-eqz p3, :cond_c

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSuperEISResources:[I

    aget p3, p3, v7

    :goto_14
    move v6, p3

    goto :goto_15

    :cond_c
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSuperEISResources:[I

    aget p3, p3, v6

    goto :goto_14

    :goto_15
    const v3, 0x7f090397

    goto/16 :goto_30

    :pswitch_1
    const p3, 0x7f020097

    goto/16 :goto_2e

    :pswitch_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p3

    const/16 p4, 0xa0

    invoke-virtual {p3, p4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p3

    check-cast p3, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    if-eqz p3, :cond_d

    const p4, 0x7f0e002a

    invoke-interface {p3, p4}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p3

    const p4, 0xfff3

    if-ne p3, p4, :cond_d

    const p3, 0x7f0200e3

    goto/16 :goto_2e

    :cond_d
    const p3, 0x7f0200e2

    goto/16 :goto_2e

    :pswitch_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPortraitFrontOn()Z

    move-result p3

    if-eqz p3, :cond_e

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPortraitResources:[I

    aget p3, p3, v7

    :goto_16
    move v6, p3

    goto :goto_17

    :cond_e
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPortraitResources:[I

    aget p3, p3, v6

    goto :goto_16

    :goto_17
    const v3, 0x7f090391

    goto/16 :goto_30

    :pswitch_4
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigMeter()Lcom/android/camera/data/data/config/ComponentConfigMeter;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigMeter;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_1f

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigMeter;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v6

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigMeter;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    goto/16 :goto_30

    :pswitch_5
    if-eqz p5, :cond_f

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p4

    const-string p5, "pref_ultra_wide_bokeh_enabled"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    invoke-interface {p4, p3, p5, v0}, Lcom/android/camera/data/backup/DataBackUp;->getBackupSwitchState(ILjava/lang/String;I)Z

    move-result p3

    goto :goto_18

    :cond_f
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p3

    const-string p4, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {p3, p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p3

    :goto_18
    if-eqz p3, :cond_10

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v7

    :goto_19
    move v6, p4

    goto :goto_1a

    :cond_10
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v6

    goto :goto_19

    :goto_1a
    if-eqz p3, :cond_11

    const p3, 0x7f090261

    :goto_1b
    move v3, p3

    goto :goto_1c

    :cond_11
    const p3, 0x7f090262

    goto :goto_1b

    :goto_1c
    goto/16 :goto_30

    :pswitch_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p3

    if-eqz p3, :cond_12

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v7

    :goto_1d
    move v6, p4

    goto :goto_1e

    :cond_12
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v6

    goto :goto_1d

    :goto_1e
    if-eqz p3, :cond_13

    const p3, 0x7f090254

    :goto_1f
    move v3, p3

    goto :goto_20

    :cond_13
    const p3, 0x7f090255

    goto :goto_1f

    :goto_20
    goto/16 :goto_30

    :pswitch_7
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_1f

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v6

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    goto/16 :goto_30

    :pswitch_8
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getImageResource()I

    move-result v6

    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getContentDesc()I

    move-result v3

    goto/16 :goto_30

    :pswitch_9
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->isSwitchOn(I)Z

    move-result p3

    if-eqz p3, :cond_14

    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v7

    goto :goto_21

    :cond_14
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v6

    :goto_21
    if-eqz v0, :cond_20

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p4

    if-eqz p4, :cond_15

    const v3, 0x7f090110

    goto/16 :goto_2f

    :cond_15
    const v3, 0x7f09010f

    goto/16 :goto_2f

    :pswitch_a
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->getAiSceneOpen(I)Z

    move-result p4

    if-eqz p4, :cond_16

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p4, p4, v7

    :goto_22
    move v6, p4

    goto :goto_23

    :cond_16
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p4, p4, v6

    goto :goto_22

    :goto_23
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->getAiSceneOpen(I)Z

    move-result p3

    if-eqz p3, :cond_17

    const p3, 0x7f0900f4

    :goto_24
    move v3, p3

    goto :goto_25

    :cond_17
    const p3, 0x7f0900f5

    goto :goto_24

    :goto_25
    goto/16 :goto_30

    :pswitch_b
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    const-string p4, "on"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_18

    const p4, 0x7f020157

    :goto_26
    move v6, p4

    goto :goto_27

    :cond_18
    const p4, 0x7f020156

    goto :goto_26

    :goto_27
    const-string p4, "on"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_19

    const p3, 0x7f0900f1

    :goto_28
    move v3, p3

    goto :goto_29

    :cond_19
    const p3, 0x7f0900f0

    goto :goto_28

    :goto_29
    goto/16 :goto_30

    :pswitch_c
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v6

    const v3, 0x7f0900f9

    goto/16 :goto_30

    :pswitch_d
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMoreResources()I

    move-result v6

    const v3, 0x7f0900f6

    goto/16 :goto_30

    :pswitch_e
    if-eqz p5, :cond_1a

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p5

    invoke-interface {p4, p3, p5}, Lcom/android/camera/data/backup/DataBackUp;->getBackupFilter(II)Ljava/lang/String;

    move-result-object p3

    goto :goto_2a

    :cond_1a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    :goto_2a
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    sget p4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p3, p4, :cond_1c

    if-gtz p3, :cond_1b

    goto :goto_2b

    :cond_1b
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v7

    goto :goto_2c

    :cond_1c
    :goto_2b
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v6

    :goto_2c
    if-eqz v0, :cond_20

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p4

    if-eqz p4, :cond_1d

    const v3, 0x7f0900ef

    goto :goto_2f

    :cond_1d
    goto :goto_2f

    :pswitch_f
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getPortraitResources()I

    move-result v6

    const v3, 0x7f0900f8

    goto :goto_30

    :pswitch_10
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v6

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    if-nez p5, :cond_21

    invoke-direct {p0, v7}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfHdr(Z)V

    goto :goto_30

    :pswitch_11
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v6

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    if-nez p5, :cond_1e

    invoke-direct {p0, v7}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfFlash(Z)V

    goto :goto_30

    :cond_1e
    if-eqz p5, :cond_21

    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-ne p3, v2, :cond_21

    invoke-direct {p0, v7}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfFlash(Z)V

    goto :goto_30

    :cond_1f
    :goto_2d
    move-object p3, v5

    move v3, v6

    goto :goto_31

    :pswitch_12
    const p3, 0x7f020139

    nop

    :cond_20
    :goto_2e
    move v3, v6

    :goto_2f
    move v6, p3

    :cond_21
    :goto_30
    move-object p3, v5

    :goto_31
    if-lez v6, :cond_29

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-virtual {p4, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getInitialMargin(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;)I

    move-result p5

    iput p5, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    iget p5, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    if-lez p5, :cond_23

    nop

    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr v1, v4

    sub-int/2addr v0, v1

    iput v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v0, :cond_22

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    iget v1, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    sub-int/2addr v0, v1

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    goto :goto_32

    :cond_22
    iget v0, p1, Lcom/android/camera/data/data/config/TopConfigItem;->margin:I

    iput v0, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    :goto_32
    invoke-virtual {p2, p5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_23
    iget p5, p1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/16 v0, 0xb1

    if-ne p5, v0, :cond_24

    invoke-virtual {p2, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_33

    :cond_24
    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_33
    iget p1, p1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/16 p4, 0xc1

    if-ne p1, p4, :cond_26

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-ne p1, v2, :cond_25

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFlashSupportedInManualMode()Z

    move-result p1

    if-nez p1, :cond_25

    const p1, 0x3ecccccd    # 0.4f

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_34

    :cond_25
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    :cond_26
    :goto_34
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-nez p1, :cond_27

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result p1

    if-eqz p1, :cond_29

    :cond_27
    if-lez v3, :cond_28

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_35

    :cond_28
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_29

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_29
    :goto_35
    return v7

    :pswitch_13
    return v6

    nop

    nop

    :pswitch_data_0
    .packed-switch 0xb0
        :pswitch_13
        :pswitch_12
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xc7
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0xcb
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0xd6
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0xd1 -> :sswitch_9
        0xd4 -> :sswitch_8
        0xdc -> :sswitch_7
        0xe1 -> :sswitch_6
        0xef -> :sswitch_5
        0xf3 -> :sswitch_4
        0xf5 -> :sswitch_3
        0xfb -> :sswitch_2
        0xfd -> :sswitch_1
        0xff -> :sswitch_0
    .end sparse-switch
.end method

.method private showMenu()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->hideSwitchHint()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->hideAlert()V

    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->setDegree(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0e00f9

    invoke-static {v0, v3, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    return-void
.end method


# virtual methods
.method public alertAiDetectTipHint(IIJ)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertRecommendTipHint(IIJ)V

    return-void
.end method

.method public alertAiSceneSelector(I)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reConfigQrCodeTip()Z

    :cond_1
    return-void
.end method

.method public alertFlash(ILjava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(ILjava/lang/String;ZZ)V

    return-void
.end method

.method public alertFlash(ILjava/lang/String;ZZ)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    if-eqz p4, :cond_3

    if-nez p1, :cond_2

    if-eqz p3, :cond_3

    const/16 p3, 0xc1

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    :cond_1
    goto :goto_0

    :cond_2
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 p4, 0x1

    invoke-virtual {p3, p4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    :cond_3
    :goto_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertFlash(ILjava/lang/String;)V

    return-void
.end method

.method public alertHDR(IZZ)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    return-void
.end method

.method public alertLightingHint(I)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingHint(I)V

    return-void
.end method

.method public alertLightingTitle(Z)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingTitle(Z)V

    return-void
.end method

.method public alertMimojiFaceDetect(ZI)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMimojiFaceDetect(ZI)V

    return-void
.end method

.method public alertMoonModeSelector(IZ)V
    .locals 4

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09025a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090263

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMoonSelector(Ljava/lang/String;Ljava/lang/String;IZ)V

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v0, 0xa3

    if-ne p2, v0, :cond_2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xc3

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz p2, :cond_2

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_2
    return-void
.end method

.method public alertMusicClose(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMusicClose(Z)V

    :cond_0
    return-void
.end method

.method public alertParameterResetTip(ZII)V
    .locals 6
    .param p3    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_1

    :cond_2
    :goto_0
    nop

    move v1, v2

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d012b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    add-int/2addr v4, v3

    xor-int/lit8 v5, v1, 0x1

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertParameterResetTip(ZIIIZ)V

    return-void
.end method

.method public alertSubtitleHint(II)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSubtitleHint(II)V

    return-void
.end method

.method public alertSwitchHint(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(II)V

    return-void
.end method

.method public alertSwitchHint(ILjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(ILjava/lang/String;)V

    return-void
.end method

.method public alertTopHint(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(II)V

    return-void
.end method

.method public alertTopHint(IIJ)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(IIJ)V

    return-void
.end method

.method public alertTopHint(ILjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(ILjava/lang/String;)V

    return-void
.end method

.method public alertUpdateValue(I)V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertUpdateValue(I)V

    return-void
.end method

.method public alertVideoUltraClear(II)V
    .locals 6
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_1

    :cond_2
    :goto_0
    nop

    move v1, v2

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d012b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    add-int/2addr v3, v4

    xor-int/2addr v1, v2

    invoke-virtual {v0, p1, p2, v3, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertVideoUltraClear(IIIZ)V

    return-void
.end method

.method public clearAlertStatus()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clearAlertStatus()V

    return-void
.end method

.method public clearVideoUltraClear()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clearVideoUltraClear()V

    return-void
.end method

.method public directHideLyingDirectHint()V
    .locals 0

    return-void
.end method

.method public varargs disableMenuItem(Z[I)V
    .locals 4

    if-eqz p2, :cond_1

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget v2, p2, v1

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    if-eqz p1, :cond_0

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public varargs enableMenuItem(Z[I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget v2, p2, v1

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseBooleanArray;->delete(I)V

    if-eqz p1, :cond_1

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public getAlertIsShow()Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v0

    return v0
.end method

.method public getCurrentAiSceneLevel()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xf4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040040

    return v0
.end method

.method public getTopImage(I)Landroid/widget/ImageView;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/TopConfigItem;

    if-eqz v2, :cond_0

    iget v2, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public hideAlert()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    return-void
.end method

.method public hideConfigMenu()V
    .locals 2

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public hideExtraMenu()V
    .locals 1

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    return-void
.end method

.method public hideSwitchHint()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->hideSwitchHint()V

    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMiMovieResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMiMovieResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAutoZoomResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideResource:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    invoke-static {}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;->getUltraPixelTopMenuResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyIconResources:[I

    invoke-static {}, Lcom/android/camera/data/data/config/ComponentRunningUltraPixel;->getUltraPixelSwitchTipsString()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyTipString:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLiveShotResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLightingResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getVideoBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFilterResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMusicSelectResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMacroResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mMacroResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraPixelPortraitResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPortraitResources:[I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getSuperEISResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSuperEISResources:[I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    new-instance v0, Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/LastAnimationComponent;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    new-instance v0, Landroid/util/SparseBooleanArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    const v0, 0x7f0e00f9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    const v0, 0x7f0e00ec

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    sget-boolean v1, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v1, :cond_0

    sget v1, Lcom/android/camera/Util;->sStatusBarHeight:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d018d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    :goto_0
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->initTopView()V

    const v0, 0x7f0e00f8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    new-instance p1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "top_config_expand_view"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0d0017

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f020139

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    sget p1, Lcom/android/camera/Util;->sWindowWidth:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/Util;->startScreenSlideAlphaInAnimation(Landroid/view/View;)V

    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;I)V

    return-void
.end method

.method public insertConfigItem(I)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    return-void
.end method

.method public varargs isContainAlertRecommendTip([I)Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isContainAlertRecommendTip([I)Z

    move-result p1

    return p1
.end method

.method public isCurrentRecommendTipText(I)Z
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isCurrentRecommendTipText(I)Z

    move-result p1

    return p1
.end method

.method public isExtraMenuShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isShowBacklightSelector()Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShowBacklightSelector()Z

    move-result v0

    return v0
.end method

.method public isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z
    .locals 0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public needViewClear()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMutexConfigs(I)V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckFocusPeakConfig()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckUltraPixel()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckUltraPixelPortrait()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckLiveShot()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckHandGesture()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckVideoUltraClearTip()V

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckParameterResetTip(Z)V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckRaw()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMacroMode()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckSubtitleMode()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckFrontBokenTip()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckBeauty()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckEyeLight()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckSuperEIS()V

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMiMovie()V

    :cond_0
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mResetType:I

    const/4 v0, 0x7

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    if-nez p1, :cond_1

    new-instance p1, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setDegree(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const p2, 0x7f0e00fa

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p2, v0, v1}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    return-void
.end method

.method public onBackEvent(I)Z
    .locals 6

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p1, v1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v4

    if-eqz v4, :cond_4

    const/16 v5, 0xc8

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const/16 v4, 0xf5

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :pswitch_1
    nop

    move v3, v0

    goto :goto_1

    :pswitch_2
    invoke-virtual {v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    nop

    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :pswitch_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    if-nez v0, :cond_2

    return v3

    :cond_2
    invoke-virtual {v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    nop

    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    nop

    :goto_1
    if-eq p1, v1, :cond_3

    const/4 v0, 0x7

    if-eq p1, v0, :cond_3

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reInitAlert(Z)V

    :cond_3
    iput-boolean v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    return v2

    :cond_4
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    const-string v0, "FragmentTopConfig"

    const-string/jumbo v1, "top config onclick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa1

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-eqz v2, :cond_2

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v2

    if-eqz v2, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/TopConfigItem;

    if-nez v2, :cond_4

    return-void

    :cond_4
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    invoke-virtual {v4}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    if-lez v4, :cond_5

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    iget v5, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-virtual {v4, v5}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v4

    if-ltz v4, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xe3

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v4

    check-cast v4, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;

    iget v5, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    packed-switch v5, :pswitch_data_0

    packed-switch v5, :pswitch_data_1

    packed-switch v5, :pswitch_data_2

    packed-switch v5, :pswitch_data_3

    sparse-switch v5, :sswitch_data_0

    goto/16 :goto_2

    :sswitch_0
    const/16 p1, 0xff

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_1
    const/16 p1, 0xfd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_2
    const/16 p1, 0xfb

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    if-eqz v4, :cond_b

    const/16 p1, 0xa9

    invoke-interface {v4, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    goto/16 :goto_2

    :sswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->getFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveMusicClick()V

    if-nez p1, :cond_b

    new-instance p1, Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-direct {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;-><init>()V

    const/4 v0, 0x2

    const v1, 0x7f0b0008

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    sget-object v1, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    goto/16 :goto_2

    :sswitch_4
    const/16 p1, 0xf3

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_5
    const/16 p1, 0xef

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_6
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showSetting()V

    goto/16 :goto_2

    :sswitch_7
    const/16 p1, 0xdc

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_8
    const/16 p1, 0xd4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :sswitch_9
    const/16 p1, 0xd1

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_0
    const/16 p1, 0xda

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_1
    const/16 p1, 0xd9

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_2
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackVVIconClick()V

    const/16 p1, 0xd8

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_3
    const/16 p1, 0xd7

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_4
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackMeterClick()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigMeter()Lcom/android/camera/data/data/config/ComponentConfigMeter;

    move-result-object v0

    iget v1, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    goto/16 :goto_2

    :pswitch_5
    const/16 p1, 0xcf

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_6
    const/16 p1, 0xce

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    if-eqz v4, :cond_b

    const/16 p1, 0xa3

    invoke-interface {v4, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    goto/16 :goto_2

    :pswitch_7
    const/16 p1, 0xcd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_8
    const/16 p1, 0xcc

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_9
    const/16 p1, 0xcb

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_a
    const/16 p1, 0xc9

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    if-eqz v4, :cond_b

    const/16 p1, 0xa6

    invoke-interface {v4, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    goto/16 :goto_2

    :pswitch_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->toggle(I)V

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v2, v1}, Lcom/android/camera/statistic/CameraStatUtil;->tarckBokenChanged(ILjava/lang/String;)V

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/16 v4, 0xc8

    const/4 v5, 0x0

    aput v4, v3, v5

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {p1, v3, v1}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHdrIfBokehChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    new-array p1, v2, [I

    const/16 v2, 0xc2

    aput v2, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    :cond_6
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configBokeh(Ljava/lang/String;)V

    goto/16 :goto_2

    :pswitch_c
    const/16 v1, 0xc7

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    check-cast p1, Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2

    :pswitch_d
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->showMenu()V

    if-eqz v4, :cond_b

    invoke-interface {v4, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    goto/16 :goto_2

    :pswitch_e
    const/16 p1, 0xc4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_f
    const/16 p1, 0xc3

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_2

    :pswitch_10
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    iget v1, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    if-eqz v4, :cond_b

    const/16 p1, 0xa2

    invoke-interface {v4, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    goto :goto_2

    :pswitch_11
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->disableUpdate()Z

    move-result v1

    if-nez v1, :cond_9

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v5, 0xab

    if-ne v1, v5, :cond_8

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->ie()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_8

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "0"

    if-ne p1, v1, :cond_7

    const-string v1, "5"

    goto :goto_0

    :cond_7
    const-string v1, "0"

    :goto_0
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    invoke-virtual {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onExpandValueChange(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_8
    iget v1, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    goto :goto_1

    :cond_9
    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getDisableReasonString()I

    move-result p1

    if-eqz p1, :cond_a

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    :cond_a
    const-string p1, "FragmentTopConfig"

    const-string v0, "ignore click flash for disable update"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    if-eqz v4, :cond_b

    invoke-interface {v4, v3}, Lcom/android/camera/protocol/ModeProtocol$CameraClickObservable;->subscribe(I)V

    :cond_b
    :goto_2
    return-void

    nop

    nop

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc7
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xcb
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0xd6
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0xd1 -> :sswitch_9
        0xd4 -> :sswitch_8
        0xdc -> :sswitch_7
        0xe1 -> :sswitch_6
        0xef -> :sswitch_5
        0xf3 -> :sswitch_4
        0xf5 -> :sswitch_3
        0xfb -> :sswitch_2
        0xfd -> :sswitch_1
        0xff -> :sswitch_0
    .end sparse-switch
.end method

.method public onExpandValueChange(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v2

    const/16 v3, 0xc1

    const/16 v4, 0xc2

    const v5, 0x7f090063

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v2, v5, :cond_6

    const p2, 0x7f090113

    if-eq v2, p2, :cond_5

    const p1, 0x7f09013d

    if-eq v2, p1, :cond_2

    goto/16 :goto_0

    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackHdrChanged(ILjava/lang/String;)V

    new-array p1, v7, [I

    aput v4, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    const-string p1, "e"

    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreMutexFlash(Ljava/lang/String;)V

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigFlashIfHdrChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    new-array p1, v7, [I

    aput v3, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    :cond_3
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigBokehIfHdrChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    new-array p1, v7, [I

    const/16 p2, 0xc8

    aput p2, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    :cond_4
    invoke-interface {v1, p3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configHdr(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/ComponentData;->getKey(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    new-array p1, v7, [I

    const/16 p2, 0xd6

    aput p2, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    invoke-interface {v1, p3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configMeter(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result p1

    if-ne p1, v5, :cond_8

    const-string p1, "5"

    if-eq p2, p1, :cond_7

    const-string p1, "5"

    if-ne p3, p1, :cond_8

    :cond_7
    const-string p1, "0"

    if-eq p3, p1, :cond_8

    const-string p1, "200"

    if-eq p3, p1, :cond_8

    const-string p1, "0"

    iget p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p2, p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackFlashChanged(ILjava/lang/String;)V

    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configBackSoftLightSwitch(Ljava/lang/String;)V

    :cond_8
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackFlashChanged(ILjava/lang/String;)V

    new-array p1, v7, [I

    aput v3, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHhrIfFlashChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    new-array p1, v7, [I

    aput v4, p1, v6

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    :cond_9
    invoke-interface {v1, p3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configFlash(Ljava/lang/String;)V

    nop

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p3, v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    nop

    move v4, v2

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v5

    iget v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v7, 0xb1

    if-ne v6, v7, :cond_2

    invoke-virtual {v5}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v5

    if-eqz v5, :cond_2

    if-eq p3, v1, :cond_2

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideAnimateElement(ILjava/util/List;I)V

    :cond_1
    return-void

    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isInModeChanging()Z

    move-result v5

    if-nez v5, :cond_3

    if-ne p3, v1, :cond_4

    :cond_3
    iput-boolean v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowTopLyingDirectHint:Z

    :cond_4
    nop

    const/16 v1, 0xa9

    if-eq v0, v1, :cond_6

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const/16 v1, 0xa1

    if-ne p1, v1, :cond_5

    nop

    move v1, v2

    goto :goto_2

    :cond_5
    :goto_1
    move v1, v3

    goto :goto_2

    :cond_6
    :pswitch_1
    const/16 v5, 0xa2

    if-eq p1, v5, :cond_7

    if-eq p1, v1, :cond_7

    move v1, v3

    goto :goto_2

    :cond_7
    nop

    move v1, v2

    :goto_2
    const/4 v5, 0x7

    if-eqz v1, :cond_9

    if-ne p3, v5, :cond_8

    nop

    move v1, v5

    goto :goto_3

    :cond_8
    const/4 v1, 0x4

    :goto_3
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    goto :goto_4

    :cond_9
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->refreshExtraMenu()V

    :cond_a
    :goto_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result v1

    if-eqz v1, :cond_b

    if-ne p3, v5, :cond_b

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->provideAnimateElement(ILjava/util/List;I)V

    :cond_b
    if-eqz v4, :cond_d

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiPreview()Z

    move-result v1

    if-nez v1, :cond_c

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-virtual {p0, v3, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->enableMenuItem(Z[I)V

    :cond_c
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->clear()V

    :cond_d
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v1

    if-eqz v1, :cond_e

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideAnimateElement(ILjava/util/List;I)V

    :cond_e
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    if-eqz v4, :cond_f

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_f

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_f
    iget v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v5

    invoke-static {v4, v1, v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(IIZ)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    if-nez v1, :cond_10

    return-void

    :cond_10
    move v1, v2

    :goto_5
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_1a

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setEnabled(Z)V

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v5, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v11

    if-eqz p2, :cond_11

    move v10, v3

    goto :goto_6

    :cond_11
    move v10, v2

    :goto_6
    move-object v5, p0

    move-object v6, v11

    move-object v7, v4

    move v8, p1

    move-object v9, p3

    invoke-direct/range {v5 .. v10}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    move-result v5

    if-eqz v5, :cond_12

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    iget v7, v11, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-virtual {v6, v7}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v6

    if-ltz v6, :cond_12

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Landroid/util/SparseBooleanArray;

    iget v7, v11, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-virtual {v6, v7}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_12

    goto/16 :goto_8

    :cond_12
    invoke-virtual {v4}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/camera/data/data/config/TopConfigItem;

    if-eqz v6, :cond_13

    iget v6, v6, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    iget v7, v11, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v6, v7, :cond_13

    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    goto :goto_8

    :cond_13
    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    if-nez p2, :cond_15

    if-eqz v5, :cond_14

    invoke-static {v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_8

    :cond_14
    invoke-static {v4}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_8

    :cond_15
    const/16 v6, 0x96

    if-eqz v5, :cond_17

    new-instance v5, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v5, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    iget v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v7, 0xa7

    if-ne v4, v7, :cond_16

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFlashSupportedInManualMode()Z

    move-result v4

    if-nez v4, :cond_16

    const/16 v4, 0xc1

    iget v7, v11, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v4, v7, :cond_16

    const v4, 0x3ecccccd    # 0.4f

    invoke-virtual {v5, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setTargetAlpha(F)V

    :cond_16
    nop

    invoke-virtual {v5, v6}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    invoke-static {v5}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_17
    const/16 v5, 0xa5

    if-eq v0, v5, :cond_19

    iget v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-ne v7, v5, :cond_18

    goto :goto_7

    :cond_18
    new-instance v5, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v5, v4}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v5, v6}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v4

    invoke-static {v4}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_19
    :goto_7
    invoke-static {v4}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    :goto_8
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_5

    :cond_1a
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :array_0
    .array-data 4
        0xc5
        0xc1
    .end array-data
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->provideRotateItem(Ljava/util/List;I)V

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideRotateItem(Ljava/util/List;I)V

    :cond_1
    return-void
.end method

.method public reInitAlert(Z)V
    .locals 5

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHandGestureOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getHandGestureRunning()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;

    invoke-direct {v2, p0, v0, p1}, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;-><init>(Lcom/android/camera/fragment/top/FragmentTopConfig;Lcom/android/camera/fragment/top/FragmentTopAlert;Z)V

    iget-boolean p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowExtraMenu:Z

    if-eqz p1, :cond_1

    const-wide/16 v3, 0x78

    goto :goto_0

    :cond_1
    const-wide/16 v3, 0x0

    :goto_0
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4, p1}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public refreshExtraMenu()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->reFresh()V

    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public removeConfigItem(I)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    return-void
.end method

.method public removeExtraMenu(I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    return-void
.end method

.method public rotate()V
    .locals 0

    return-void
.end method

.method public setAiSceneImageLevel(I)V
    .locals 1

    nop

    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    const/16 p1, 0x17

    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/16 v0, 0xc9

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    if-eqz p1, :cond_3

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reConfigQrCodeTip()Z

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setClickEnable(Z)V

    :cond_0
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setPendingRecordingState(I)V

    :goto_0
    return-void
.end method

.method public setShow(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    :cond_0
    return-void
.end method

.method public showConfigMenu()V
    .locals 2

    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public startLiveShotAnimation()V
    .locals 3

    const/16 v0, 0xce

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/RotateDrawable;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->getTarget()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_1

    :cond_0
    const-string v1, "level"

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    :cond_3
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x2710
    .end array-data
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public varargs updateConfigItem([I)V
    .locals 9

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    array-length v7, p1

    const/4 v0, 0x0

    move v8, v0

    :goto_0
    if-ge v8, v7, :cond_1

    aget v0, p1, v8

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v5, 0x0

    move-object v0, p0

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(Lcom/android/camera/data/data/config/TopConfigItem;Landroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updateContentDescription()V
    .locals 2

    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f0900ee

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public updateLyingDirectHint(ZZ)V
    .locals 0

    if-nez p2, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowTopLyingDirectHint:Z

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isExtraMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isTopAlertShowing(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z

    move-result p2

    if-nez p2, :cond_2

    return-void

    :cond_2
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsShowTopLyingDirectHint:Z

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateLyingDirectHint(Z)V

    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateRecordingTime(Ljava/lang/String;)V

    :cond_0
    return-void
.end method