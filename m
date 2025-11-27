Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D1231A23
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256691; cv=none; b=nWHNOmiBhQ/SQD2v7X74aeBjYZhpzbJuqjOEXE4u3iWnukIItvPE11ro4R/Lr1+fD+/jmJkI8GU3KxOdc94LsCJYVFiDrRw4ZpPhahJ/9SiLo/xQmKREQ83vMD64cdgQQs2IiMwMHFh1BhWZkUAPQwb0QVeU7xeWVbqb6dSy81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256691; c=relaxed/simple;
	bh=6qJ8lOS62OiugJhMqE1obsHm+EDk8x4i4aTzMynU2gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbFT0jdl7SjwNgzw5TEogcNVllayHQ1ekk8bLKwFhkWi8BLGe0iRP5J6MVsIgjVHSA7ENPRXytkAZganILpDz51JONKisiZt72Xtk5qodpmojhZLrr4Z3U4LPWFgusSkdoVlNh7rffs2kffcQGNWuPZTgA4JcAHtbUIKzPlIALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m37hchXP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m37hchXP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so1550277a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764256682; x=1764861482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ncVm320XVjyYLuAwd/e930kgrJ+guXr1YRv5loBE8QQ=;
        b=m37hchXPCXTaQx9K2DetYNcgBtbV8cCLtsxslhk03gRlB8JMnGvdzwZxWwT/qqlsHH
         /Mr6nvvF690w+6010K/MUOVZCorizOVNsYmR/sg0f//NftGa98FGWouq4ykB/c20/glE
         oTwJEqy0ueOi/NANM2tCFv6C5b7Zc9Ip13dcmfj+pJq0BPl4CmvL6MdmLqTaQcP+4Jxq
         RplLLGBezdzx+S0TPN8mU8aLGFezwO/jpWGK4PjBValjCgn/Z36jTAmcm5sFJrg0pEWI
         M1L3o6ZLvHYiNiRBbsHMvs4MPn8gsK0TPpsEJHD/fYqYyQal/Xh0DFfbANLMjUSbYhUV
         5DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256682; x=1764861482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncVm320XVjyYLuAwd/e930kgrJ+guXr1YRv5loBE8QQ=;
        b=BR4dLlyQirkQxSQbG/YxkAwueO6IL+Hj353aaogKHVvRka7Pvo76LVAYBZGr1AbPiU
         Dmu7uVd0Ax5qYzKqn4dFM7rk0IQQk0z7gg2FT5LhRKMDEfjZGWhDWpG0mPjX9Ez+YzJU
         vZSzXlCocd5/zsxw1JJ7m4ESmqYsHtOoUzGOIMmXR3C8NUGpg+wONRz9Aisa8EThNz/A
         Pg+2LJUAl0mH3l5AAG5vKpINjhvokMYOQ7w1Loyi+t20EVLwxFb6DpoOGkOkXGmG6vgD
         4zyofGdsLYNoHMc/vclah72l3DH9nX9OdNsQjrrp6R3rtW5BfCp1UGjd2envCpHORx1Y
         kR7w==
X-Forwarded-Encrypted: i=1; AJvYcCUaOGVU3Ke/Q6U8LZwJc86twEM+HzBkZcZILXn3PrtTbgncmqt8pcgfiXsfqjpGb6PPe0RIwWxCsK9hDdpRzwOa@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqd1N4EaKsrGXUhIRn9Z8vD2CBSGfS3tGHcK91e4C0eyRBNHi
	XHyZSwqvIUb72WPf1YpnI+6jltCuEGsxxi2HgCgpgNkCg2pgoICywpmW9zcaBtoljvOnuCaB9Mc
	o7eESD7RIPSHkTxfhaq8nuYtPu43+oVyUhxb1AD+uIQ==
