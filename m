Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFFB413235
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Jan 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031274; cv=pass; b=nzsHYf79hs5QoVvOexjrXEj0Lm9IHf6oVIsbLNUwOnOlq5jjsrGEJHEKCrvCRqn9ebiOajdwkVkAtck1R5ymLMrkE/4FRJZltcYh42EItn1AEMsbyz2TLWyeessxLcO/y2usZaoyutHLjZf+sqoQY9VRJpGCQ4jUElmOOkVB8Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031274; c=relaxed/simple;
	bh=vhISrttsXXjbsrdwV1Cw6xSA+WmAPmdhuxGtdcYGaBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRWw5oQGcyCFCoIPSFSbONQ6WHMl0zbSZ38GdWilLXuIdrQ8HXqPOW0GB1DhWoF1ob4HHVfNUqtyzlaUotS9wZDJN1+LXchfYwMfpJcdGDfeNSrQcYkSOn6FDCJap8RsOPnXddXwL09klcGTEH7LeScMHkdu2sPoUgdG/F8mik8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByyxLQ7t; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByyxLQ7t"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so442174a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Jan 2026 13:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769031269; cv=none;
        d=google.com; s=arc-20240605;
        b=ArMpmshiWwFDoCC8bYESTyqOwfix7b1Pn/gZ5QDEfymIBZvgwz+cCALESUhN5xvucd
         SJ5RcFv+VJ04Pxd19X+alK1yxTnuL7tNasW4x0f6OvTb65A4ULKkPxkf256JMbl95jDl
         ag9ESSw9kOSuUEu4ccyKVBrSOJFX6ZmOq3af92ZzOw3kGuYDsLns2Ly/Hcl33oZ80Idi
         mq0PXIBdc/xAC9Wn0G0dqBGYZllLC524yvS7hk/PqEthiavMXDDAbGqdW7kTJoIp6u1z
         kfw3iG7s+8o2ERB9LN91x0McIxxxQqIdk7maW25grSCdoJiCj7h+crezeBC/7hzCxtDe
         WxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nq/pM4Obju0h2ulS02zfJrvKJGl8cNuOczO6QSOA6oc=;
        fh=a0uEePe9MDJpLPBfUS08rhod/h6EISrE8RAxg2kd+O0=;
        b=jgv+Xz9054Q2dMFb1ieC64YJrHiJ8vCEbP5zAX575Z33yjxGoC15XziCVwJqK3V+6X
         EAXuQOXId8dTDElOODo1UXK4zPTWX0OcWc0fTNFDZ/JfSblOfF37/Z+/qclESYcGh4GG
         ASEQv80pvEUYAgplMiv8qaRYZQYl+u1hOXcWi9GtiR2zhrSDEu25ZjtP/l1c6YzYR6Lb
         ifVlsJdoxqwKQ9WdHzY9KhSQTRhyitBc7iB2uxo/iZl0xuBLLbhvr/aTZdxZhRzRKb5v
         ljx3vp5c3NLfpzt+PFOhJTYuekLKhgkjqrfWPFQoilE44HbImWGlakwW6GWGju7ewMGN
         VAmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769031269; x=1769636069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nq/pM4Obju0h2ulS02zfJrvKJGl8cNuOczO6QSOA6oc=;
        b=ByyxLQ7tgJz4z88XRTKwbqC4sPzYnH39U+uLgzu+V7+ybfO0EBAgC2q4FxGLBUY/0V
         BuonOMSVE5nkZe2Q4NUFOSJXLWEQkIhChcMduxge8FjVq/q6AUEUMiuRr76pM8z+TiS1
         b+yuUk7nhdfXx135ejcoVofGPslXcUJg14SpqW78krE8G8mVD+zdxUZuEax8mbtQzi24
         vltNagy9sMHEK621PFDPoYPXMwwx+ZV2nFSt0NS7BjBbZBn8/PzFT2SMNNynVwQqvi31
         ateoDKZVsoDHkPvdtlzXQRve+Hw+XUHmphx7zEYoSIsc1VEt6wIvS5Ql1HpsF91BDNmM
         3MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769031269; x=1769636069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq/pM4Obju0h2ulS02zfJrvKJGl8cNuOczO6QSOA6oc=;
        b=FQ3+d78Cc/EzFu95m9rtZHrBTLxouaZDB57WfbyxKQdFeQBdHhhactiEcLx7XilVke
         U5g+xDme7iWl2S0SGoRiADhP0CT67QzXBCw0XQE9b805hKDCSYg2VQ8u/PPW2eMeQ2BU
         I2UbiR4BK/qhaNOpuHAk903L+MdS8rgjMT5OV6Y92B9gSF+RIEWHQQVDuCKkKmUzJGb4
         Nn6HRnQ7ObfYtTGNtwU0aAFioX0Z9iLAz9cAGbPLblZQaa+9Ok3bdiIEOlc+RxeD/RKw
         Ma6v1zT0aw/yY8sDBPsZm7NXenO/FDolxRVWQ1fTKqzuwC6MOATRVUTb/NrKVf2O36fe
         NioQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlvf0VbQ16ZXpVGGKQHM7UlFH+SnSNytuchpRzs0UQ1uVaGY3FEu3pl1OIDa4dEGNDNLkHNX1onKc6kz5/CYf/@vger.kernel.org
