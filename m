Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CB2C21F1
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 May 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780117; cv=none; b=hOG4MUJMlncUeEdmAnBBzYScc19xDx8msXzN8L7EzAimuwM90POQqH+rmuWwtdcSknsfz20IEKX3/JPM3OWzJyOmo1URSSRPlEiXa6DXx0YMC3XpoKtR4H9JtJOsd+iIuo/0fR9eb8mNSExA9rWzqJOChu4nRhWmi9YDpNBTw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780117; c=relaxed/simple;
	bh=csxAARw7TMe4p9kUCeBN9DmScREv2ZSHrFWQS2btBrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr4ubhnRAUrLR9PxC0rnNgzza7SBFe1u3L2jOIE8vApxW3heMEHLQ5OblpkV7bDajPF6SsuJwbzBMWIppK0fgfT2xHIqpxjkxHnhagppqr2f0TcwoQwNR0bfI9vlHBMNU5LZjoUAZyvm0kPZGr+mXO9y7LzqT7IPzK15MfNn45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIyUK0xp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIyUK0xp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso60208b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 May 2026 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778780112; x=1779384912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=WIyUK0xpwJjitfqZkL4ciFH0O1UeUmNjyy+6Z8DeOIHkCMX0kg/sttsqFq8LcoV5Wp
         WP7XyM7xTxDLVe0/qpUvBcYj/3weEzGpKg/6IaPo68KgCvRwVQaiEUNsbDYWE6UHaXso
         Tb0dbsopqHRtWE6ZRVBzzvAKeV6CO2/DCYTUQekX8EOppnNbz6FmiLiwXpJ+RBGtvh8m
         yrysH+YuF2gGGSyFCnG0hEC4EUgjBl1C6gkYo2qjV+mYdLk0zd/RM+PV3C+fO0xGGRFI
         yC+iHEeOvVy8FaLGnvIrjkLLRG7RNbOtuLzjdit+RP79/seDhyydaxhrc+z/3A6oybFU
         G6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780112; x=1779384912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=j37+PhP2ZYlzMJgKW4Do/lu6Kesh927fRF+uFJdexiHDHoBUKuN9k53StoEVbPrJ4n
         M8Iaat4Tx/o+IKiK84ljLiYLOO3zjQJCsZ7JJhkB9JVs/FfTRGQJUeG+4NTisdzlQIL6
         NfHOnKE8JBp4TnRwFH1M3AWuiJD7M0xT8VUV8tdxW4CTdAeMZxMVMqsyyH8X0G7Z0nXa
         6MYv6TW0GEn7yKVl/eTRWpq7BHye5DMn9fH+fifjFAxyvPq5MV9n/1msMEDDT6HOar17
         0Y8dbajGg/FLAArMDP1aO4mrBq61LA9nC8dpqB3o7EKz4UyuS18JtfZPMKXgDf05IsBG
         fbYg==
X-Forwarded-Encrypted: i=1; AFNElJ/jhmck2oMt1ZDAnMJL1B6wfIaBySSII+ImMFd1IRv/hjN2S54a6owZbUHFqimBy9WnibFiGI9gIKU8nQGrlcp/@vger.kernel.org
X-Gm-Message-State: AOJu0Yywo3R93cldm0Oh17iSKbcWlkywauUOuqSjvMw7cEq4FOzWzWMB
	4fufL+BZpK70DOE5H6g6bMlkqM/YhNf8Dkgqn2xPd5urPMJKt8/U5juo3Q/iDeaRIUw=
X-Gm-Gg: Acq92OE7tJlpNylRu7oPwvZuLBHXYKG40meaJxktb46HftwlcJWpSXnf/R0hJS8ZLBr
	FVa/oHg1rpTTkjS7yK1iam6MKCAuW8HOmB1eh6J/CX4uu4rA6O9ot4VP7NsE6h5VKsoEnnOXHeI
	haM1YsbxHHFxbFvT2f8a+ya+CFcys8pohW43D3aSyfUh+6Lz3GHwNRtUTWD/npE7t08FTVMvi6j
	/qKgtIqmxwnKH9yGMFDpk+0Fs6XD8pQPzKWHD/9UU751DmA//Dn8L57x1+Szsw733cWZYq/3sil
	3oWPGbNCdos0AiFmngQXV+bxYd5+JJTU5jw5fPmXhjF7hJrN88/KXsffFzW/T9qtTF7qxlMKUru
	CZtwoxHNNkAxEG8xdEnnQOeFVzc4bKhu7zxIhQOXCE/0uJsqhCPgwOIpXWapajXqYRHl3Tmwj1q
	lobNzRXJ5MbpXES1Mq0O7fTjjQnNU=
X-Received: by 2002:a05:6a00:909a:b0:837:6bb9:acc1 with SMTP id d2e1a72fcca58-83f18dbabc2mr4476063b3a.13.1778780112051;
        Thu, 14 May 2026 10:35:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:30c0:f7f8:e305:407f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm3281092b3a.45.2026.05.14.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:35:11 -0700 (PDT)
Date: Thu, 14 May 2026 11:35:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Beleswar Prasad Padhi <b-padhi@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <agYHzH-nJLl1HFIn@p14s>
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
 <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Thursday, May 7, 2026 12:13 PM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Beleswar Prasad Padhi <b-padhi@ti.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > >  From my perspective, based on your proposal:
> > > > >   1) Linux should send a get_config message to the remote proc (0x405 ->
> > 0xD). 2) The remote processor would respond with the list of ports, associated
> > > > >      with an remote endpoint addresses.
> > > >
> > > >
> > > > Agreed, we can scale it for multiple remote endpoints like this.
> > > >
> > > > >   3) Linux would parse the response, compare it with the DT, enable the
> > GPIO
> > > > >      ports accordingly, creating it local endpoint and associating it with
> > > > >      the remote endpoint.
> > > > > Using name service to identify the ports should avoid step 1 & 2 ...
> > > >
> > > >
> > > > Yes, but won't that make a lot of hard-codings in the driver?
> > > >
> > > > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > > > +    { .name = "rpmsg-io-25" },
> > > > +    { .name = "rpmsg-io-32" },
> > > > +    { .name = "rpmsg-io-35" },
> > > > +    { },
> > > > +};
> > > >
> > > > What if tomorrow another vendor decides to add more remoteproc
> > > > controlled GPIO ports to Linux, they would have to update this
> > > > struct in the driver everytime. And the port indexes (25/32/35)
> > > > could also differ between vendors. We should make the driver dynamic
> > > > i.e. vendor agnostic.
> > > >
> > > > I think querying the remote firmware at runtime (step 1 & 2 above)
> > > > is a common design pattern and makes the driver vendor agnostic. But
> > > > feel free to correct me.
> > > >
> > >
> > > You are right. My proposal would require a patch in rpmsg-core. The
> > > idea of allowing a postfix in the compatible string has been discussed
> > > before, but, if I remember correctly, it was not concluded.
> > >
> > 
> > I also remember discussing this.  I even reviewed one of Arnaud's patch and
> > submitted one myself.  This must have been in 2020 and the reason why it wasn't
> > merged has escaped my memory.
> > 
> > > /* rpmsg devices and drivers are matched using the service name */
> > > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> > >                                 const struct rpmsg_device_id *id) {
> > >       size_t len;
> > >
> > > +     len = strnlen(id->name, RPMSG_NAME_SIZE);
> > > +     if (len && id->name[len - 1] == '*')
> > > +             return !strncmp(id->name, rpdev->id.name, len - 1);
> > >
> > >       return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> > > }
> > >
> > > Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty
> > > and a future rpmsg-i2c, we could use:
> > > static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > >     { .name = "rpmsg-io" },
> > >     { .name = "rpmsg-io-*" },
> > >     { },
> > > };
> > 
> > That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
> > rpmsg_gpio_channel_id_table[].  All we need is:
> > 
> > /* rpmsg devices and drivers are matched using the service name */ static inline
> > int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >                                  const struct rpmsg_device_id *id) {
> >  +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
> > 
> >  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> >  +     return strncmp(id->name, rpdev->id.name, len) == 0;
> > }
> > 
> 
> If we encode the port index directly into ept->src, for example:
> 
>     ept->src = (baseaddr << 8) | port_index;
>

There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would work
but not optimal on two front:

(1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As such
there is a possibility of conflict.  I concede the possibility is marginal, but
it still exists.

(2) By proceeding this way, the kernel exposes the GPIO controller it knows
about.  It is preferrable to have the remote processor tell the kernel about the
GPIO controller it wants.

I am done reviewing this revision.  Given the amount of refactoring needed, I
will not look at the code.  Please refer to this reply [1] for what I am
expecting in the next revision. 

[1]. https://lwn.net/ml/all/CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com/
 
> where baseaddr can be derived from the channel address, we can avoid the possible address conflict.
> 
> With this approach, the patch to rpmsg-core would no longer be necessary.
> 
> Thanks,
> Shenwei
> 
> > And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
> > GPIO controller in the DT.
> > 
> > >
> > > If exact name matching is strongly required, then this proposal would
> > > not be suitablea.
> > >
> > > A third option would be a combination of both approaches: instantiate
> > > the device using the same name service from the remote side, as done
> > > in rpmsg-tty. In that case, a get_config message, or a similar
> > > mechanism, would also be needed to retrieve the port information from the
> > remote side.
> > >
> > 
> > I'm not overly fond of a get_config message because it is one more thing we have
> > to define and maintain.
> > 
> > Arnaud: is there a get_config message already defined for rpmsg_tty?
> > 
> > Beleswar: Can you provide a link to a virtio device that would use a get_config
> > message?
> > 
> > > Tanmaya also proposed another alternative based on reserved addresses.
> > >
> > > At this point, I suggest letting Mathieu review the discussion and
> > > recommend the most suitable approach.
> > >
> > > Thanks,
> > > Arnaud
> > >
> > > > >
> > > > > At the end, whatever solution is implemented, my main concern is
> > > > > that the Linux driver design should, if possible, avoid adding
> > > > > unnecessary complexity or limitations on the remote side (for instance in
> > openAMP project).
> > > >
> > > >
> > > > Yes definitely, I want the same. Feel free to let me know if this
> > > > does not suit with the OpenAMP project.
> > > >
> > > > Thanks,
> > > > Beleswar
> > > >
> > > > >
> > > > > Thanks,
> > > > > Arnaud
> > > > >
> > > > >
> > > > > > So Linux does not need to send the port idx everytime while
> > > > > > sending a gpio message anymore.
> > > > > >
> > > > > > Thanks,
> > > > > > Beleswar
> > > > > >
> > > > > > [...]
> > > > > >
> > > > >
> > >
