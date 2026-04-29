Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB337F721
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477313; cv=none; b=XfM5hmaCdg0Lpu1pFD063RuMicgf6MCao/lMBu4ucUjWXWzIScwX1qocD4RVXbXteexWeLxdBCtAYq6CtRzYjErK5cMthXTzrlmZ+wPcCF3IjiAarfcgHKbz+TGQU4qLRjLTg7Gttr8iFMF6NfZShf4SEh99XcFk7sh0Lz8zQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477313; c=relaxed/simple;
	bh=ptDOA8oXfBcLNX1p/12OZLzqrk1BS6t5onLGu8IEt8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvWw6rEjAm+ByBv10jUNN1iRukoHbFy9GDMtNkl58L6tNu3blSOk2GS4a2NL5YR144vwNCATVSrXXHsJQprjwxN/pWxSDrxQhiEMiJiYDDZkiuwGnnYEwIFe2uMlgx+CSWm0CoAvEIg4dqMDIJtVWRELe2Aq/xi1Z/krXYZOuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/27T86g; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/27T86g"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c76c60c7502so448057a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777477311; x=1778082111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=x/27T86gUyqmFKiprX3Eig42Q7FCCl2TkTqFhm0EveKwg9ZNtlWgGtuOdD71R4J+Ad
         g78mNZ31VSgKne6xap4Qepafn42S5ilLNua7qxaSqlGILcW3T+z2bQ8Onr+lKHKaqLUz
         cznRYN1QngzriWUdnBiD6d5nrtXBdky30GuxtsXzD0yTGqYvnmw9pfeFqbqnGUBA1QMZ
         noNSnrmA4VbtXWXRnOq84eXCnzAzVCCDrq8P1m8cjOrlfTBU+9M1Wrm2LXmz0AleFyYA
         uFjd5HdDCgfQRMFWCsTRbWjmvinnIJvlHiTzSX46+ofmFs9Rv82jxzsk7zpV8m4ZSYkC
         jUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477311; x=1778082111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=QnJpb8W6xKdISjVq+Qzbej/j8NNW7PLYntKdY6Mf5/DMsLAPXc1VF4Ejbf7z6yjK4p
         PLllcLxFN14eyitnwEoDw54xBztEg6VABFifn5ssI5/3ISUGP/Be5dauUzCv4vJlkd0H
         xzbjDDTy2rM1CzRrlJiSgqio8l/oa2HAuTL2tcsuIvr60xkCHnF8p60i9Zq+aeKCl+3W
         nYH/jKqFiHiHWwbgzLHMFhY5BnpubLewd8EnpZhyfmiew1QUbBQr3inF21KMjMpNBZJQ
         q77pdZeLBlILgOvaPla9fPFqD9tr9E/3vaaUDQv+FHuj4zTMebanRUsPvEcymWDYqTFx
         3KTA==
X-Forwarded-Encrypted: i=1; AFNElJ+wj8usHVJB5VAP3KKk1kdGz42HVVJm+HcI7gLywEn2V54lxL1r2ZIwqb0OAFT+E70bisCGqOuoAgiOsOP/Nvms@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRdJf8+gJhDQBTN+oMkPsxZ8msv66bSb5lrlkgiIWNmusc7bZ
	BvBjD/RPBIwTl4GMk9pVvlfpyQxrJKDNoDbkfQFuM1WqKQcOSbWIqXf05JuAlBs3FYY=
X-Gm-Gg: AeBDies77Z/vO8yGzxgRWC16y9lQ8NRsBpPjHjvIDxsSX2yHbGK+hOGlcv6DvGNYGSw
	9SNQPuvIjhS3zSzhuy0YpPWE7Mpm/hqB2jnGL3SmsxMPnQzjHDOkFTUlidnzqpPI7WjJ/Od9xoZ
	+hfjEUweXzVtGHdWgZc+mISETJXOeH0kpe7NU1R7NO4lGmeMxSHitYDwFxPldcKiVlGHzzRC53Z
	jgtT0JStuD6ZKHSYesGZvk0Bi/aRQKEr9FCBsLpxBQrlzHVD2D1QpFswEXkbFcyiGM1bB9nD02N
	BkgJMoCzzzkxLMDuAGk59zPbOQOopOJ0L8FdWCtbRMqEMLsybYUvlZzo2SVNmpHnxrRUSo0Icnd
	crHsw26QeuBKALYCzI0OYRlkufzVyLpCTdr0Lv+7Z1cM8uqugicxZmjfPH4jMUL7ACclAajyT+V
	17oTcDFQvhUdl9EZEQJOsu1wsEPwLUE491TQ3yhQ==
X-Received: by 2002:a17:903:2410:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2b9882388cdmr33673325ad.17.1777477310614;
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8131:aef0:bb67:5559])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98899055fsm27045325ad.80.2026.04.29.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:41:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>,
	Linus Walleij <linusw@kernel.org>,
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
Message-ID: <afImuoeHolxGgw3H@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Monday, April 27, 2026 3:49 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > struct virtio_gpio_response {
> > > >         __u8 status;
> > > >         __u8 value;
> > > > };
> > 
> > > It is the same message format. Please see the message definition
> > (GET_DIRECTION) below:
> > 
> > > +   +-----+-----+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > +   | 1   | 2   |port |line | err | dir|
> > > +   +-----+-----+-----+-----+-----+----+
> > 
> > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > 
> 
> Some changes to the message format are necessary.
> 
> Virtio uses two communication channels (virtqueues): one for requests and replies, and a second one for events. 
> In contrast, rpmsg provides only a single communication channel, so a type field is required to distinguish between 
> different kinds of messages.
> 
> Since rpmsg replies and events share the same message format, an additional line is introduced to handle both cases.
> 
> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to uniquely identify the target controller.

I have commented on this before - RPMSG is already providing multiplexing
capability by way of endpoints.  There is no need for a port field.  One
endpoint, one GPIO controller. 

> 
> Shenwei
> 
> >        Andrew
