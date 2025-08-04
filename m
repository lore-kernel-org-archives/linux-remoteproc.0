Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ADBA920;
	Mon,  4 Aug 2025 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335891; cv=none; b=pDeB8c1tMmMHl7vz72D7W933Vor+0Ka2CaLC621TXyVpnTUAzzBYSkw9+nEXDXg1Q0tPAKSnH3hLG2SUnHRLhKy+JTIiDs/Z9Q7PTnBpJOHj+dBWAILLMElo5A0Fpz7Sv/V/BUzkuRPqpsS1C0t191ILASmV+8Qp0pKzmBvCHQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335891; c=relaxed/simple;
	bh=ZnQSbuZYkjItKORmRN9BnQG+sGURBevEX8zF7T9jgPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFhQNNA3JFDecq8U5I+bFZ097hJluWNgWr1xqWaE4JAHXdxQv4TqhqaMGMZ2ogzUqqjC2kZ668pVFBEqwxPnpNz2VfW6PpIwRiiKAUdqynyxUCIqIt0daa6aQvIOwZEeQ5m6sg8+LxVf1oQb8G2vYtXXIjmKeMqnSfsFwDDi9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCCA6I2W; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCCA6I2W"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b42099901baso3784812a12.2;
        Mon, 04 Aug 2025 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754335889; x=1754940689; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cg1LDhnZ90yh+XE2oPHgeCSiaPRO2zTnyN8aur7VHpM=;
        b=mCCA6I2Wz+/oK4zvC269CE8WDckmkoP+8JIk2dXyXiwKqxZ6fzDyIvS7WHqj/d5Ugd
         s8Lux9YH6NXiH3BvbzHa9Y4JzN9+3yXxVenqEwRL1Tc6e1nw6ooLbc0lWY5W1CvcB6el
         dDnNcNQjZ0uaxo5oURUV7pkZoeNLvckCjbYN7+mU+w7WcGjCZgYv5HfDUxfQ+NgYaUHV
         dFxhzNCbYniTZdfrOOu6KVww7tXz2YUf1S/+oMxH38sqz0dJUzZn6eHPMJT/i1Ak15BY
         MMDcU7ziVBmJ5A4JgWr06AEAZ14dHLVei7LE7mDGikfTlDXv0Z7ppo29eEXnrcct6Fc+
         4gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754335889; x=1754940689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cg1LDhnZ90yh+XE2oPHgeCSiaPRO2zTnyN8aur7VHpM=;
        b=KBL9Pd868nuXvLylppokZX8Mq0BbUtSjW8O09+t9NrPjuLcvnItp4c12VnzWkj1whX
         Z9dwAM7Ww3EUkI132G7s7J+48wybsKHnlCTbG3hWRh0veeMfpo+btmnJJiu6mBNnFrMB
         ACh4ZAaoB2rI3XklwFheJC55Dj5L71QJCKcqRkfFR7vrwVOEFQpfJ1KxBSR0v1ZRfWiq
         i3UNK8IxU//V80FqdbW9fZcsa3cdQYsQVmwzWnGcvA6tCiXZ27RvG0G5/Tz4/l4mlSsD
         Pn5xcwai5FXgkyFZ+E0vPWfu84uu/d1g2IInkLVA0hYymZWIgxXF0a9UC81Bpe1k7Qc/
         Ru6g==
X-Forwarded-Encrypted: i=1; AJvYcCUUzwhFhmrd0wStaCxT0+DFSGUyG1d48LO4+JKuLsWPyPF+dYznxjwkSqJ1WaXIZxL3zjIcJpSPPVQh4Cn9S8ZkiA==@vger.kernel.org, AJvYcCUh119ijG2orkanmPE9taLC/nWvXT5e9qZm1Vhe2fcKhj/511KwREYPqicWs40u5Rlm9AgDev528D0mTzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEsbmaIgzgb1BLEz5dwYDkyW+ZKbQSIuFhPpMuh+2v1+MVBlZ
	W80bCWXGaIQV/4twP34uc1Ld4kW/mdJOK1I4dZtJibxbhCyTntkpnKpk
X-Gm-Gg: ASbGnctEGWB/dEdg2lz4yLOGcphCzt8NjVcNlNDI630QHpiUHNGa5PAl1kFkPDZqRIM
	ZZY5r/apvnEvCVIbgZ+2pUPqLR9AdVkTxXRX7XywA3Ivpfkhgct5IkiGpmp+YaSxA1KSvOI8PeI
	mC62XfXdN5cHC/0xQlgvHXGFskJq7L42OSXHkb6uupL/bSGIT7qs0j5GHfXJKlr9CPfcyXoXCro
	YrnQlcalFyFp/bg6WA71SFwJelX2vxOoGm33jsgyA6ORGezuRNYP/YiWJc7Z+e1+3Zoa0Ar6BxR
	2gNorv8G69FztZ/r5abePTQ2VEywsdZhcLm3aCBNBi3kB9s9+PBTAJowoYa8S8sidASdFrAvUnT
	eXpa1+Mume6gYDw8q+6I=
