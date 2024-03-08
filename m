Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829318C1A
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Mar 2024 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709916281; cv=none; b=aaQ0IbyrCDowLOGQdAV4ou+6XLMONhGlFeLTQTHOEvrb5KxL8/DhLTvtXopfntAAm+SCa/JrbA44PUk0FLKOTgfQ6cKdpPoGu2VEf5upQqvD/Z5oC9qyeFTH2S+rnnj9i3fbPhu/m1i6w6MBuKibM/13ha01IjB1c84Ul8ONppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709916281; c=relaxed/simple;
	bh=UrEBxQszULiVbIBPuPmBCRY25FgHIkpOHvzckOGcYBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0MS29kT7CqEF3j6/x0mMDHpM77NvmhQVnt/YpeidSikZyj5MB/90MWoGXgRGgiN0oIU32TYS+rkq2INFbjoPcQ5Fooyb1FKfBdz+Oq5eA8HA0J/p7qRt28FyEYsZ8xVU4QYYAig/gsy7zAR36EoE0OvIKp0h7fBjd0oPsG9wAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jl7rqKZQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jl7rqKZQ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d28051376eso11790191fa.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Mar 2024 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709916278; x=1710521078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3pb+tQdggieSesTRk+wpBTn9tTjLUrGvHa4LzSreo9I=;
        b=Jl7rqKZQUbNsEN2TjWILnxe/pkkpYbGnT0rtG+ApWGvXpMkTLvke6WoQ05k3Ey+a70
         Dv7Txoe8sfQccoo7hvFHwlc07nqTvuWSJCPOKnWHktuC6gC2oqWwWJB8kgMWceN4W/I8
         0ciSTnee+VUPKpxwNyuiU74Qkz3aRJjlw+wjMtSJaOq7hpJfyD105+ddBAQB74kbMlA+
         afVFkcSOlhVxYP+zLkUPsQJR6u2L4zpWXhZ5/N6KUHDgRsEDjsmndCZmh33txekWjtQO
         yFjEmzI9jyUhSns6YNk3PH9akKvBc5wnePEvpDlRo+bdA+rFrOa6xI09tv++WyoMVPXT
         Sj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709916278; x=1710521078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pb+tQdggieSesTRk+wpBTn9tTjLUrGvHa4LzSreo9I=;
        b=Fk86xqIT7WJ6vikM7U2OX64yWfRLUmcbz4+hBfcwK6eoGEXXV93tJmJCFX1wanLG10
         b1yZgNZNvTMY/VH4mIx++1SFZos1grhoYQ47w72GGguGsFRfR/uig49HRtG1cv0rr8RY
         8a2qWAvA5BzlXq83nTWQc1M2SVxoDxPm0AAYgZJKAM+7XyX7ZmM6ySKVbob/hRvSJv2a
         7PVOQscJYsmVaEyzdRoL93Xz8UYVgiFZg0O99vg6OhdC2RGJWWdYhYRvUBymX3Gtw3YN
         cR5veGP611fbwbCRWsYWbw+O62xfHZh0j5jAnum5QxXXNYzBWSSsTrGQbkNgSEeburr6
         wMIw==
X-Forwarded-Encrypted: i=1; AJvYcCVYLo/35Qd1jAQ3FDqp4B1kKkKb5EG313wjcIhL3+P4EHSasKogqy7N8Ch2AeoXmgZSnkIhm4hv9wX67s4L4CcFjtMDDnpXUxBlaZN1Gs3ctw==
X-Gm-Message-State: AOJu0YyvM58GqSTX7rgmLSVKMOZPLrUBv39cUy/dPbd8Ax2YRiMPBXpa
	TNmJNyFyw96rTDZ838OU+TJZrX4AM6OMlkA3Z7tSsZBEobWMUQlBVbvZ1YNDW4/EnEdnU0u5E+c
	++SBrcbXguTYBspV5EzQQGBQmIGubtRcMCbbauQ==
