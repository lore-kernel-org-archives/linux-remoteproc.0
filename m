Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8221348;
	Sat, 26 Jul 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753540755; cv=none; b=kjOh1Pqv5RvDmILzBelS7WtOLX/6GPbBLC1WeWux46BTOv3YDzME9k7odaX6Fkk0+t3gXGUDHFay7uSZN76UNKKhhtjJRfkyTN+e4Ado1tglfwHR2N2ylmxVdBLz2rPssbxf4DOkxOnrn7jWPcpCUn/JlsFmdKNlw8x0YlY12oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753540755; c=relaxed/simple;
	bh=tDVmoyQPgyFgvJ55XLC+3Kk+eqR/HIeCcQp4QbHgpHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ueJ1re9jWQ5jZTBpzN1ih3JH90V/svVqqmw8nGBU4Nzj2t1MIk+MGSikpS+v6TNxVvbud2RmlsUMsCdeZPMJvjWGpC+qhfrrJv3DnDq8eHfYbGuaiNw3gD2DOgubTEsPd/MOkDyu8un/PqBECGJ6xDSx4VErdSnLqpzqTxrtGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzhs0haf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzhs0haf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236470b2dceso26373895ad.0;
        Sat, 26 Jul 2025 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753540753; x=1754145553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uckONOxLpaUfmuLZ5CDh7eJBrThy53oiEqc6yosnbjc=;
        b=Zzhs0hafD3ITIbn+umhy0DZT8jWLp1fIipKYHToi/qrWWergD6wQEeuNN/Vqa/aGfU
         +MiKbdahRmBOF6E7TSihMq5rnYvgKSt/zT6tR6cTkEusAMpFlTo2ttUZzHnpZC8tbZ9E
         w3eckNQhq9MZ4JOEEwJWtQpxluOTkOUQC/wuOUKe4YyOMg+1KxChjsPysJ/8paVkzQ5L
         ixcD/vkZ5OgI7GkJIVA3g2ofQ6sbCkzjR+oZGciZVu3+EDFnNc2dRughc9RXeVKuMTNH
         57Dfh9zs9dYnxohjonA4t7wWSkCSD5DFKSlnFCfU0hXGvXv6JW9eiLGyQ2WfjxaXDfpg
         ljcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753540753; x=1754145553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uckONOxLpaUfmuLZ5CDh7eJBrThy53oiEqc6yosnbjc=;
        b=HNzFqpznZJkpkD/JYKwhxxOPbJPkDLp4iaSeMRDojQE6zv7hLvUFr8CSot23A83T73
         9ARb2AMTk7/k4SWvUS86kklCpCGWyhh2Eu0jZUtKKfh+cGvV3STnZie8VtEOPFNjLVP+
         WNudTXDQvSzV3Du0b8EG6Ehq+WTwAYgHruZS1EWwRbM0czp8IPRkDyzoxKgFsFNWnCLW
         LIy/sfHNa/fLp39/PDHadEC2Hj8xoVraTvBQmQg6TYszqbArCSDVx+FwknRIfGxmt8vt
         FvVunrUYlENd1x1hVkPPi2KrT8dD7SZa5DEfI5i44Ng2bSXulb79zZB/N+AH3BapEfgB
         /e2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiQbZcSHkEtm/Tyzciqc4Bs+vaiB8/o0z9tGjaUwjM1LPGwRVl69URon41l9r4uEIdWmNEOgAgE1VfWeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbDrGUsOOJoUlFsm18DQuBEZesxTXtB1n+PJPH4Fjci6N3IMr
	59hq7dUa/XZO2rCh0a55quHHUSkXe1hF52HI4xge9HkoNb9YxcYF4Oec
