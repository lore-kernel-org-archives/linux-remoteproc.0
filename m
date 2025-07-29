Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480F2AE90;
	Tue, 29 Jul 2025 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753812268; cv=none; b=A6PAZTFctrwn9f12oBuE52giDnbCEGp6jSkyGr7CLjmh73FaqTiIddcX6a01MyIzOQ1MtaLuDUbUfkqhkYP5rdcFb22ruIQzLmdmscSQO80jvPdtgfrHQkN1TT04jQk0GD2KCBKI+RdPtI9YH7QTDccXJmtEoM9bDl6/9tqJCA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753812268; c=relaxed/simple;
	bh=yPmhtzFyyUMeVfkYm5u/0XXI6jtxiXws5hRThBhbWlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llKIxNFATB06ANhT64vtCw9dDFHpmlcTtzVsMi8q+dgpj0V9WO0uTm+fr1ZtqcmtJ0ZByuVzILfQZ3ygjEMrEOVcVfGm1JeF/4PobSq8y6TbnLaajZ53vg+XFkTbvFwaQmba/UnlzVd2e8gf7h3o9hPbXmVIIqrKql8RUPD8TDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abwQcJpt; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abwQcJpt"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b390d09e957so6292569a12.1;
        Tue, 29 Jul 2025 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753812266; x=1754417066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HCWKguqPM8rKcqBM1k3B00wsHXW0z11MmTR21pRsbI=;
        b=abwQcJptdHB+SUmnH/GweNRwy6WKjwzZFeWiW2axsQUdBOfX1o/wtkj35d+WvgYfMB
         CcxiYW/Th8TxRQZaPoS+napyv+T/pPiRUMiIc4Q+IiFi29qbZbxT5WyeiXZnUAxC7tcs
         qgsyfloXaIA7TtEZ6DoAn8yjJv+5uh8FlnTXrf/xdjBgSVz0D/ObXAarv5+v2D0SV1Zy
         jfG5yqGrJ/+Hv4xaaOTVjLbUh0irW7yX7ZEpUjH1x0TZ1Wd7jQKb7eAC8rhksFptmTsP
         0ckTjbwRS/SExzSDGdt+AaznGb+Y7j7/XuGAlbDzmj50ry/aNKTsl/oHty5+HPSwTSbU
         g/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753812266; x=1754417066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HCWKguqPM8rKcqBM1k3B00wsHXW0z11MmTR21pRsbI=;
        b=qM5LWypK0Yn9SCXfz+MP26Q4H6e7AJ5si94I2bkNUn1a2fzCtS+5iajPu1BkRElXtV
         Rq3Nz1J5YXiy2cSqXqi9jJhRZge6iydUttKg/X1cjAc4Zk3jlSCBZA1RsE1PGGu1XFl8
         yUg8KsNo86Un50dGjz3rBhioMK4CMr9MsDyAOoA2Ey8Tz82A7nIuKeOJsX9hJw2Xe2t2
         wWSLAf85NCAS2lG8olthuUA5PH6h633TizuudFyKgpqOM8bGdph3eN2kXb9iyX/I7NwV
         7dNDUawNMJvnXufiLMGwP7QfN72wkFLn+lb5v4WgRcnQfN928RB1TyR6eg8mQbqoCfYN
         +kNA==
X-Forwarded-Encrypted: i=1; AJvYcCWY0xnxSptzZie/RP7d3LK0NS07LTBshuX1NKtGdOjSiRpI31ltjJlrrUbrL+GxnECuLacQUMMiJ5P/zw0=@vger.kernel.org, AJvYcCWjwjUVhBhEAu41UuqFvbkKDngR+N4vCthU2rO3bAZi3YYI3mtk5e5yeIVWnL1CZixtO8LgDnSNNTvcf+7RwtEZJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+5LJnGy3SKY/bMCboUGx4apzdr3B4KEba77/mrP0r4BCKVu9
	j77cJHxS0QryMUCq4aTdfqWlnsUizmLFviKWnRKpxGEMsUr3omuq/jfN
X-Gm-Gg: ASbGncvNeYmJ//xH3JRMQhg46vQeuZ0slVyVqnG61AXQY6KnDVJQoW99LMwRYMX8MtY
	y3/UYKnqHW49tCYaiIaH0SUI66p/qmon2XeX0vfWdP9uco5rHy7KcSNC+IsIWj9ZhhxIFpqgEIs
	EwHiNRrG6ktKROwC1kv0F8COK6pABMIl3jpJ6HrgDVbKXer0hlo3162f7bdPc5OttmgEzIdb3lZ
	tXjN9NJV453Hc+OImmG1RZXNTlbYRr6U+s5uD7KcUIe2GC9GnK3pIoVo8v+/Xy0tVZCb9BPebgV
	cphRnCBZdhatt++n5/Ta8P2Sm87FI/0jEPE6kVtsH7YqKH0slBSoVWwax9amfia2ap4oTT3/om/
	vZo1buivEaEayvjG7Hd4=
