.class Lcom/android/camera/fragment/vv/FragmentVVProcess$3;
.super Ljava/lang/Object;
.source "FragmentVVProcess.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/vv/FragmentVVProcess;->showExitConfirm()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/vv/FragmentVVProcess;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/vv/FragmentVVProcess;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/vv/FragmentVVProcess$3;->this$0:Lcom/android/camera/fragment/vv/FragmentVVProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/vv/FragmentVVProcess$3;->this$0:Lcom/android/camera/fragment/vv/FragmentVVProcess;

    invoke-static {p1}, Lcom/android/camera/fragment/vv/FragmentVVProcess;->access$100(Lcom/android/camera/fragment/vv/FragmentVVProcess;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "value_vv_click_finish_exit_confirm"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtils;->trackVVClick(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "value_vv_exit_confirm"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtils;->trackVVClick(Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/vv/FragmentVVProcess$3;->this$0:Lcom/android/camera/fragment/vv/FragmentVVProcess;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/vv/FragmentVVProcess;->quitLiveRecordPreview(Z)V

    iget-object p0, p0, Lcom/android/camera/fragment/vv/FragmentVVProcess$3;->this$0:Lcom/android/camera/fragment/vv/FragmentVVProcess;

    invoke-static {p0}, Lcom/android/camera/fragment/vv/FragmentVVProcess;->access$000(Lcom/android/camera/fragment/vv/FragmentVVProcess;)Z

    return-void
.end method
