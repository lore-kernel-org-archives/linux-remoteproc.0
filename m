Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7A2D6E7C
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408583; cv=none; b=t/mR34GGWiDIt+dOF+UCF0xP+NQbAZ/LqBtk+FA5f8mYJkHnSlrWVdap1mMHQFVlZGwUst2FEGMvJa+ImrsIMVUnhfsaaSd2M8g68kDH1v07oNDFhSHkBGS4laDSWtSNHf+UhBFsToP3u86c/GlyY4ZRdwDX7cP9N4TdPPW9CgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408583; c=relaxed/simple;
	bh=c8yqRabYCub/U/s7YbWIINJaK87SK30TKZ2K4/kAcnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdEmvwaob+pdTtppT721EMFj2g2dSHepp31jRdlGVc2mQ6ON5uBHBmzG87NOCSc7Z1ryWu+r+HpJ+it0kCNLJWMn5WpyfsUov3FZPxygeg0NMj7Fq4mIPL5eZPUPhZNwNtumbd6PeqWn4SApysgwxXVwXMpd3m6b/CFPdMJGPNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuY4Dawe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuY4Dawe"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so13070414a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 08:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768408580; x=1769013380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mulfMyrpHes0c1tvh170xIFBOrgzKYK019BoPilVBq8=;
        b=YuY4Dawe+fDmJL3XUz23/hcjmMKk1Wp2XZ4PY+oSmNJCEmBqkvVUFY5GZRwQLqNFK8
         YvgeE75DIDKrfRbqM3qH5eNZrhVZrsjaDYbCRxywgLn9Pt9n9VEw5AsyP6xCVKkdL0Ii
         AAqZIEsthHF9XQcIuo2G4ta4h7oUFZyjtwFWlmS8kCPvQWGgSrqs8O5LP6j49D8MOXr6
         rJK0cuVSvlAvInHUczIzB9bleBtqPD3qJmhZC0hIbb2H3Vh4fZshkRzvheRunLK06oMN
         k1qS+/uO5D9C/FY3GTlu4j7LLTlaU7RRp03O//6M83YgG8fW7fV01Fa70FxQVvrTri9o
         XCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408580; x=1769013380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mulfMyrpHes0c1tvh170xIFBOrgzKYK019BoPilVBq8=;
        b=VEJPB+jBZgAWpR8rhXYNPNJTnZM0AqEMTkLFOyPOVbwf353itQMNLX26qvb/eKEH1i
         VCCa1j2hJ+gE96OjQzsHK1AlzQbrhNyzThdydaJ/GdKp8IyQayaPWoJlNrw/oB3wCqt8
         gCuiKZ5vvoce77MR9Ci3su6epbrVY0T6+WskC4Jipv2E7EU4h3cp/Qme6BDRXi/ypZyg
         8ef2UA2AuXk/2b12ZKNcpQlt+/Yir3e6a94Jxbu7oXGL5YwwZDG9dIT+M2EaASTRsBML
         zoHOLjMPyO8b9Xq7O7IAAEBUz0jfNZS+ZHF7pehphthNAlfPAw4YcJlnc7hD00GiogbL
         c0oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGhGWudKmjISIlVVAxK1n0dmQ4RqB+LZLds1U1PENpB6m8uAZGAhdTstL7g4faiY8QE052UlDqXouGyjsb4T/3@vger.kernel.org
X-Gm-Message-State: AOJu0YxnSIpFuvipvHOXhJ7m6YwCelD9TxyBWNJv/XE+IfHjYWW7hB6h
	lyoW08aEZifdVzr5Y1QAPfQWJGbAHsi3neG1/JmetnlKFh7tSi/tBLcB0hUd3EnvYkV8WChLY1a
	hUjIkxUYJwSWH2ONOlGOn+UEuR0bKObtu53NgDOELPw==
X-Gm-Gg: AY/fxX4BuEULdt77EpO2xWE4zTQ3avLywPhKUCHGbPN1iF32BwLd6swl/ZW4iqOUDJW
	PO2dxmrjD9K4c6SD8TG5dO8e1mwYHzfXFsfpf6bxXf9waILs1c4EAIBilrSjpW0fPWo6LVs/8k0
	+i0CeUJAupU1u7saHF/J/f7/vr4onPGfk6Err1gBvEwu2mN5AkNfWZEFAVZDZSCRXc7uNVG4AuS
	E2MDRpCw1FnEheGfMoVTUnwn3sQ3C9whIhoUWPdANq7I4hG8z0XTeF9hcu2vQo6NCQd1R3UUXb/
	iR+JAgWGmbVxi9Y6faZoswsIcxd7og==
X-Received: by 2002:a17:906:dc89:b0:b87:3041:f1cf with SMTP id
 a640c23a62f3a-b876114dbe6mr247242266b.49.1768408579974; Wed, 14 Jan 2026
 08:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125083746.2605721-1-b-padhi@ti.com> <aUHb_ax7rn3K_QeW@p14s> <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
In-Reply-To: <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 14 Jan 2026 09:36:09 -0700
X-Gm-Features: AZwV_Qjl49Ue6oyjBEyyvETJHrzH2ndavEpiyRDOJ_s_Cf30YEhjcx-qVYyrRuM
Message-ID: <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, richard.genoud@bootlin.com, afd@ti.com, 
	hnagalla@ti.com, jm@ti.com, u-kumar1@ti.com, jan.kiszka@siemens.com, 
	christophe.jaillet@wanadoo.fr, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Jan 2026 at 09:37, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> Sorry for the delay in response here. Somehow all the messages
> in this thread ended up in spam. Didn't realize there were new
> msgs until I looked up on lore.
>