X-Gm-Gg: ASbGncvkJpvMKKfWJ4CafHGJAyaw5DzZw8k7RHOKrOSZ0akQoCrh98bOuKIsdVAhdju
	cpoib8JlZXUFFvmI9HQQZ0LJ90YyAdKPZlrpiXBRMsY2EYdwscwoYbIC1vd5oKTsQTP6vmSYT+8
	0ifbatdWs0x7KI44J4+NJroT/0F6yf9vOgVsBjnohPP45bi8Oc1eIgs1EzuwjcY+2f0+5zR968h
	pgKI4kag5cZaPKvRKONCoqBdF1KLkWLsp6yKWfm1vPJmGJVoUzHWlEuW4TdHJ4hAlq0m5sLtsMY
	3Xc7aadYuulEoqpGitWV4ZFw9X7Hj3JjhkT3TDxPUecjQw8cK4ceY71iuKUj+PsoheIfXxFxne9
	wQPM1E/DdydXmOjIyyuhy
X-Google-Smtp-Source: AGHT+IGmhMJaMsUACTCz4podx8Hejaj98cCPGUS6QJZQ5/VavnYAkSMTLHtTxHOXgoxak7+bC4M7YQ==
X-Received: by 2002:a17:903:1c2:b0:234:ef42:5d69 with SMTP id d9443c01a7336-23fb30995c3mr95854375ad.13.1753540752863;
        Sat, 26 Jul 2025 07:39:12 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c2:9aee:45f1:9356:31f6:cecb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe515300sm18497365ad.151.2025.07.26.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 07:39:12 -0700 (PDT)
Date: Sat, 26 Jul 2025 11:39:08 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Andrew Davis <afd@ti.com>, Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <20250726143908.ayug6dedkmzulldx@hiagonb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06186d01-23e7-4fd6-b5c0-b6c1f8ae7fb7@ti.com>
 <616fbb7a-8d04-48aa-b3cb-9a1a69c7b92c@ti.com>

Hi Andrew, Beleswar,