X-Gm-Message-State: AOJu0YydMwPBtlRPhqJlkcvMYGX+DFev2NSY+oT6XGOgGyKzq4O02Qw+
	uVl2zPM2qp5TuTVUL3oC73xRm3opsxb3usPPKvm/JRFMUa4sUoSsXbPwl7fY5//7lE8AtmVO5fw
	rNqJNDEkzfDLjW94jXOufYKAsOdsSZKE=
X-Gm-Gg: AZuq6aLjHSKowGc7rbvfFiMgFfwKONLaNmF0eGk+I56diic/F1boqf0Lpd+00+ABkzm
	N06CLXipbFAPWmTb36OdHdeGS2ndQVioofDs102xrOlRRjRdSeJoZujg+vg69LM0KWNlbJ/YGKQ
	jYjD9CKx7jbqCiBz2pIIxyQ5KLT1iBCbM72vdAwc7JcyZxTWITBVeYp/SJh6lIXc28vetmZdv1q
	WES/LqrWJMGnD45VnfpU57G1rpu31HyYx4io7/Jxctm5Deu2RM5VRulGQmzHslQK0HO+VFJiFl8
	h7lY4HSkNuR0YM+iqjyv3fV/9EgQOnnHo7S8jnJr+3SFKhc+bnaCygrd7A==
X-Received: by 2002:a05:6402:5111:b0:64b:8d7a:71cf with SMTP id
 4fb4d7f45d1cf-654bb42981amr13746227a12.26.1769031269265; Wed, 21 Jan 2026
 13:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125083746.2605721-1-b-padhi@ti.com> <aUHb_ax7rn3K_QeW@p14s>
 <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com> <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
 <CAEg67G=iWg7yh5=aU1cCC2+XreagpvFVpaCV2VC0=GAEPfuKUA@mail.gmail.com> <CANLsYkxR4S=MHCwQ-c16pycAzNUMStCkpy_cvxgGKzgFj48yeQ@mail.gmail.com>
In-Reply-To: <CANLsYkxR4S=MHCwQ-c16pycAzNUMStCkpy_cvxgGKzgFj48yeQ@mail.gmail.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Thu, 22 Jan 2026 08:34:17 +1100
X-Gm-Features: AZwV_QigZTWo1AfYH9aqXJe_VtWI8uWYwFj6FGf0C7MhKHJfLL6tbt824YYcVGc
Message-ID: <CAEg67Gkd7Paza7oP8e7tnZFFZZcuDCWn9TE1FO0JOqFrd+H7ug@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>, andersson@kernel.org, richard.genoud@bootlin.com, 
	afd@ti.com, hnagalla@ti.com, jm@ti.com, u-kumar1@ti.com, 
	jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 05:09, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, 14 Jan 2026 at 15:28, Patrick Oppenlander