I've been getting weird automated email replies from TI.

> On 17/12/25 03:53, Mathieu Poirier wrote:
> > Hi Beleswar,
> >
> > On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
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
> >>
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
> >>      RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
> >>      RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
> >>      RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
> >> -    RP_MBOX_END_MSG         = 0xFFFFFF14,
> >> +    RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
> >> +    RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
> >> +    RP_MBOX_END_MSG         = 0xFFFFFF16,
> >>  };
> >>
> >>  #endif /* _OMAP_RPMSG_H */
> >> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> >> index 56b71652e449f..5d469f65115c3 100644
> >> --- a/drivers/remoteproc/ti_k3_common.c
> >> +++ b/drivers/remoteproc/ti_k3_common.c
> >> @@ -18,7 +18,9 @@
> >>   *  Hari Nagalla <hnagalla@ti.com>
> >>   */
> >>
> >> +#include <linux/delay.h>
> >>  #include <linux/io.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of_address.h>
> >> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
> >>      case RP_MBOX_ECHO_REPLY:
> >>              dev_info(dev, "received echo reply from %s\n", rproc->name);
> >>              break;
> >> +    case RP_MBOX_SHUTDOWN_ACK:
> >> +            dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
> >> +            complete(&kproc->shutdown_complete);
> >> +            break;
> >>      default:
> >>              /* silently handle all other valid messages */
> >>              if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
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
> >> +    int ret;
> >> +    u64 boot_vec;
> >> +    u32 cfg, ctrl, stat;
> >> +
> >> +    ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
> >> +    if (ret)
> >> +            return false;
> >> +
> >> +    return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
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
> >> +    bool wfi_status = false;
> >> +    int ret;
> >> +
> >> +    reinit_completion(&kproc->shutdown_complete);
> >> +
> >> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
> >> +    if (ret < 0) {
> >> +            dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> >> +                                      msecs_to_jiffies(5000));
> >> +    if (ret == 0) {
> >> +            dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
> >> +                    __func__);
> >> +            return -EBUSY;
> >> +    }
> >> +
> >
> > Won't that create an issue on systems with an older FW that doesn't send a
> > RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
> > needs to be backward compatible.
>
>
> I feel it would be unsafe to just abruptly power off a core without some
> handshake.. The core could be executing something, there could be
> pending bus transactions leading to system hangs etc.. We start the
> IPC mechanism with a handshake, so we should end it with a
> handshake too.. And for firmwares that don't support this handshake,
> IMO its better to reject the shutdown request. What do you think?
>

We can't affect the behavior of systems where old FW is coupled with a
new kernel.  If people want to address the bugs you referred to, they
can update their FW as they see fit.  As such things need to be
backward compatible.  NXP has recently implemented a handshake
mechanism such as this, but to assert the readiness of a booting
remote processor. They used the vendor specific resource table to
store a flag that enables the handshake - I suggest using the same
heuristic to implement this feature.

> For older TI firmwares also, doing rproc_stop() resulted in those
> intermittent bugs as mentioned above. So we never really supported
> the stop() feature until now.
>
> Thanks,
> Beleswar
>
> >
> > Thanks,
> > Mathieu
> >
> >> +    ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
> >> +                             200, 2000);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
> >> +
> >>  /*
> >>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
> >>   * generic module reset that powers on the device and allows the internal
> >> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
> >>  int k3_rproc_stop(struct rproc *rproc)
> >>  {
> >>      struct k3_rproc *kproc = rproc->priv;
> >> +    int ret;
> >> +
> >> +    ret = notify_shutdown_rproc(kproc);
> >> +    if (ret)
> >> +            return ret;
> >>
> >>      return k3_rproc_reset(kproc);
> >>  }
> >> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> >> index aee3c28dbe510..2a025f4894b82 100644
> >> --- a/drivers/remoteproc/ti_k3_common.h
> >> +++ b/drivers/remoteproc/ti_k3_common.h
> >> @@ -22,6 +22,7 @@
> >>  #define REMOTEPROC_TI_K3_COMMON_H
> >>
> >>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK   (SZ_16M - 1)
> >> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI               0x00000002
> >>
> >>  /**
> >>   * struct k3_rproc_mem - internal memory structure
> >> @@ -92,6 +93,7 @@ struct k3_rproc {
> >>      u32 ti_sci_id;
> >>      struct mbox_chan *mbox;
> >>      struct mbox_client client;
> >> +    struct completion shutdown_complete;
> >>      void *priv;
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
> >>      if (ret)
> >>              return ret;
> >>
> >> +    init_completion(&kproc->shutdown_complete);
> >> +
> >>      ret = k3_rproc_of_get_memories(pdev, kproc);
> >>      if (ret)
> >>              return ret;
> >> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> index 3a11fd24eb52b..64d99071279b0 100644
> >> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
> >>      if (ret)
> >>              return ret;
> >>
> >> +    init_completion(&kproc->shutdown_complete);
> >> +
> >>      ret = k3_rproc_of_get_memories(pdev, kproc);
> >>      if (ret)
> >>              return ret;
> >> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> index 04f23295ffc10..8748dc6089cc2 100644
> >> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> >>      struct k3_r5_cluster *cluster = core->cluster;
> >>      int ret;
> >>
> >> +    ret = notify_shutdown_rproc(kproc);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >>      /* halt all applicable cores */
> >>      if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> >>              list_for_each_entry(core, &cluster->cores, elem) {
> >> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
> >>                      goto out;
> >>              }
> >>
> >> +            init_completion(&kproc->shutdown_complete);
> >>  init_rmem:
> >>              k3_r5_adjust_tcm_sizes(kproc);
> >>
> >> --
> >> 2.34.1
> >>