On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
> 
> So the issue then looks to be this message we send here when we setup
> the mailbox[0]. This mailbox setup is done during probe() for the K3
> rproc drivers now (mailbox setup used to be done during
> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> is correct, but we should have factored out the test message sending
> code out of mailbox setup so it could have been left in
> rproc_{start,attach}(). That way we only send this message if the
> core is going to be started, no sense in sending that message if
> we are not even going to run the core..
> 
> Fix might be as simple as [2] (not tested, if this works feel free
> to send as a fix)

I tested the patch and it works, thanks!

> 
> Andrew
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> [2]
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index a70d4879a8bea..657a200fa9040 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_reset);
> +static int k3_rproc_ping(struct k3_rproc *kproc)
> +{
> +       /*
> +        * Ping the remote processor, this is only for sanity-sake for now;
> +        * there is no functional effect whatsoever.
> +        *
> +        * Note that the reply will _not_ arrive immediately: this message
> +        * will wait in the mailbox fifo until the remote processor is booted.
> +        */
> +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> +       if (ret < 0)
> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> +
> +       return ret;
> +}
> +
>  /* Release the remote processor from reset */
>  int k3_rproc_release(struct k3_rproc *kproc)
>  {
> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>         if (ret)
>                 dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
> +       k3_rproc_ping(kproc);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_release);
> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>                 return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>                                      "mbox_request_channel failed\n");
> -       /*
> -        * Ping the remote processor, this is only for sanity-sake for now;
> -        * there is no functional effect whatsoever.
> -        *
> -        * Note that the reply will _not_ arrive immediately: this message
> -        * will wait in the mailbox fifo until the remote processor is booted.
> -        */
> -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> -       if (ret < 0) {
> -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> -               mbox_free_channel(kproc->mbox);
> -               return ret;
> -       }
> -
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>   * remote core. This callback is invoked only in IPC-only mode and exists
>   * because rproc_validate() checks for its existence.
>   */
> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> +int k3_rproc_attach(struct rproc *rproc)
> +{
> +       k3_rproc_ping(rproc->priv);
> +
> +       return 0;
> +}
>  EXPORT_SYMBOL_GPL(k3_rproc_attach);
>  /*
> 

On Sat, Jul 26, 2025 at 07:47:34PM +0530, Beleswar Prasad Padhi wrote:
> > 
> > So the issue then looks to be this message we send here when we setup
> > the mailbox[0]. This mailbox setup is done during probe() for the K3
> > rproc drivers now (mailbox setup used to be done during
> > rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> > is correct, but we should have factored out the test message sending
> > code out of mailbox setup so it could have been left in
> > rproc_{start,attach}().
> 
> 
> Or, how about we don't send that test mbox message at all. It does not
> actually check if the remoteproc was able to receive and respond to the
> message. It only verifies if the write to the mbox queue was successful. And
> most firmwares anyways don't reply to that mailbox-level echo message.

I was thinking about the same.

I tested the patch and it indeed works, however when I boot the remote
core with a hello world firwmare from the TI MCU SDK (with IPC enabled
with the sysconfig), the ping is sent but M4 never replies to it, which
at the end causes an unread message to stay there. Later, if I stop the
remote processor, I can not got into suspend mode again because of this
message.

So I believe we should never send the message or clear the mailbox when
the remote processor is stopped, but I was not able to find a way to
clear the mailbox. So, is it ok if we never send the ping?

Best regards,
Hiago.

> 
> Thanks,
> Beleswar
> 
> > That way we only send this message if the
> > core is going to be started, no sense in sending that message if
> > we are not even going to run the core..
> > 
> > Fix might be as simple as [2] (not tested, if this works feel free
> > to send as a fix)
> > 
> > Andrew
> > 
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> > [2]
> > 
> > diff --git a/drivers/remoteproc/ti_k3_common.c
> > b/drivers/remoteproc/ti_k3_common.c
> > index a70d4879a8bea..657a200fa9040 100644
> > --- a/drivers/remoteproc/ti_k3_common.c
> > +++ b/drivers/remoteproc/ti_k3_common.c
> > @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> >  }
> >  EXPORT_SYMBOL_GPL(k3_rproc_reset);
> > 
> > +static int k3_rproc_ping(struct k3_rproc *kproc)
> > +{
> > +       /*
> > +        * Ping the remote processor, this is only for sanity-sake for
> > now;
> > +        * there is no functional effect whatsoever.
> > +        *
> > +        * Note that the reply will _not_ arrive immediately: this
> > message
> > +        * will wait in the mailbox fifo until the remote processor is
> > booted.
> > +        */
> > +       int ret = mbox_send_message(kproc->mbox, (void
> > *)RP_MBOX_ECHO_REQUEST);
> > +       if (ret < 0)
> > +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n",
> > ERR_PTR(ret));
> > +
> > +       return ret;
> > +}
> > +
> >  /* Release the remote processor from reset */
> >  int k3_rproc_release(struct k3_rproc *kproc)
> >  {
> > @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
> >         if (ret)
> >                 dev_err(dev, "module-reset deassert failed (%pe)\n",
> > ERR_PTR(ret));
> > 
> > +       k3_rproc_ping(kproc);
> > +
> >         return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(k3_rproc_release);
> > @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
> >                 return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> >                                      "mbox_request_channel failed\n");
> > 
> > -       /*
> > -        * Ping the remote processor, this is only for sanity-sake for
> > now;
> > -        * there is no functional effect whatsoever.
> > -        *
> > -        * Note that the reply will _not_ arrive immediately: this
> > message
> > -        * will wait in the mailbox fifo until the remote processor is
> > booted.
> > -        */
> > -       ret = mbox_send_message(kproc->mbox, (void
> > *)RP_MBOX_ECHO_REQUEST);
> > -       if (ret < 0) {
> > -               dev_err(dev, "mbox_send_message failed (%pe)\n",
> > ERR_PTR(ret));
> > -               mbox_free_channel(kproc->mbox);
> > -               return ret;
> > -       }
> > -
> >         return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> > @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
> >   * remote core. This callback is invoked only in IPC-only mode and
> > exists
> >   * because rproc_validate() checks for its existence.
> >   */
> > -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> > +int k3_rproc_attach(struct rproc *rproc)
> > +{
> > +       k3_rproc_ping(rproc->priv);
> > +
> > +       return 0;
> > +}
> >  EXPORT_SYMBOL_GPL(k3_rproc_attach);
> > 
> >  /*
> > 