X-Gm-Gg: ASbGncu32UPgoVSaHUN+MQF/3KjuNGqN1pXDr+nMLY7R2xOv/noURk3oFaZi0+xFA5G
	CGtYQStnNJ6zmqaKGJAK7uJBTM/6wo2A/Q4WtiyRmbMmj/Ybn4zz3C9tCfHxz2uIvhVoMB3n4Nn
	CqP0vQhphpAjC6onVr7FbMx+zVo1TC2mxjW06AjOcPSTBWyohFDjYpLojdQUMUzDOOtvnHxAtjF
	AA0k9QlhImsMsCyk88/N9sFVwR2mJhhKKUYpL8vfFWfZaoN9KH76XaUwTNviMDUxvCepdm1ihbg
	4U2lZW8lCKk8Osji8rqkimk7+eB/Ew==
X-Google-Smtp-Source: AGHT+IGTDZ+mOR4C+WD8tmxKBgiXfb+T19sHWdDrcA2Sr/Y97h1iHtbVKpH6xUEALNJge8HSUcLTKvwG9JC0lQlZZDI=
X-Received: by 2002:a05:6402:34d1:b0:641:2c5d:81a6 with SMTP id
 4fb4d7f45d1cf-645eb785ce2mr9635918a12.33.1764256682409; Thu, 27 Nov 2025
 07:18:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125083746.2605721-1-b-padhi@ti.com> <CAEg67G=VWsupb53B=a5cyF2RbN58Bqfy8OJ+vpK3_dzCQnvd+Q@mail.gmail.com>
 <e917f964-85d9-4c33-a79a-d7f7474a6afb@ti.com>
In-Reply-To: <e917f964-85d9-4c33-a79a-d7f7474a6afb@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 27 Nov 2025 08:17:51 -0700
X-Gm-Features: AWmQ_bkiLcjAdHHfIJdRIZeih804CBmcerQR64BTZGZel4mxwSlnCXffn79vnC0
Message-ID: <CANLsYkw-mSSee5+Sm5yvMyXcBY7wOpe1QWtLvaqmewTYD8vm=w@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>, andersson@kernel.org, 
	richard.genoud@bootlin.com, afd@ti.com, hnagalla@ti.com, jm@ti.com, 
	u-kumar1@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 03:33, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>
> Hi Patrick, Mathieu,
>
> On 27/11/25 02:11, Patrick Oppenlander wrote:
> > On Tue, 25 Nov 2025 at 19:39, Beleswar Padhi <b-padhi@ti.com> wrote:
> >> From: Richard Genoud <richard.genoud@bootlin.com>
> >>
> >> Introduce software IPC handshake between the host running Linux and the
> >> remote processors to gracefully stop/reset the remote core.
> >>
> >> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
> >> message to the remotecore.
> >> The remote core is expected to:
> >> - relinquish all the resources acquired through Device Manager (DM)
> >> - disable its interrupts
> >> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
> >> - enter WFI state.
> > What happens if the remote core is unable to action the shutdown
> > request
>
>
> We abort the shutdown sequence if the remoteproc does not respond with
> an ACK within the timeout assuming rproc is busy doing some work.
>
> > (maybe it has crashed).
>
>
> remoteproc core has the infra to handle rproc crash. It initiates a
> recovery mechanism by stopping and starting the rproc with the same
> firmware.
>
> Are you suggesting that we check if rproc_stop() is invoked from a
> recovery context, and forcefully reset the rproc without sending/waiting
> for SHUTDOWN msg as a crashed core can't respond to mbox irqs?
>
> >
> > Is there a way to cleanup resources which the remote core allocated
> > without rebooting the whole system?
>
> For SW resources (like mem, vdev): Yes
> However, I feel this is currently missing in rproc core. We should be
> making a call to rproc_resource_cleanup() in rproc_boot_recovery()'s
> error paths and in rproc_crash_handler_work() in case of subsequent
> crashes.
>
> ^^ Mathieu, thoughts about the above?
>