> <patrick.oppenlander@gmail.com> wrote:
> >
> > On Thu, 15 Jan 2026 at 03:36, Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, 13 Jan 2026 at 09:37, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
> > > >
> > > > Hi Mathieu,
> > > >
> > > > Sorry for the delay in response here. Somehow all the messages
> > > > in this thread ended up in spam. Didn't realize there were new
> > > > msgs until I looked up on lore.
> > > >
> > >
> > > I've been getting weird automated email replies from TI.
> > >
> > > > On 17/12/25 03:53, Mathieu Poirier wrote:
> > > > > Hi Beleswar,
> > > > >
> > > > > On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
> > > > >> From: Richard Genoud <richard.genoud@bootlin.com>
> > > > >>
> > > > >> Introduce software IPC handshake between the host running Linux and the
> > > > >> remote processors to gracefully stop/reset the remote core.
> > > > >>
> > > > >> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
> > > > >> message to the remotecore.
> > > > >> The remote core is expected to:
> > > > >> - relinquish all the resources acquired through Device Manager (DM)
> > > > >> - disable its interrupts
> > > > >> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
> > > > >> - enter WFI state.
> > > > >>
> > > > >> Meanwhile, the K3 remoteproc driver does:
> > > > >> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
> > > > >> - wait for the remoteproc to enter WFI state
> > > > >> - reset the remote core through device manager
> > > > >>
> > > > >> Based on work from: Hari Nagalla <hnagalla@ti.com>
> > > > >>
> > > > >> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> > > > >> [b-padhi@ti.com: Extend support to all rprocs]
> > > > >> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > > > >> ---
> > > > >> v2: Changelog:
> > > > >> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
> > > > >> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
> > > > >> entered WFI state.
> > > > >> 3. Convert return type of is_core_in_wfi() to bool. Works better with
> > > > >> readx_poll_timeout() condition.
> > > > >> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
> > > > >> when void* is 64 bit.
> > > > >> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
> > > > >> function.
> > > > >> 6. Updated commit message to fix minor typos and such.
> > > > >>
> > > > >> Link to v1:
> > > > >> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
> > > > >>
> > > > >> Testing done:
> > > > >> 1. Tested Boot across all TI K3 EVM/SK boards.
> > > > >> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
> > > > >> 4. Tested R5 rprocs can now be shutdown and powered back on
> > > > >> from userspace.
> > > > >> 3. Tested that each patch in the series generates no new
> > > > >> warnings/errors.
> > > > >>
> > > > >>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
> > > > >>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
> > > > >>  drivers/remoteproc/ti_k3_common.h         |  4 ++
> > > > >>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
> > > > >>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
> > > > >>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
> > > > >>  6 files changed, 93 insertions(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> > > > >> index 828e13256c023..c008f11fa2a43 100644
> > > > >> --- a/drivers/remoteproc/omap_remoteproc.h
> > > > >> +++ b/drivers/remoteproc/omap_remoteproc.h
> > > > >> @@ -42,6 +42,11 @@
> > > > >>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
> > > > >>   * on a suspend request
> > > > >>   *
> > > > >> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
> > > > >> + *
> > > > >> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
> > > > >> + * shutdown request. The remote processor should be in WFI state short after.
> > > > >> + *
> > > > >>   * Introduce new message definitions if any here.
> > > > >>   *
> > > > >>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> > > > >> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
> > > > >>      RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
> > > > >>      RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
> > > > >>      RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
> > > > >> -    RP_MBOX_END_MSG         = 0xFFFFFF14,
> > > > >> +    RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
> > > > >> +    RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
> > > > >> +    RP_MBOX_END_MSG         = 0xFFFFFF16,
> > > > >>  };
> > > > >>
> > > > >>  #endif /* _OMAP_RPMSG_H */
> > > > >> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> > > > >> index 56b71652e449f..5d469f65115c3 100644
> > > > >> --- a/drivers/remoteproc/ti_k3_common.c
> > > > >> +++ b/drivers/remoteproc/ti_k3_common.c
> > > > >> @@ -18,7 +18,9 @@
> > > > >>   *  Hari Nagalla <hnagalla@ti.com>
> > > > >>   */
> > > > >>
> > > > >> +#include <linux/delay.h>
> > > > >>  #include <linux/io.h>
> > > > >> +#include <linux/iopoll.h>
> > > > >>  #include <linux/mailbox_client.h>
> > > > >>  #include <linux/module.h>
> > > > >>  #include <linux/of_address.h>
> > > > >> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
> > > > >>      case RP_MBOX_ECHO_REPLY:
> > > > >>              dev_info(dev, "received echo reply from %s\n", rproc->name);
> > > > >>              break;
> > > > >> +    case RP_MBOX_SHUTDOWN_ACK:
> > > > >> +            dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
> > > > >> +            complete(&kproc->shutdown_complete);
> > > > >> +            break;
> > > > >>      default:
> > > > >>              /* silently handle all other valid messages */
> > > > >>              if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> > > > >> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> > > > >>  }
> > > > >>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > > > >>
> > > > >> +/**
> > > > >> + * is_core_in_wfi - Utility function to check core status
> > > > >> + * @kproc: remote core pointer used for checking core status
> > > > >> + *
> > > > >> + * This utility function is invoked by the shutdown sequence to ensure
> > > > >> + * the remote core is in wfi, before asserting a reset.
> > > > >> + */
> > > > >> +bool is_core_in_wfi(struct k3_rproc *kproc)
> > > > >> +{
> > > > >> +    int ret;
> > > > >> +    u64 boot_vec;
> > > > >> +    u32 cfg, ctrl, stat;
> > > > >> +
> > > > >> +    ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
> > > > >> +    if (ret)
> > > > >> +            return false;
> > > > >> +
> > > > >> +    return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
> > > > >> +}
> > > > >> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
> > > > >> +
> > > > >> +/**
> > > > >> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
> > > > >> + * @kproc: remote core pointer used for sending mbox msg
> > > > >> + *
> > > > >> + * This function sends the shutdown prepare message to remote processor and
> > > > >> + * waits for an ACK. Further, it checks if the remote processor has entered
> > > > >> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
> > > > >> + * has relinquished its resources before asserting a reset, so the shutdown
> > > > >> + * happens cleanly.
> > > > >> + */
> > > > >> +int notify_shutdown_rproc(struct k3_rproc *kproc)
> > > > >> +{
> > > > >> +    bool wfi_status = false;
> > > > >> +    int ret;
> > > > >> +
> > > > >> +    reinit_completion(&kproc->shutdown_complete);
> > > > >> +
> > > > >> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
> > > > >> +    if (ret < 0) {
> > > > >> +            dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
> > > > >> +            return ret;
> > > > >> +    }
> > > > >> +
> > > > >> +    ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> > > > >> +                                      msecs_to_jiffies(5000));
> > > > >> +    if (ret == 0) {
> > > > >> +            dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
> > > > >> +                    __func__);
> > > > >> +            return -EBUSY;
> > > > >> +    }
> > > > >> +
> > > > >
> > > > > Won't that create an issue on systems with an older FW that doesn't send a
> > > > > RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
> > > > > needs to be backward compatible.
> > > >
> > > >
> > > > I feel it would be unsafe to just abruptly power off a core without some
> > > > handshake.. The core could be executing something, there could be
> > > > pending bus transactions leading to system hangs etc.. We start the
> > > > IPC mechanism with a handshake, so we should end it with a
> > > > handshake too.. And for firmwares that don't support this handshake,
> > > > IMO its better to reject the shutdown request. What do you think?
> > > >
> > >
> > > We can't affect the behavior of systems where old FW is coupled with a
> > > new kernel.  If people want to address the bugs you referred to, they
> > > can update their FW as they see fit.  As such things need to be
> > > backward compatible.  NXP has recently implemented a handshake
> > > mechanism such as this, but to assert the readiness of a booting
> > > remote processor. They used the vendor specific resource table to
> > > store a flag that enables the handshake - I suggest using the same
> > > heuristic to implement this feature.
> >
> > A flag in a resource table enabling the new behaviour could work, but
> > we would probably need another way to do the new thing, maybe with a
> > devicetree flag. Why? Because people are running TI's kernel, which
> > has had this feature since Feb 2025, and may want to migrate to a
> > mainline kernel. Those firmwares already use the handshake.
> >
>
> We can't expect upstream to be compatible with what is happening in
> vendor kernels, it simply doesn't scale.  Moreover, a devicetree flag
> would mean two ways of supporting the same feature, which quickly
> becomes a maintenance nightmare.
>
> > If we want to be nice to existing users, we should provide a way to be
> > compatible with existing firmwares which don't support
> > RP_MBOX_SHUTDOWN, and with existing firmwares which do.
> >
>
> That is indeed what I suggested.