X-Google-Smtp-Source: AGHT+IGAC4mA0SjUVleHwP06QIOFdHV0sLOav/gFrKz9UJj/QtI4j3FJcq4tjR9/UICVzEItoBWM0w==
X-Received: by 2002:a17:902:c409:b0:234:f580:9ed with SMTP id d9443c01a7336-24246f7db85mr145196635ad.21.1754335888390;
        Mon, 04 Aug 2025 12:31:28 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm116911585ad.114.2025.08.04.12.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:31:27 -0700 (PDT)
Date: Mon, 4 Aug 2025 16:31:23 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Andrew Davis <afd@ti.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <yz2x2ywvmms6xgdvefqwr6ioi5cateagf2egqjnug7ozkcatx6@f652ifqzrm33>
References: <20250726143908.ayug6dedkmzulldx@hiagonb>
 <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>
 <20250729180420.svxtcukjlgg5sv6p@hiagonb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729180420.svxtcukjlgg5sv6p@hiagonb>

Hi Andrew,

On Tue, Jul 29, 2025 at 03:04:20PM -0300, Hiago De Franco wrote:
> On Sat, Jul 26, 2025 at 12:48:14PM -0500, Andrew Davis wrote:
> > On 7/26/25 9:39 AM, Hiago De Franco wrote:
> > > Hi Andrew, Beleswar,
> > > 
> > > On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
> > > > 
> > > > So the issue then looks to be this message we send here when we setup
> > > > the mailbox[0]. This mailbox setup is done during probe() for the K3
> > > > rproc drivers now (mailbox setup used to be done during
> > > > rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> > > > is correct, but we should have factored out the test message sending
> > > > code out of mailbox setup so it could have been left in
> > > > rproc_{start,attach}(). That way we only send this message if the
> > > > core is going to be started, no sense in sending that message if
> > > > we are not even going to run the core..
> > > > 
> > > > Fix might be as simple as [2] (not tested, if this works feel free
> > > > to send as a fix)
> > > 
> > > I tested the patch and it works, thanks!
> > > 
> > > > 
> > > > Andrew
> > > > 
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> > > > [2]
> > > > 
> > > > diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> > > > index a70d4879a8bea..657a200fa9040 100644
> > > > --- a/drivers/remoteproc/ti_k3_common.c
> > > > +++ b/drivers/remoteproc/ti_k3_common.c
> > > > @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_reset);
> > > > +static int k3_rproc_ping(struct k3_rproc *kproc)
> > > > +{
> > > > +       /*
> > > > +        * Ping the remote processor, this is only for sanity-sake for now;
> > > > +        * there is no functional effect whatsoever.
> > > > +        *
> > > > +        * Note that the reply will _not_ arrive immediately: this message
> > > > +        * will wait in the mailbox fifo until the remote processor is booted.
> > > > +        */
> > > > +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> > > > +       if (ret < 0)
> > > > +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > >   /* Release the remote processor from reset */
> > > >   int k3_rproc_release(struct k3_rproc *kproc)
> > > >   {
> > > > @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
> > > >          if (ret)
> > > >                  dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
> > > > +       k3_rproc_ping(kproc);
> > > > +
> > > >          return ret;
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_release);
> > > > @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> > > >                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > > >                                       "mbox_request_channel failed\n");
> > > > -       /*
> > > > -        * Ping the remote processor, this is only for sanity-sake for now;
> > > > -        * there is no functional effect whatsoever.
> > > > -        *
> > > > -        * Note that the reply will _not_ arrive immediately: this message
> > > > -        * will wait in the mailbox fifo until the remote processor is booted.
> > > > -        */
> > > > -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> > > > -       if (ret < 0) {
> > > > -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> > > > -               mbox_free_channel(kproc->mbox);
> > > > -               return ret;
> > > > -       }
> > > > -
> > > >          return 0;
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > > > @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
> > > >    * remote core. This callback is invoked only in IPC-only mode and exists
> > > >    * because rproc_validate() checks for its existence.
> > > >    */
> > > > -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> > > > +int k3_rproc_attach(struct rproc *rproc)
> > > > +{
> > > > +       k3_rproc_ping(rproc->priv);
> > > > +
> > > > +       return 0;
> > > > +}
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_attach);
> > > >   /*
> > > > 
> > > 
> > > On Sat, Jul 26, 2025 at 07:47:34PM +0530, Beleswar Prasad Padhi wrote:
> > > > > 
> > > > > So the issue then looks to be this message we send here when we setup
> > > > > the mailbox[0]. This mailbox setup is done during probe() for the K3
> > > > > rproc drivers now (mailbox setup used to be done during
> > > > > rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> > > > > is correct, but we should have factored out the test message sending
> > > > > code out of mailbox setup so it could have been left in
> > > > > rproc_{start,attach}().
> > > > 
> > > > 
> > > > Or, how about we don't send that test mbox message at all. It does not
> > > > actually check if the remoteproc was able to receive and respond to the
> > > > message. It only verifies if the write to the mbox queue was successful. And
> > > > most firmwares anyways don't reply to that mailbox-level echo message.
> > > 
> > > I was thinking about the same.
> > > 
> > > I tested the patch and it indeed works, however when I boot the remote
> > > core with a hello world firwmare from the TI MCU SDK (with IPC enabled
> > > with the sysconfig), the ping is sent but M4 never replies to it, which
> > > at the end causes an unread message to stay there. Later, if I stop the
> > > remote processor, I can not got into suspend mode again because of this
> > > message.
> > > 
> > > So I believe we should never send the message or clear the mailbox when
> > > the remote processor is stopped, but I was not able to find a way to
> > > clear the mailbox. So, is it ok if we never send the ping?
> > > 
> > 
> > So right now it is okay to not send that ping, and in the past I've
> > thought about removing it (it is a bit of a legacy hold-over from
> > the OMAP RProc driver. Back then we would send other messages like
> > suspend and shutdown requests, you can see the different messages
> > here[0]. Actually using those messages never got upstream, only the
> > ping message part did.
> > 
> > For K3 we want to start making use of all these other messages and
> > upstream the support for the same. So removing the ping test message
> > felt like a step backwards as it is a good placeholder for the more
> > important messages we want to send later. But as said, removing it
> > is probably fine for now.
> > 
> > The second thing on the roadmap is to better deal with messages left
> > in the mailbox queue when we try to suspend. Basically on suspend the
> > mailbox IP is powered down and all messages waiting will be lost, this
> > can cause issues. Instead of blocking suspend, one other option would
> > be to attempt to read out these messages and restore them on resume.
> > This state saving would match what most other IP drivers. This would
> > fix issues like the above were the firmware doesn't consume a message
> > for whatever reason. But until we implement that, either we throw out
> > messages on suspend, or we block suspend.
> 
> Got it, thanks for you explanation Andrew. I am out this week, so next
> week I will propose a patch so we can turn around this issue.
> 
> Thanks!
> 
> Hiago.

Sorry for the delay, I am back this week, I was testing the patches and
removing the ping was not enough, there is one extra message being sent,
which is the k3_rproc_kick() from ti_k3_common.c. This one is a callback
from remoteproc_virtio.c.

I belive this one is necessary to make the firmware works, but with the
hello world demo, I still have the issue where I can not go into suspend
mode. Removing both mbox_send_message() calls makes the suspend work
again:

root@verdin-am62-15479173:~# dmesg | grep -i -E "remoteproc|rproc|omap-mailbox|hfranco"
[    0.000000] Kernel command line: root=PARTUUID=096221e5-02 ro rootwait console=tty1 console=ttyS2,115200 dyndb
g="file ti_k3_common.c +p; file remotecore_proc.c +p; file remoteproc_virtio.c +p"
[   10.520920] omap-mailbox 29000000.mailbox: omap mailbox rev 0x66fc9100
[   10.711357] k3-m4-rproc 5000000.m4fss: assigned reserved memory node m4f-dma-memory@9cb00000
[   10.753040] k3-m4-rproc 5000000.m4fss: configured M4F for remoteproc mode
[   10.793640] remoteproc remoteproc0: 5000000.m4fss is available
[   10.856735] remoteproc remoteproc0: powering up 5000000.m4fss
[   10.895961] remoteproc remoteproc0: Booting fw image am62-mcu-m4f0_0-fw, size 451080
[   11.000752] rproc-virtio rproc-virtio.4.auto: assigned reserved memory node m4f-dma-memory@9cb00000
[   11.101614] rproc-virtio rproc-virtio.4.auto: registered virtio0 (type 7)
[   11.151665] remoteproc remoteproc0: remote processor 5000000.m4fss is now up
[   12.123724] remoteproc remoteproc1: 30074000.pru is available
[   12.171118] remoteproc remoteproc2: 30078000.pru is available
[   12.337287] remoteproc remoteproc0: vring0: va 00000000cabe42be qsz 256 notifyid 0
[   12.337337] remoteproc remoteproc0: vring1: va 00000000a651968a qsz 256 notifyid 1
[   12.348543] remoteproc remoteproc0: kicking vq index: 0
[   12.348559] hfranco: sending msg 0x0, name mbox-m4-0
[ 2514.508396] remoteproc remoteproc0: stopped remote processor 5000000.m4fss
[ 2518.010399] omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
[ 2518.010433] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
[ 2518.010461] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16

In this case, I was wondering if we should drop the messages for now,
until we have the routine to save the messages first. Any suggestion you
might have?

Thanks for the help,
Hiago.

> 
> > 
> > Andrew
> > 
> > [0] drivers/remoteproc/omap_remoteproc.h
> > 
> > > Best regards,
> > > Hiago.
> > > 
> > > > 
> > > > Thanks,
> > > > Beleswar
> > > > 
> > > > > That way we only send this message if the
> > > > > core is going to be started, no sense in sending that message if
> > > > > we are not even going to run the core..
> > > > > 
> > > > > Fix might be as simple as [2] (not tested, if this works feel free
> > > > > to send as a fix)
> > > > > 
> > > > > Andrew
> > > > > 
> > > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> > > > > [2]
> > > > > 
> > > > > diff --git a/drivers/remoteproc/ti_k3_common.c
> > > > > b/drivers/remoteproc/ti_k3_common.c
> > > > > index a70d4879a8bea..657a200fa9040 100644
> > > > > --- a/drivers/remoteproc/ti_k3_common.c
> > > > > +++ b/drivers/remoteproc/ti_k3_common.c
> > > > > @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(k3_rproc_reset);
> > > > > 
> > > > > +static int k3_rproc_ping(struct k3_rproc *kproc)
> > > > > +{
> > > > > +       /*
> > > > > +        * Ping the remote processor, this is only for sanity-sake for
> > > > > now;
> > > > > +        * there is no functional effect whatsoever.
> > > > > +        *
> > > > > +        * Note that the reply will _not_ arrive immediately: this
> > > > > message
> > > > > +        * will wait in the mailbox fifo until the remote processor is
> > > > > booted.
> > > > > +        */
> > > > > +       int ret = mbox_send_message(kproc->mbox, (void
> > > > > *)RP_MBOX_ECHO_REQUEST);
> > > > > +       if (ret < 0)
> > > > > +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n",
> > > > > ERR_PTR(ret));
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > >   /* Release the remote processor from reset */
> > > > >   int k3_rproc_release(struct k3_rproc *kproc)
> > > > >   {
> > > > > @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
> > > > >          if (ret)
> > > > >                  dev_err(dev, "module-reset deassert failed (%pe)\n",
> > > > > ERR_PTR(ret));
> > > > > 
> > > > > +       k3_rproc_ping(kproc);
> > > > > +
> > > > >          return ret;
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(k3_rproc_release);
> > > > > @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> > > > >                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > > > >                                       "mbox_request_channel failed\n");
> > > > > 
> > > > > -       /*
> > > > > -        * Ping the remote processor, this is only for sanity-sake for
> > > > > now;
> > > > > -        * there is no functional effect whatsoever.
> > > > > -        *
> > > > > -        * Note that the reply will _not_ arrive immediately: this
> > > > > message
> > > > > -        * will wait in the mailbox fifo until the remote processor is
> > > > > booted.
> > > > > -        */
> > > > > -       ret = mbox_send_message(kproc->mbox, (void
> > > > > *)RP_MBOX_ECHO_REQUEST);
> > > > > -       if (ret < 0) {
> > > > > -               dev_err(dev, "mbox_send_message failed (%pe)\n",
> > > > > ERR_PTR(ret));
> > > > > -               mbox_free_channel(kproc->mbox);
> > > > > -               return ret;
> > > > > -       }
> > > > > -
> > > > >          return 0;
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > > > > @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
> > > > >    * remote core. This callback is invoked only in IPC-only mode and
> > > > > exists
> > > > >    * because rproc_validate() checks for its existence.
> > > > >    */
> > > > > -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> > > > > +int k3_rproc_attach(struct rproc *rproc)
> > > > > +{
> > > > > +       k3_rproc_ping(rproc->priv);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > >   EXPORT_SYMBOL_GPL(k3_rproc_attach);
> > > > > 
> > > > >   /*
> > > > > 
> > 
