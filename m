Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671531AF4E0
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Aug 2024 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259506; cv=none; b=LcqQlD0gsZAWOdOAoAscOXMNEYJGPlbRZ6YsGFZ0X9Gcb5i1Yt3yEFLNuDcsY4WsciUnNofTrD+oH1MzRBGYYeQIYy5dRPIEF2vDRBKsf0BDNMXjjESTYw39LyYOg9MI9SWWh2pvh1N11YSIUbtnGx8EPKJoV+NKc5twBxvPXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259506; c=relaxed/simple;
	bh=qTIOmQ2c7OE8BlsXUZPRgkdCOuSnmKWJ+/+jBdLEtwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPvayB9aHrqm4Q6OsM+Y1mDHQfxh8zJ52MOvg0/kXMEVrm58hXywQQPBw74T5dQ2IJaQrA7X+Skn6Nilf1mpOJMnCJ9ECDvgaEJ7FhDT8LSeFuiCi7GA4ylXYA7m6IadOcpuZkt1baqWeRYZJcaBYD/1u6LgBoKGFsPWWBieB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sixsm7mD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sixsm7mD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso6164520a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Aug 2024 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724259503; x=1724864303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77mIQqg0l3Qo1gLZN8aEs42X01Sfq+eWXCKq3Yb3JEo=;
        b=sixsm7mDs8DvSpYWmBe7Tp3IWKunla7od8OAnfW4wQRYw5PtceZKMrnqLlRxLtf6do
         dXYoUhmMRGEexn2YVM19edUtMs760XQdyu3H1hJKp7Per6xURcDl6COcYSmgPtkE75xF
         jH/t/bnzZzJU0F024X0ozK+Wqkgp3CG3cSa7vwlTTIDtFuC1T2XRl5mhKrBOlM7R9nDs
         4otAvfW6yk6RHetd9KyrBG7+JfxrLDFgr2EfLUTUTKI5hrbdOL3S2maBFxUCaoZwiXqH
         WYz+p+E+uRTxm0ObxW4xY3KJRKE2hjhGj6DCVvgP1NhwKVTu/OC/ejFHPOcWmOol5ON9
         5SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724259503; x=1724864303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77mIQqg0l3Qo1gLZN8aEs42X01Sfq+eWXCKq3Yb3JEo=;
        b=NbSX9umoWl0oDZisQDF129H5U49SV9CY/6g74YSI5qq3OZA+WzCeNzk6+3g9SanJkt
         4e50j2ErPODVaZ4QOvqcwuLpo8RDXPWngsus9TG9ZHzh/KNzAzYr/Ofg+RXDbSwXRrgD
         1ssMUUcAyoxggbtmnqIIk7MhVQ+28L0+5qhjqHIDLeBwyrhj6wTLvQCk3ERVHyPr92ix
         sIbWWGAW5g8sUBqm3SeCWTVnPgL14D861FMblGWum820lejDHqVih+cazowp48o0gkSR
         +7BuoRynNv9ocCFUV9Ir71Oma6/DlEqp1SFZJh4vKUIi5Q0ZGxf7Q+gTU3ycUkStU+Hx
         b6oA==
X-Forwarded-Encrypted: i=1; AJvYcCV5LpmEhPi30lH2zrdYynNTEjNHukoHsu6465nBbkKPGWXOvehEPpdkkiKPcTEIl/itFDUOG45MrxKkoJYIk6un@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6xUPnju1r9/utHlWvnYC2xJPFyOH5QWbEXKf9WypB/glW/pY
	OCmBTRpTAYXMebgDRl+Bpd+Abnfqc5KqEMfYJcHJNxRref50iv9TX3TQUcdtJJhI6//v430/8tH
	JrDKRjOsSqAz8WzEen7Fzl95xfbGcZWHdOWRbYw==
X-Google-Smtp-Source: AGHT+IGB0eggZNl74UG/ixB4CbLG6EFWV4jovviRpJmRSwZVaFz5PVo/i92AKyHfoWxP5OBPCLzaHq6dCRWEUYYV2B0=
X-Received: by 2002:a05:6402:3484:b0:5be:fc1d:fd38 with SMTP id
 4fb4d7f45d1cf-5bf1f261d21mr2158359a12.36.1724259502577; Wed, 21 Aug 2024
 09:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com> <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
 <Zqe23DlboRPSXiQO@p14s> <CAEnQRZC4Oqyks+ok0vdoFxW1v1s5hfbM8EtdP8nUqxTXRZsRLA@mail.gmail.com>
In-Reply-To: <CAEnQRZC4Oqyks+ok0vdoFxW1v1s5hfbM8EtdP8nUqxTXRZsRLA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 21 Aug 2024 10:58:10 -0600
Message-ID: <CANLsYky_WPo6UXZXAMMLpQ-duf9OxZYvb4PRw4zUgisMcjWOvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for i.MX7ULP
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Aug 2024 at 02:32, Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> Hello Mathieu,
>
> I've talked to Peng and if my understanding is correct I think the patch is OK.
> Maybe we can split the patch in two:
> * first, adding the power off callback with explanations.
> * second, adding the restart callback with explanations.
>
> And also add a more detailed explanation.
>
> Power off and restart are totally different operations and are not complementary
> as I thought in the beginning. There are not like suspend/resume for example.
>
> > >  static int imx_rproc_probe(struct platform_device *pdev)
> > >  {
> > >       struct device *dev = &pdev->dev;
> > > @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >       if (rproc->state != RPROC_DETACHED)
> > >               rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> > >
> > > +     if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
> > > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > +                                                 SYS_OFF_PRIO_DEFAULT,
> > > +                                                 imx_rproc_sys_off_handler, rproc);
> >
> > Why does the mailbox needs to be set up again when the system is going down...
>
> Scenario: We call Linux *shutdown -P * command to power off the machine.
>
> At this point mailbox TX operation is configured as *blocking*. Power
> off is done via
> an atomic notifier call which doesn't allow blocking. If we do so we
> will endup in a kernel crash.
>
> So, at this moment we setup again the mailboxes configuring them with
> *non-blocking* option.
>
> >
> > > +             if (ret) {
> > > +                     dev_err(dev, "register power off handler failure\n");
> > > +                     goto err_put_clk;
> > > +             }
> > > +
> > > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> > > +                                                 SYS_OFF_PRIO_DEFAULT,
> > > +                                                 imx_rproc_sys_off_handler, rproc);
> >
> > ... and why does it need to be free'd when the system is going up?
>
> System is not going up here. System is running and we do a reboot.
>

Ah!  This is still on the downward path - I thought
"SYS_OFF_MODE_RESTART_PREPARE" was associated with the upward path,
when the system is restarted after a shutdown or a reboot.  That is
where the confusion came from.

> Scenario: We call Linux *shutdown -r* command to reboot the machine.
>
> Similarly, mailboxes are already set and configured as *blocking*. We
> cannot use the mailboxes
> as they are because reboot is done via an atomic notifier which if we
> call a blocking function it will endup in crash.
>
> So, we need to free the existing mailbox and create new ones with the
> *non-blocking* options.
>
> I think this is really fair to me. The one thing, I admit we must work
> on, create a better commit message.
>
> What do you say? Does this work for you?
>

Things are clear now and I agree with the implementation.  No need for
two separate patches, just a re-worked changelog.

Thanks,
Mathieu

> Thanks a lot for your help!