Then we can't add a feature flag to the resource table as existing
firmwares which expect RP_MBOX_SHUTDOWN won't have the flag set.

> > That said, restarting remote processors on k3 was quite broken without
> > the shutdown handshake, often leading to hangs/crashes requiring a
> > full system reboot to recover. This is why I previously asked about
> > recovery if the remoteproc crashes or is unable to handle the shutdown
> > request.
> >
> > I suspect that most real world users who are actually restarting
> > remoteprocs on k3 are already using the handshake with TI's kernel.
> >
> > IMHO it's probably fine to just send RP_MBOX_SHUTDOWN to firmwares
> > which don't support it, and handle old firmwares via the same recovery
> > path as new firmwares which have crashed. This would mean that
> > upgrading a system with an old firmware to a new kernel will have an
> > additional delay when shutting down a remoteproc, but realistically,
> > this shutdown path was broken anyway.
> >
>
> I'm sure there are systems where the extra delay will cause trouble,
> hence the need to add the flexibility to keep the original behavior
> when the remote processor isn't expecting a handshake at shutdown
> time.

Personally I think this is unlikely to cause problems as shutting down
the remoteproc in this way really is very unreliable. We would be
adding a small additional delay to an already buggy code path. Systems
in the wild likely fall into two categories:
1. Remoteproc is started and never stopped.
2. Remoteproc already uses RP_MBOX_SHUTDOWN.

