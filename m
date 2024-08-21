Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6B15C152;
	Wed, 21 Aug 2024 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229181; cv=none; b=GEqd4BT4UTscDr+acZaRSLaT/CLWKWYoLI8iqLiRswbH0014gFQ+w9sx5d2rBMuskOMzsyqxKXQCzMP8zIVsHAeMzP0mSMUIUzU/jAiCqX2E/oQ9cddN7g9ll6TiaUbuBYtJHx6fWBexM/CErq4QxCt4uCk8dwIkAjDkDekVAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229181; c=relaxed/simple;
	bh=NV+tOA1UOz/iTe4bNktGSFNe352KUkNmwar1CDbpCSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktEKzJunJsS6NTzT699DhHWcert0ptaVbnDgBSl8//qth+x6iRNiPE1rND/aS4A9n83TYCgfZixGh8+7d7eJzyYaH4psgIV3ZscPklEgCWf2gQC9Ab4w3If+cwDrAIg5qs38q8AgkHlC2hjzdkSWId9MBGOgsfmLOq1WzKQgLi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDWghZmP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDWghZmP"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bf0261f162so3092242a12.0;
        Wed, 21 Aug 2024 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724229178; x=1724833978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TiK+7G6dPv+jiLpJYq4uvWBTS2IB+9YYcX0z6+IsEsU=;
        b=GDWghZmPdjo/5HZQbBO63UGsx+mQK1sOTTwC/uVrJCP9rrKAd4c2k3LFEcZOcbUksO
         FKAKDlve9L6RCqgwa1gOrHowx3UP8ckDeBmIA6GhVnVgH2Py++/p9kUVw7dp+ClqLmQP
         kYJyfHetY8kPd1ltzi0gNsQ6Gu8dBqvD13qqLoIQDn7JqOU1K8+ZcL8MRcCRaNgbh/Oi
         lblw7o1n8L6f0eV+nSnCSQqwcTLhwstGI4PNZ4qmy3Broxp8tnqvc7BTNKwycadQQSb9
         GYZa1B9y9COX9FZAcKt5/JwpoRzcz6/5tVPWJQMz7pQi7q5jg83pWzx59EUV8tQwaiUU
         cb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724229178; x=1724833978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiK+7G6dPv+jiLpJYq4uvWBTS2IB+9YYcX0z6+IsEsU=;
        b=B0qNRAQsqzaEz0acPa9Usb1VKK+bgUveTQWN65fzuGMRZR322oMGuk7v6bmW+MdSMx
         NwkQE+Clz0NVsFsKTJ7rz+9XtQQNnyBCkB83Yx42uksqU0RYnwDFmyYwkcGGL29OrQaa
         Z9esc/eYouu1eXMLPTk0mN9un5CSbsIHufhMjdnuHytK21tQmeG0HgWwQKwIMiNZN79d
         +yIaC9SFvURK4HzbTUoIdMeMF76bqxrBIuCxJghzx06vfS9/WqyPOtZECGOIioWR+Smh
         Io6GVdVgNZqtYNiGZ2vg73O9hgDQy+ma/LmIY9z/9tc74MlqfE0ki10G7CE6Fp0GzJlQ
         p1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUw9U1hX5QkZHRmZuc2WEUGg+uZEz1mZwwS3H6dZaLZ/qQrDDpqkLvEnr4udHwxMoef2h6/h2holwEE5Dd1omYMNA==@vger.kernel.org, AJvYcCWylevT8q7xc8L/YKIPt/iQdE1/+WWwOD4uo3ppZyKnYIMNN4MIXdtt6Xpu+ylNLy2SDo4ySD1F8B2dKQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9a/bDeTyTVsARCTRDieVLC0fy1xyztNPVoLpZ3BEvALqroba
	1xfd+ypnbfL7h7R8c0bgblEuIsqdaLXuQO31s7QIgYgAx9OwKSbnAZdzaQ1axUhBgyKcO27ScUF
	byTYlTqOLPX2TZFWHIf1B+aKThQ0=
X-Google-Smtp-Source: AGHT+IEpcPNclRlC8I8790mt0FWDo7p4bR9P71fXfJsWTMYcIsLtsjdEOLM3CNSH63KzkDld3TlrqtCK7Lo2s633mdQ=
X-Received: by 2002:a05:6402:190c:b0:5be:c73e:26e1 with SMTP id
 4fb4d7f45d1cf-5bf1f1666e6mr899972a12.22.1724229177227; Wed, 21 Aug 2024
 01:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com> <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
 <Zqe23DlboRPSXiQO@p14s>
In-Reply-To: <Zqe23DlboRPSXiQO@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Aug 2024 11:33:47 +0300
Message-ID: <CAEnQRZC4Oqyks+ok0vdoFxW1v1s5hfbM8EtdP8nUqxTXRZsRLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for i.MX7ULP
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hello Mathieu,

I've talked to Peng and if my understanding is correct I think the patch is OK.
Maybe we can split the patch in two:
* first, adding the power off callback with explanations.
* second, adding the restart callback with explanations.

And also add a more detailed explanation.

Power off and restart are totally different operations and are not complementary
as I thought in the beginning. There are not like suspend/resume for example.

> >  static int imx_rproc_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> > @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >       if (rproc->state != RPROC_DETACHED)
> >               rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> >
> > +     if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
> > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> > +                                                 SYS_OFF_PRIO_DEFAULT,
> > +                                                 imx_rproc_sys_off_handler, rproc);
>
> Why does the mailbox needs to be set up again when the system is going down...

Scenario: We call Linux *shutdown -P * command to power off the machine.

At this point mailbox TX operation is configured as *blocking*. Power
off is done via
an atomic notifier call which doesn't allow blocking. If we do so we
will endup in a kernel crash.

So, at this moment we setup again the mailboxes configuring them with
*non-blocking* option.

>
> > +             if (ret) {
> > +                     dev_err(dev, "register power off handler failure\n");
> > +                     goto err_put_clk;
> > +             }
> > +
> > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> > +                                                 SYS_OFF_PRIO_DEFAULT,
> > +                                                 imx_rproc_sys_off_handler, rproc);
>
> ... and why does it need to be free'd when the system is going up?

System is not going up here. System is running and we do a reboot.

Scenario: We call Linux *shutdown -r* command to reboot the machine.

Similarly, mailboxes are already set and configured as *blocking*. We
cannot use the mailboxes
as they are because reboot is done via an atomic notifier which if we
call a blocking function it will endup in crash.

So, we need to free the existing mailbox and create new ones with the
*non-blocking* options.

I think this is really fair to me. The one thing, I admit we must work
on, create a better commit message.

What do you say? Does this work for you?

Thanks a lot for your help!