X-Google-Smtp-Source: AGHT+IGSEiadE1M7hzpNQ204ASdBT/8qGfuylY/6QNi4hO5JxEG2URQ276EsCZjORAMhtcwTRiKYB5Z6qnoZK/RfDLE=
X-Received: by 2002:a2e:a9a2:0:b0:2d3:93dd:c54b with SMTP id
 x34-20020a2ea9a2000000b002d393ddc54bmr4587311ljq.25.1709916277656; Fri, 08
 Mar 2024 08:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301164227.339208-1-abdellatif.elkhlifi@arm.com>
 <20240301164227.339208-2-abdellatif.elkhlifi@arm.com> <ZeYWKVpeFm1+4mlT@p14s> <20240307194026.GA355455@e130802.arm.com>
In-Reply-To: <20240307194026.GA355455@e130802.arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 8 Mar 2024 09:44:26 -0700
Message-ID: <CANLsYkzA20rQdTM6AOvFK=3o28GvcoRbckL=ri8RegHqyHaiCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] remoteproc: Add Arm remoteproc driver
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Drew.Reed@arm.com, Adam.Johnston@arm.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 12:40, Abdellatif El Khlifi
<abdellatif.elkhlifi@arm.com> wrote:
>
> Hi Mathieu,
>
> > > +   do {
> > > +           state_reg = readl(priv->reset_cfg.state_reg);
> > > +           *rst_ack = EXTSYS_RST_ST_RST_ACK(state_reg);
> > > +
> > > +           if (*rst_ack == EXTSYS_RST_ACK_RESERVED) {
> > > +                   dev_err(dev, "unexpected RST_ACK value: 0x%x\n",
> > > +                           *rst_ack);
> > > +                   return -EINVAL;
> > > +           }
> > > +
> > > +           /* expected ACK value read */
> > > +           if ((*rst_ack & exp_ack) || (*rst_ack == exp_ack))
> >
> > I'm not sure why the second condition in this if() statement is needed.  As far
> > as I can tell the first condition will trigger and the second one won't be
> > reached.
>
> The second condition takes care of the following: exp_ack and  *rst_ack are both 0.
> This case happens when RST_REQ bit is cleared (meaning: No reset requested) and
> we expect the RST_ACK to be 00 afterwards.
>

This is the kind of conditions that definitely deserve documentation.
Please split the conditions in two different if() statements and add a
comment to explain what is going on.

> > > +/**
> > > + * arm_rproc_load() - Load firmware to memory function for rproc_ops
> > > + * @rproc: pointer to the remote processor object
> > > + * @fw: pointer to the firmware
> > > + *
> > > + * Does nothing currently.
> > > + *
> > > + * Return:
> > > + *
> > > + * 0 for success.
> > > + */
> > > +static int arm_rproc_load(struct rproc *rproc, const struct firmware *fw)
> > > +{
> >
> > What is the point of doing rproc_of_parse_firmware() if the firmware image is
> > not loaded to memory?  Does the remote processor have some kind of default ROM
> > image to run if it doesn't find anything in memory?
>
> Yes, the remote processor has a default FW image already loaded by default.
>

That too would have mandated a comment - otherwise people looking at
the code are left wondering, as I did.

> rproc_boot() [1] and _request_firmware() [2] fail if there is no FW file in the filesystem or a filename
> provided.
>
> Please correct me if I'm wrong.

You are correct, the remoteproc subsystem expects a firmware image to
be provided _and_ loaded into memory.  Providing a dummy image just to
get the remote processor booted is a hack, but simply because the
subsystem isn't tailored to handle this use case.  So I am left
wondering what the plans are for this driver, i.e is this a real
scenario that needs to be addressed or just an initial patchset to get
a foundation for the driver.

In the former case we need to start talking about refactoring the
subsystem so that it properly handles remote processors that don't
need a firmware image.  In the latter case I'd rather see a patchset
where the firmware image is loaded into RAM.

>
> [1]: https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/remoteproc/remoteproc_core.c#L1947
> [2]: https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/base/firmware_loader/main.c#L863
>
> > > +module_platform_driver(arm_rproc_driver);
> > > +
> >
> > I am echoing Krzysztof view about how generic this driver name is.  This has to
> > be related to a family of processors or be made less generic in some way.  Have
> > a look at what TI did for their K3 lineup [1] - I would like to see the same
> > thing done here.
>
> Thank you, I'll take care of that and of all the other comments made.
>
> Cheers,
> Abdellatif