Given the backlog of patchsets I have to review, Plumbers in two weeks
and the December holidays, I won't be able to look at this issue
before January.

Thanks,
Mathieu

> For HW resources: No
> In TI Device Manager (DM) firmware, only the entity which requested a
> resource can relinquish it, no other host can do that cleanup on behalf
> of that entity. So, we can't do much here.
>
> Thanks,
> Beleswar
>
> >
> > Patrick
> >
> >> Meanwhile, the K3 remoteproc driver does:
> >> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
> >> - wait for the remoteproc to enter WFI state
> >> - reset the remote core through device manager
> >>
> >> Based on work from: Hari Nagalla <hnagalla@ti.com>
> >>
> >> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> >> [b-padhi@ti.com: Extend support to all rprocs]
> >> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >> ---
> >> v2: Changelog:
> >> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
> >> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
> >> entered WFI state.
> >> 3. Convert return type of is_core_in_wfi() to bool. Works better with
> >> readx_poll_timeout() condition.
> >> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
> >> when void* is 64 bit.
> >> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
> >> function.
> >> 6. Updated commit message to fix minor typos and such.
> >>
> >> Link to v1:
> >> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
> >>
> >> Testing done:
> >> 1. Tested Boot across all TI K3 EVM/SK boards.
> >> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
> >> 4. Tested R5 rprocs can now be shutdown and powered back on
> >> from userspace.
> >> 3. Tested that each patch in the series generates no new
> >> warnings/errors.
> >>
> >>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
> >>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
> >>  drivers/remoteproc/ti_k3_common.h         |  4 ++
> >>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
> >>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
> >>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
> >>  6 files changed, 93 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> >> index 828e13256c023..c008f11fa2a43 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.h
> >> +++ b/drivers/remoteproc/omap_remoteproc.h
> >> @@ -42,6 +42,11 @@
> >>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
> >>   * on a suspend request
> >>   *
> >> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
> >> + *
> >> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
> >> + * shutdown request. The remote processor should be in WFI state short after.
> >> + *
> >>   * Introduce new message definitions if any here.
> >>   *
> >>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> >> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
> >>         RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
> >>         RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
> >>         RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
> >> -       RP_MBOX_END_MSG         = 0xFFFFFF14,
> >> +       RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
> >> +       RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
> >> +       RP_MBOX_END_MSG         = 0xFFFFFF16,
> >>  };
> >>
> >>  #endif /* _OMAP_RPMSG_H */
> >> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> >> index 56b71652e449f..5d469f65115c3 100644
> >> --- a/drivers/remoteproc/ti_k3_common.c
> >> +++ b/drivers/remoteproc/ti_k3_common.c
> >> @@ -18,7 +18,9 @@
> >>   *     Hari Nagalla <hnagalla@ti.com>
> >>   */
> >>
> >> +#include <linux/delay.h>
> >>  #include <linux/io.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of_address.h>
> >> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
> >>         case RP_MBOX_ECHO_REPLY:
> >>                 dev_info(dev, "received echo reply from %s\n", rproc->name);
> >>                 break;
> >> +       case RP_MBOX_SHUTDOWN_ACK:
> >> +               dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
> >> +               complete(&kproc->shutdown_complete);
> >> +               break;
> >>         default:
> >>                 /* silently handle all other valid messages */
> >>                 if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> >> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> >>  }
> >>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> >>
> >> +/**
> >> + * is_core_in_wfi - Utility function to check core status
> >> + * @kproc: remote core pointer used for checking core status
> >> + *
> >> + * This utility function is invoked by the shutdown sequence to ensure
> >> + * the remote core is in wfi, before asserting a reset.
> >> + */
> >> +bool is_core_in_wfi(struct k3_rproc *kproc)
> >> +{
> >> +       int ret;
> >> +       u64 boot_vec;
> >> +       u32 cfg, ctrl, stat;
> >> +
> >> +       ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
> >> +       if (ret)
> >> +               return false;
> >> +
> >> +       return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
> >> +}
> >> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
> >> +
> >> +/**
> >> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
> >> + * @kproc: remote core pointer used for sending mbox msg
> >> + *
> >> + * This function sends the shutdown prepare message to remote processor and
> >> + * waits for an ACK. Further, it checks if the remote processor has entered
> >> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
> >> + * has relinquished its resources before asserting a reset, so the shutdown
> >> + * happens cleanly.
> >> + */
> >> +int notify_shutdown_rproc(struct k3_rproc *kproc)
> >> +{
> >> +       bool wfi_status = false;
> >> +       int ret;
> >> +
> >> +       reinit_completion(&kproc->shutdown_complete);
> >> +
> >> +       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
> >> +       if (ret < 0) {
> >> +               dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> >> +                                         msecs_to_jiffies(5000));
> >> +       if (ret == 0) {
> >> +               dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
> >> +                       __func__);
> >> +               return -EBUSY;
> >> +       }
> >> +
> >> +       ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
> >> +                                200, 2000);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
> >> +
> >>  /*
> >>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
> >>   * generic module reset that powers on the device and allows the internal
> >> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
> >>  int k3_rproc_stop(struct rproc *rproc)
> >>  {
> >>         struct k3_rproc *kproc = rproc->priv;
> >> +       int ret;
> >> +
> >> +       ret = notify_shutdown_rproc(kproc);
> >> +       if (ret)
> >> +               return ret;
> >>
> >>         return k3_rproc_reset(kproc);
> >>  }
> >> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> >> index aee3c28dbe510..2a025f4894b82 100644
> >> --- a/drivers/remoteproc/ti_k3_common.h
> >> +++ b/drivers/remoteproc/ti_k3_common.h
> >> @@ -22,6 +22,7 @@
> >>  #define REMOTEPROC_TI_K3_COMMON_H
> >>
> >>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK      (SZ_16M - 1)
> >> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI          0x00000002
> >>
> >>  /**
> >>   * struct k3_rproc_mem - internal memory structure
> >> @@ -92,6 +93,7 @@ struct k3_rproc {
> >>         u32 ti_sci_id;
> >>         struct mbox_chan *mbox;
> >>         struct mbox_client client;
> >> +       struct completion shutdown_complete;
> >>         void *priv;
> >>  };
> >>
> >> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
> >>  void k3_mem_release(void *data);
> >>  int k3_reserved_mem_init(struct k3_rproc *kproc);
> >>  void k3_release_tsp(void *data);
> >> +bool is_core_in_wfi(struct k3_rproc *kproc);
> >> +int notify_shutdown_rproc(struct k3_rproc *kproc);
> >>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
> >> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >> index d6ceea6dc920e..156ae09d8ee25 100644
> >> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       init_completion(&kproc->shutdown_complete);
> >> +
> >>         ret = k3_rproc_of_get_memories(pdev, kproc);
> >>         if (ret)
> >>                 return ret;
> >> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> index 3a11fd24eb52b..64d99071279b0 100644
> >> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       init_completion(&kproc->shutdown_complete);
> >> +
> >>         ret = k3_rproc_of_get_memories(pdev, kproc);
> >>         if (ret)
> >>                 return ret;
> >> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> index 04f23295ffc10..8748dc6089cc2 100644
> >> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> >>         struct k3_r5_cluster *cluster = core->cluster;
> >>         int ret;
> >>
> >> +       ret = notify_shutdown_rproc(kproc);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>         /* halt all applicable cores */
> >>         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> >>                 list_for_each_entry(core, &cluster->cores, elem) {
> >> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
> >>                         goto out;
> >>                 }
> >>
> >> +               init_completion(&kproc->shutdown_complete);
> >>  init_rmem:
> >>                 k3_r5_adjust_tcm_sizes(kproc);
> >>
> >> --
> >> 2.34.1
> >>
> >>