Our product falls into the 2nd category. We ship firmwares which
support RP_MBOX_SHUTDOWN, and use TI's kernel for now. We will switch
to an LTS kernel at some point as we have an expected product life of
at least 20 years. Changing our remoteproc firmwares to add an
additional flag to the resource table may sound trivial, but may
invalidate expensive compliance certifications as the firmware hashes
will change. We can work around this by carrying an additional kernel
patch, but even though it's a trivial thing to do, it still incurs a
non-zero maintenance cost in the long term.

Patrick

> > Patrick
> >
> > > > For older TI firmwares also, doing rproc_stop() resulted in those
> > > > intermittent bugs as mentioned above. So we never really supported
> > > > the stop() feature until now.
> > > >
> > > > Thanks,
> > > > Beleswar
> > > >
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > >> +    ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
> > > > >> +                             200, 2000);
> > > > >> +    if (ret)
> > > > >> +            return ret;
> > > > >> +
> > > > >> +    return 0;
> > > > >> +}
> > > > >> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
> > > > >> +
> > > > >>  /*
> > > > >>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
> > > > >>   * generic module reset that powers on the device and allows the internal
> > > > >> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
> > > > >>  int k3_rproc_stop(struct rproc *rproc)
> > > > >>  {
> > > > >>      struct k3_rproc *kproc = rproc->priv;
> > > > >> +    int ret;
> > > > >> +
> > > > >> +    ret = notify_shutdown_rproc(kproc);
> > > > >> +    if (ret)
> > > > >> +            return ret;
> > > > >>
> > > > >>      return k3_rproc_reset(kproc);
> > > > >>  }
> > > > >> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> > > > >> index aee3c28dbe510..2a025f4894b82 100644
> > > > >> --- a/drivers/remoteproc/ti_k3_common.h
> > > > >> +++ b/drivers/remoteproc/ti_k3_common.h
> > > > >> @@ -22,6 +22,7 @@
> > > > >>  #define REMOTEPROC_TI_K3_COMMON_H
> > > > >>
> > > > >>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK   (SZ_16M - 1)
> > > > >> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI               0x00000002
> > > > >>
> > > > >>  /**
> > > > >>   * struct k3_rproc_mem - internal memory structure
> > > > >> @@ -92,6 +93,7 @@ struct k3_rproc {
> > > > >>      u32 ti_sci_id;
> > > > >>      struct mbox_chan *mbox;
> > > > >>      struct mbox_client client;
> > > > >> +    struct completion shutdown_complete;
> > > > >>      void *priv;
> > > > >>  };
> > > > >>
> > > > >> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
> > > > >>  void k3_mem_release(void *data);
> > > > >>  int k3_reserved_mem_init(struct k3_rproc *kproc);
> > > > >>  void k3_release_tsp(void *data);
> > > > >> +bool is_core_in_wfi(struct k3_rproc *kproc);
> > > > >> +int notify_shutdown_rproc(struct k3_rproc *kproc);
> > > > >>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
> > > > >> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > > >> index d6ceea6dc920e..156ae09d8ee25 100644
> > > > >> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > > >> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > > >> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
> > > > >>      if (ret)
> > > > >>              return ret;
> > > > >>
> > > > >> +    init_completion(&kproc->shutdown_complete);
> > > > >> +
> > > > >>      ret = k3_rproc_of_get_memories(pdev, kproc);
> > > > >>      if (ret)
> > > > >>              return ret;
> > > > >> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > > >> index 3a11fd24eb52b..64d99071279b0 100644
> > > > >> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > > >> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > > >> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
> > > > >>      if (ret)
> > > > >>              return ret;
> > > > >>
> > > > >> +    init_completion(&kproc->shutdown_complete);
> > > > >> +
> > > > >>      ret = k3_rproc_of_get_memories(pdev, kproc);
> > > > >>      if (ret)
> > > > >>              return ret;
> > > > >> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > > >> index 04f23295ffc10..8748dc6089cc2 100644
> > > > >> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > > >> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > > >> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> > > > >>      struct k3_r5_cluster *cluster = core->cluster;
> > > > >>      int ret;
> > > > >>
> > > > >> +    ret = notify_shutdown_rproc(kproc);
> > > > >> +    if (ret)
> > > > >> +            return ret;
> > > > >> +
> > > > >>      /* halt all applicable cores */
> > > > >>      if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> > > > >>              list_for_each_entry(core, &cluster->cores, elem) {
> > > > >> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
> > > > >>                      goto out;
> > > > >>              }
> > > > >>
> > > > >> +            init_completion(&kproc->shutdown_complete);
> > > > >>  init_rmem:
> > > > >>              k3_r5_adjust_tcm_sizes(kproc);
> > > > >>
> > > > >> --
> > > > >> 2.34.1
> > > > >>
> > >
