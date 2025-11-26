Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E3927BF7C
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764189710; cv=none; b=r/lwNll6cXVWZGAAI7MMJPsljVJqTcYNJoogowKXSC5fXaCw4DvHrF3U4TaqZEMIP2DR8vWMu25JwbbCKE4uZjXpQaGczChgt1KNH52pwrs3UKNBH30CmBYxe9DXlrQVjVkG7JvlQzgCFqz0gL7m5cQImRFqGur+N8Qq0oXch74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764189710; c=relaxed/simple;
	bh=8H0cKNrmDCVgQ1a3bsHEQFGorJIHv0RHsJKrrLW+cog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiNwPX1NBq1Yt9FQKnvKQL/uLwUr832ZrKq+4yKEr1RS/Z2qbzJD7wV9qfs/jm26ccjsSHAkbsqgYdW3IOWCbZwdb/rMezWzLBNoTZ/hI/ZiXZlKaziJMKTvMRsxWzbjNVpW7wAfrgyCqbISoisKQoJFGIj9Zukj7W2lLJCiGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlOUbCb5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlOUbCb5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7277324204so35412166b.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 12:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764189707; x=1764794507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1mYElcXjEzrBV3TIm1cQlZ9o7RXWmlMefXxWX2NA2oA=;
        b=AlOUbCb5kMjzOJzamvWjfhLkB1PsJMmAu5AdOw2O6GO+Oys2iUn21NHfo/N/JqMJNU
         uo2mJgj0FgQ+x1Z40KVDRoDGQcEUMe5VMeHq1g+qD1OcWgBc+lCd9vzEPaG1g/FQcBHI
         /KKWaAaNVshn80BCWoXzqxqYyJ9PwcpsFNA+lxL9PJEtZwe8F+UdAc+nN40Z/cR7UGyC
         PDYvUiW9hvw83K6WM54nEJKxgP5QQPUsNEhUCbU1PJ8LfojPyRQje1FbTcJD+O7s8OR2
         ncu2fGUmdhYjDya/7AhPcf2INbX3c2qF5nzF+nYgQ3M9s7UNnQIss8dAIdBOsGvOutda
         PdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764189707; x=1764794507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mYElcXjEzrBV3TIm1cQlZ9o7RXWmlMefXxWX2NA2oA=;
        b=nLyrHVom4AQyovR+duemqvpG0B8EQBEf88qfuSOdjUHbeFrDqGCISgHs13vfBHU2XK
         r0Rrv5upHMnCFQ86s3QK3+dRnEksXYqxbsLlZuaP4FBwUKFS8q9uz0buezmlau7v1rWF
         FZ9OznpkT0H+1/3CF8I47Ol/YavW9lzg1cHCmggzFnwDkLsCE1oRWV3GGgPxXpHdKGJd
         xxXK9XDOEGZclPhejC1YEKiOQ8jDfYz3+1KV401DWEJS/cG1AbgnH7iT6ziEczewe3FY
         /79PrhiyH/c7mNL++i5fcjrsRYelo1Iu3lN7HV4RNw07EnE2XnE7RhUVKIIJyOknmRAA
         mwjw==
X-Forwarded-Encrypted: i=1; AJvYcCWs1L906dQLyR7prF97eJ/pFGvNkWlF6SbL1bazSla6ZH+iwljw5TdZUY/JmMdjC5PIPaOlZM3gzGUznsyzxqS1@vger.kernel.org
X-Gm-Message-State: AOJu0YxdEkrCPIvyk5X6s2J7G9M8s82c8JJhxyoRcmWrlTX6auF6ZiIg
	wpESp/T1wknK2ozffblJGpeaqwEla1xZhHfdUpHZbMF7xqIvv2sowIlsSTLiey+0NkwN3/LJtOr
	0zI49IH+ztuYLiNvM3c/AOSnUpJ2dOhQ=
