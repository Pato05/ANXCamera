.class Lcom/bumptech/glide/manager/l$a;
.super Ljava/lang/Object;
.source "RequestManagerFragment.java"

# interfaces
.implements Lcom/bumptech/glide/manager/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/manager/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bumptech/glide/manager/l;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/manager/l;)V
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/manager/l$a;->this$0:Lcom/bumptech/glide/manager/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public W()Ljava/util/Set;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/m;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/bumptech/glide/manager/l$a;->this$0:Lcom/bumptech/glide/manager/l;

    invoke-virtual {p0}, Lcom/bumptech/glide/manager/l;->da()Ljava/util/Set;

    move-result-object p0

    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/manager/l;

    invoke-virtual {v1}, Lcom/bumptech/glide/manager/l;->fa()Lcom/bumptech/glide/m;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/bumptech/glide/manager/l;->fa()Lcom/bumptech/glide/m;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{fragment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/bumptech/glide/manager/l$a;->this$0:Lcom/bumptech/glide/manager/l;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
