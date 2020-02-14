Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-7-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-7-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
From: Stephen Boyd <swboyd@chromium.org>
Date: Thu, 13 Feb 2020 18:41:08 -0800
Message-ID: <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-02-10 16:50:57)
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/re=
moteproc_core.c
> index 097f33e4f1f3..8b6932027d36 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum=
 rproc_crash_type type)
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
> =20
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long =
event,
> +                              void *ptr)
> +{
> +       unsigned int longest =3D 0;
> +       struct rproc *rproc;
> +       unsigned int d;
> +       int locked;
> +
> +       locked =3D mutex_trylock(&rproc_list_mutex);
> +       if (!locked) {
> +               pr_err("Failed to acquire rproc list lock, won't call pan=
ic functions\n");
> +               return NOTIFY_DONE;
> +       }
> +
> +       list_for_each_entry(rproc, &rproc_list, node) {
> +               if (!rproc->ops->panic || rproc->state !=3D RPROC_RUNNING)
> +                       continue;
> +
> +               d =3D rproc->ops->panic(rproc);
> +               if (d > longest)
> +                       longest =3D d;

Could be

	d =3D max(longest, d);

> +       }
> +
> +       mutex_unlock(&rproc_list_mutex);
> +
> +       /* Delay panic for the longest requested duration */
> +       mdelay(longest);

Is this to flush caches? Maybe indicate that in the comment.

> +
> +       return NOTIFY_DONE;
> +}
> +
> +static void __init rproc_init_panic(void)
> +{
> +       rproc_panic_nb.notifier_call =3D rproc_panic_handler;
> +       atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic=
_nb);

This is an atomic notifier, but the notifier function takes a mutex,
which sleeps. It should use spinlocks, and never sleep, given that panic
can be called from anywhere.

> +}
> +
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..14f05f26cbcd 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -369,6 +369,8 @@ enum rsc_handling_status {
>   *                     expects to find it
>   * @sanity_check:      sanity check the fw image
>   * @get_boot_addr:     get boot address to entry point specified in firm=
ware
> + * @panic:     optional callback to react to system panic, core will del=
ay
> + *             panic at least the returned number of milliseconds
>   */
>  struct rproc_ops {
>         int (*start)(struct rproc *rproc);
> @@ -383,6 +385,7 @@ struct rproc_ops {
>         int (*load)(struct rproc *rproc, const struct firmware *fw);
>         int (*sanity_check)(struct rproc *rproc, const struct firmware *f=
w);
>         u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *=
fw);
> +       unsigned int (*panic)(struct rproc *rproc);

Maybe should be unsigned long to match other "timeouts" in the kernel.