X-Gm-Gg: ASbGnctAg6iGFAF6YcW8pblko3mZU+5iVYrSmJ4HIhXyAhDLVDr4wC8mJQXvZyXc0xg
	qIEuSWMGfj4t+ZBZ0omAJzv9JdfbsWScdE7wC9WxjvVdOHZ0KQ1biF0rEUqJFJQiti26Qn6epH+
	QYOpcR7NmSArXGaMHyqSHLAR0wzv0UMV37uI2ULl6LJxmJmq1hWNwhGYzJx2rsHuaSAQohgbeak
	8VjB4JF7eNkYchjm5q8hf554yZxVMSm1qk4Z+sjVmvCMbTnF3iOp8RygqELUJIKsYTReqb+WdK4
	UF0vYccbuuqeVH3NLKCDRWpx0vWtBgihX5EzkAwmmCoOW8iANN+elvVY
X-Google-Smtp-Source: AGHT+IEHtN04jULOXCSbSKTymQOarkBtW6l4G8JuIeF7VOqHoPBG1dDcxx7DwrbTKSL0RVLT20ASdYq8XWm1u93v1bU=
X-Received: by 2002:a17:907:7ba1:b0:b73:870f:fa37 with SMTP id
 a640c23a62f3a-b76c53c0113mr902981266b.17.1764189706818; Wed, 26 Nov 2025
 12:41:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125083746.2605721-1-b-padhi@ti.com>
In-Reply-To: <20251125083746.2605721-1-b-padhi@ti.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Thu, 27 Nov 2025 07:41:35 +1100
X-Gm-Features: AWmQ_blPQwvMusSVxakvxFx06d_vIN0tuRp6yg7DVXZ64FfYqxyBScA3gyPHKns
Message-ID: <CAEg67G=VWsupb53B=a5cyF2RbN58Bqfy8OJ+vpK3_dzCQnvd+Q@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	richard.genoud@bootlin.com, afd@ti.com, hnagalla@ti.com, jm@ti.com, 
	u-kumar1@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 19:39, Beleswar Padhi <b-padhi@ti.com> wrote:
>
> From: Richard Genoud <richard.genoud@bootlin.com>
>
> Introduce software IPC handshake between the host running Linux and the
> remote processors to gracefully stop/reset the remote core.
>
> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
> message to the remotecore.
> The remote core is expected to:
> - relinquish all the resources acquired through Device Manager (DM)
> - disable its interrupts
> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
> - enter WFI state.

What happens if the remote core is unable to action the shutdown
request (maybe it has crashed).

Is there a way to cleanup resources which the remote core allocated
without rebooting the whole system?

Patrick