X-Google-Smtp-Source: AGHT+IHtjmaJ+Hys0d08huFRCCxkuYd8iHosIpWA9GwdImpisAebg0nAdQGm17eccN5BKlRqFxcWGg==
X-Received: by 2002:a05:6a20:6a22:b0:237:ddd8:a3cd with SMTP id adf61e73a8af0-23dc0e2b3ffmr540557637.28.1753812265717;
        Tue, 29 Jul 2025 11:04:25 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c2:baea:356b:cf45:658:2b82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67d84esm6264631a12.42.2025.07.29.11.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 11:04:24 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:04:20 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Andrew Davis <afd@ti.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <20250729180420.svxtcukjlgg5sv6p@hiagonb>
References: <20250726143908.ayug6dedkmzulldx@hiagonb>
 <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>

On Sat, Jul 26, 2025 at 12:48:14PM -0500, Andrew Davis wrote:
> On 7/26/25 9:39 AM, Hiago De Franco wrote:
> > Hi Andrew, Beleswar,
> > 
> > On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
> > > 
> > > So the issue then looks to be this message we send here when we setup
> > > the mailbox[0]. This mailbox setup is done during probe() for the K3
> > > rproc drivers now (mailbox setup used to be done during
> > > rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> > > is correct, but we should have factored out the test message sending
> > > code out of mailbox setup so it could have been left in
> > > rproc_{start,attach}(). That way we only send this message if the
> > > core is going to be started, no sense in sending that message if
> > > we are not even going to run the core..
> > > 
> > > Fix might be as simple as [2] (not tested, if this works feel free
> > > to send as a fix)
> > 
> > I tested the patch and it works, thanks!
> > 
> > > 
> > > Andrew
> > > 
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> > > [2]
> > > 
> > > diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> > > index a70d4879a8bea..657a200fa9040 100644
> > > --- a/drivers/remoteproc/ti_k3_common.c
> > > +++ b/drivers/remoteproc/ti_k3_common.c
> > > @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> > >   }
> > >   EXPORT_SYMBOL_GPL(k3_rproc_reset);
> > > +static int k3_rproc_ping(struct k3_rproc *kproc)
> > > +{
> > > +       /*
> > > +        * Ping the remote processor, this is only for sanity-sake for now;
> > > +        * there is no functional effect whatsoever.
> > > +        *
> > > +        * Note that the reply will _not_ arrive immediately: this message
> > > +        * will wait in the mailbox fifo until the remote processor is booted.
> > > +        */
> > > +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> > > +       if (ret < 0)
> > > +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >   /* Release the remote processor from reset */
> > >   int k3_rproc_release(struct k3_rproc *kproc)
> > >   {
> > > @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
> > >          if (ret)
> > >                  dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
> > > +       k3_rproc_ping(kproc);
> > > +
> > >          return ret;
> > >   }
> > >   EXPORT_SYMBOL_GPL(k3_rproc_release);
> > > @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> > >                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > >                                       "mbox_request_channel failed\n");
> > > -       /*
> > > -        * Ping the remote processor, this is only for sanity-sake for now;
> > > -        * there is no functional effect whatsoever.
> > > -        *
> > > -        * Note that the reply will _not_ arrive immediately: this message
> > > -        * will wait in the mailbox fifo until the remote processor is booted.
> > > -        */
> > > -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> > > -       if (ret < 0) {
> > > -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> > > -               mbox_free_channel(kproc->mbox);
> > > -               return ret;
> > > -       }
> > > -
> > >          return 0;
> > >   }
> > >   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > > @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
> > >    * remote core. This callback is invoked only in IPC-only mode and exists
> > >    * because rproc_validate() checks for its existence.
> > >    */
> > > -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> > > +int k3_rproc_attach(struct rproc *rproc)
> > > +{
> > > +       k3_rproc_ping(rproc->priv);
> > > +
> > > +       return 0;
> > > +}
> > >   EXPORT_SYMBOL_GPL(k3_rproc_attach);
> > >   /*
> > > 
> > 
> > On Sat, Jul 26, 2025 at 07:47:34PM +0530, Beleswar Prasad Padhi wrote:
> > > > 
> > > > So the issue then looks to be this message we send here when we setup
> > > > the mailbox[0]. This mailbox setup is done during probe() for the K3
> > > > rproc drivers now (mailbox setup used to be done during
> > > > rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> > > > is correct, but we should have factored out the test message sending
> > > > code out of mailbox setup so it could have been left in
> > > > rproc_{start,attach}().
> > > 
> > > 
> > > Or, how about we don't send that test mbox message at all. It does not
> > > actually check if the remoteproc was able to receive and respond to the
> > > message. It only verifies if the write to the mbox queue was successful. And
> > > most firmwares anyways don't reply to that mailbox-level echo message.
> > 
> > I was thinking about the same.
> > 
> > I tested the patch and it indeed works, however when I boot the remote
> > core with a hello world firwmare from the TI MCU SDK (with IPC enabled
> > with the sysconfig), the ping is sent but M4 never replies to it, which
> > at the end causes an unread message to stay there. Later, if I stop the
> > remote processor, I can not got into suspend mode again because of this
> > message.
> > 
> > So I believe we should never send the message or clear the mailbox when
> > the remote processor is stopped, but I was not able to find a way to
> > clear the mailbox. So, is it ok if we never send the ping?
> > 
> 
> So right now it is okay to not send that ping, and in the past I've
> thought about removing it (it is a bit of a legacy hold-over from
> the OMAP RProc driver. Back then we would send other messages like
> suspend and shutdown requests, you can see the different messages
> here[0]. Actually using those messages never got upstream, only the
> ping message part did.
> 
> For K3 we want to start making use of all these other messages and
> upstream the support for the same. So removing the ping test message
> felt like a step backwards as it is a good placeholder for the more
> important messages we want to send later. But as said, removing it
> is probably fine for now.
> 
> The second thing on the roadmap is to better deal with messages left
> in the mailbox queue when we try to suspend. Basically on suspend the
> mailbox IP is powered down and all messages waiting will be lost, this
> can cause issues. Instead of blocking suspend, one other option would
> be to attempt to read out these messages and restore them on resume.
> This state saving would match what most other IP drivers. This would
> fix issues like the above were the firmware doesn't consume a message
> for whatever reason. But until we implement that, either we throw out
> messages on suspend, or we block suspend.

Got it, thanks for you explanation Andrew. I am out this week, so next
week I will propose a patch so we can turn around this issue.

Thanks!

Hiago.

> 
> Andrew
> 
> [0] drivers/remoteproc/omap_remoteproc.h
> 
> > Best regards,
> > Hiago.
> > 
> > > 
> > > Thanks,
> > > Beleswar
> > > 
> > > > That way we only send this message if the
> > > > core is going to be started, no sense in sending that message if
> > > > we are not even going to run the core..
> > > > 
> > > > Fix might be as simple as [2] (not tested, if this works feel free
> > > > to send as a fix)
> > > > 
> > > > Andrew
> > > > 
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> > > > [2]
> > > > 
> > > > diff --git a/drivers/remoteproc/ti_k3_common.c
> > > > b/drivers/remoteproc/ti_k3_common.c
> > > > index a70d4879a8bea..657a200fa9040 100644
> > > > --- a/drivers/remoteproc/ti_k3_common.c
> > > > +++ b/drivers/remoteproc/ti_k3_common.c
> > > > @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_reset);
> > > > 
> > > > +static int k3_rproc_ping(struct k3_rproc *kproc)
> > > > +{
> > > > +       /*
> > > > +        * Ping the remote processor, this is only for sanity-sake for
> > > > now;
> > > > +        * there is no functional effect whatsoever.
> > > > +        *
> > > > +        * Note that the reply will _not_ arrive immediately: this
> > > > message
> > > > +        * will wait in the mailbox fifo until the remote processor is
> > > > booted.
> > > > +        */
> > > > +       int ret = mbox_send_message(kproc->mbox, (void
> > > > *)RP_MBOX_ECHO_REQUEST);
> > > > +       if (ret < 0)
> > > > +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n",
> > > > ERR_PTR(ret));
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > >   /* Release the remote processor from reset */
> > > >   int k3_rproc_release(struct k3_rproc *kproc)
> > > >   {
> > > > @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
> > > >          if (ret)
> > > >                  dev_err(dev, "module-reset deassert failed (%pe)\n",
> > > > ERR_PTR(ret));
> > > > 
> > > > +       k3_rproc_ping(kproc);
> > > > +
> > > >          return ret;
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_release);
> > > > @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> > > >                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > > >                                       "mbox_request_channel failed\n");
> > > > 
> > > > -       /*
> > > > -        * Ping the remote processor, this is only for sanity-sake for
> > > > now;
> > > > -        * there is no functional effect whatsoever.
> > > > -        *
> > > > -        * Note that the reply will _not_ arrive immediately: this
> > > > message
> > > > -        * will wait in the mailbox fifo until the remote processor is
> > > > booted.
> > > > -        */
> > > > -       ret = mbox_send_message(kproc->mbox, (void
> > > > *)RP_MBOX_ECHO_REQUEST);
> > > > -       if (ret < 0) {
> > > > -               dev_err(dev, "mbox_send_message failed (%pe)\n",
> > > > ERR_PTR(ret));
> > > > -               mbox_free_channel(kproc->mbox);
> > > > -               return ret;
> > > > -       }
> > > > -
> > > >          return 0;
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > > > @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
> > > >    * remote core. This callback is invoked only in IPC-only mode and
> > > > exists
> > > >    * because rproc_validate() checks for its existence.
> > > >    */
> > > > -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> > > > +int k3_rproc_attach(struct rproc *rproc)
> > > > +{
> > > > +       k3_rproc_ping(rproc->priv);
> > > > +
> > > > +       return 0;
> > > > +}
> > > >   EXPORT_SYMBOL_GPL(k3_rproc_attach);
> > > > 
> > > >   /*
> > > > 
> 
