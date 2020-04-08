Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200403175005.17130-1-elder@linaro.org> <20200403175005.17130-2-elder@linaro.org>
In-Reply-To: <20200403175005.17130-2-elder@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 8 Apr 2020 16:16:45 -0600
Message-ID: <CANLsYkx4pSs+j83ewJpOkQmY7=q=k71xg7N9A=sDWrDZKzzQTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] remoteproc: fix a bug in rproc_alloc()
Content-Type: text/plain; charset="UTF-8"
To: Alex Elder <elder@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Alex,

On Fri, 3 Apr 2020 at 11:50, Alex Elder <elder@linaro.org> wrote:
>
> If ida_simple_get() returns an error when called in rproc_alloc(),
> put_device() is called to clean things up.  By this time the rproc
> device type has been assigned, with rproc_type_release() as the
> release function.
>
> The first thing rproc_type_release() does is call:
>     idr_destroy(&rproc->notifyids);
>
> But at the time the ida_simple_get() call is made, the notifyids
> field in the remoteproc structure has not been initialized.
>
> I'm not actually sure this case causes an observable problem, but
> it's incorrect.  Fix this by initializing the notifyids field before
> calling ida_simple_get() in rproc_alloc().
>

Both Suman and I are meddling in function rproc_alloc() for our
respective work [1][2].  I will add this patch to a set that refactors
rproc_alloc() as soon as v5.7-rc1 comes out.  That way we can all base
our work on the same foundation and Bjorn doesn't have to fix 3
different merge conflicts.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/patch/11456385/
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e12a54e67588..59b6eb22f01c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2054,6 +2054,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>         rproc->dev.class = &rproc_class;
>         rproc->dev.driver_data = rproc;
>
> +       idr_init(&rproc->notifyids);
> +
>         /* Assign a unique device index and name */
>         rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>         if (rproc->index < 0) {
> @@ -2078,8 +2080,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>
>         mutex_init(&rproc->lock);
>
> -       idr_init(&rproc->notifyids);
> -
>         INIT_LIST_HEAD(&rproc->carveouts);
>         INIT_LIST_HEAD(&rproc->mappings);
>         INIT_LIST_HEAD(&rproc->traces);
> --
> 2.20.1
>