>
> Meanwhile, the K3 remoteproc driver does:
> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
> - wait for the remoteproc to enter WFI state
> - reset the remote core through device manager
>
> Based on work from: Hari Nagalla <hnagalla@ti.com>
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> [b-padhi@ti.com: Extend support to all rprocs]
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
> entered WFI state.
> 3. Convert return type of is_core_in_wfi() to bool. Works better with
> readx_poll_timeout() condition.
> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
> when void* is 64 bit.
> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
> function.
> 6. Updated commit message to fix minor typos and such.
>
> Link to v1:
> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
>
> Testing done:
> 1. Tested Boot across all TI K3 EVM/SK boards.
> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
> 4. Tested R5 rprocs can now be shutdown and powered back on
> from userspace.
> 3. Tested that each patch in the series generates no new
> warnings/errors.
>
>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
>  drivers/remoteproc/ti_k3_common.h         |  4 ++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
>  6 files changed, 93 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index 828e13256c023..c008f11fa2a43 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -42,6 +42,11 @@
>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>   * on a suspend request
>   *
> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
> + *
> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
> + * shutdown request. The remote processor should be in WFI state short after.
> + *
>   * Introduce new message definitions if any here.
>   *
>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>         RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
>         RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
>         RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
> -       RP_MBOX_END_MSG         = 0xFFFFFF14,
> +       RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
> +       RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
> +       RP_MBOX_END_MSG         = 0xFFFFFF16,
>  };
>
>  #endif /* _OMAP_RPMSG_H */
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 56b71652e449f..5d469f65115c3 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -18,7 +18,9 @@
>   *     Hari Nagalla <hnagalla@ti.com>
>   */
>
> +#include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>         case RP_MBOX_ECHO_REPLY:
>                 dev_info(dev, "received echo reply from %s\n", rproc->name);
>                 break;
> +       case RP_MBOX_SHUTDOWN_ACK:
> +               dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
> +               complete(&kproc->shutdown_complete);
> +               break;
>         default:
>                 /* silently handle all other valid messages */
>                 if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>
> +/**
> + * is_core_in_wfi - Utility function to check core status
> + * @kproc: remote core pointer used for checking core status
> + *
> + * This utility function is invoked by the shutdown sequence to ensure
> + * the remote core is in wfi, before asserting a reset.
> + */
> +bool is_core_in_wfi(struct k3_rproc *kproc)
> +{
> +       int ret;
> +       u64 boot_vec;
> +       u32 cfg, ctrl, stat;
> +
> +       ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
> +       if (ret)
> +               return false;
> +
> +       return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
> +}
> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
> +
> +/**
> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
> + * @kproc: remote core pointer used for sending mbox msg
> + *
> + * This function sends the shutdown prepare message to remote processor and
> + * waits for an ACK. Further, it checks if the remote processor has entered
> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
> + * has relinquished its resources before asserting a reset, so the shutdown
> + * happens cleanly.
> + */
> +int notify_shutdown_rproc(struct k3_rproc *kproc)
> +{
> +       bool wfi_status = false;
> +       int ret;
> +
> +       reinit_completion(&kproc->shutdown_complete);
> +
> +       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
> +       if (ret < 0) {
> +               dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> +                                         msecs_to_jiffies(5000));
> +       if (ret == 0) {
> +               dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
> +                       __func__);
> +               return -EBUSY;
> +       }
> +
> +       ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
> +                                200, 2000);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
> +
>  /*
>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>   * generic module reset that powers on the device and allows the internal
> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>  int k3_rproc_stop(struct rproc *rproc)
>  {
>         struct k3_rproc *kproc = rproc->priv;
> +       int ret;
> +
> +       ret = notify_shutdown_rproc(kproc);
> +       if (ret)
> +               return ret;
>
>         return k3_rproc_reset(kproc);
>  }
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe510..2a025f4894b82 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -22,6 +22,7 @@
>  #define REMOTEPROC_TI_K3_COMMON_H
>
>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK      (SZ_16M - 1)
> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI          0x00000002
>
>  /**
>   * struct k3_rproc_mem - internal memory structure
> @@ -92,6 +93,7 @@ struct k3_rproc {
>         u32 ti_sci_id;
>         struct mbox_chan *mbox;
>         struct mbox_client client;
> +       struct completion shutdown_complete;
>         void *priv;
>  };
>
> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
>  void k3_mem_release(void *data);
>  int k3_reserved_mem_init(struct k3_rproc *kproc);
>  void k3_release_tsp(void *data);
> +bool is_core_in_wfi(struct k3_rproc *kproc);
> +int notify_shutdown_rproc(struct k3_rproc *kproc);
>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920e..156ae09d8ee25 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       init_completion(&kproc->shutdown_complete);
> +
>         ret = k3_rproc_of_get_memories(pdev, kproc);
>         if (ret)
>                 return ret;
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52b..64d99071279b0 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       init_completion(&kproc->shutdown_complete);
> +
>         ret = k3_rproc_of_get_memories(pdev, kproc);
>         if (ret)
>                 return ret;
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 04f23295ffc10..8748dc6089cc2 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>         struct k3_r5_cluster *cluster = core->cluster;
>         int ret;
>
> +       ret = notify_shutdown_rproc(kproc);
> +       if (ret)
> +               return ret;
> +
>         /* halt all applicable cores */
>         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>                 list_for_each_entry(core, &cluster->cores, elem) {
> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>                         goto out;
>                 }
>
> +               init_completion(&kproc->shutdown_complete);
>  init_rmem:
>                 k3_r5_adjust_tcm_sizes(kproc);
>
> --
> 2.34.1
>
>
