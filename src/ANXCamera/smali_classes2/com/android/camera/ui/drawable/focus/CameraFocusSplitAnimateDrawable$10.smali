.class Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CameraFocusSplitAnimateDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable;->start3ALockSuccessAnimation(Lcom/android/camera/ui/drawable/CameraPaintBase;Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable;

.field final synthetic val$circlePaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

.field final synthetic val$indicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable;Lcom/android/camera/ui/drawable/CameraPaintBase;Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable;

    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->val$circlePaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iput-object p3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->val$indicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->val$circlePaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    const v0, 0x3faccccd    # 1.35f

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->val$indicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const v0, 0x3f666666    # 0.9f

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object p1

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object p0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusSplitAnimateDrawable$10;->val$indicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const/16 p1, 0xff

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    return-void
.end method
