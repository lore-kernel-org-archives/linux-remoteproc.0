Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953BF20ED
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813934; cv=none; b=nZrhkPPxSEoH3UlzG0Zoke9Lg3GutOgmfar8TiR0EQs/SAaPcbfBzmk/ijXM+V9SODqJr7UHiq3Jdm4oHl94RWPy88LSdivjtR49VcroPLBBa1muZ78M0C5aLa5YSA16QsDR/0xWRRTDM9Isb4Ip5bJx3AzOE8/+AkraObcA1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813934; c=relaxed/simple;
	bh=Sfnu02sWQqqJf145CrIFLmP+gKZbUM6UT9GMZg+gyLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ9Dr8/5eUlgGuYQMiOnw07yrgOrx9Fd6eLTua0LpulwIPxEZsRm2uyU2zNcVpSMvHPTwvSNrRX7lgJ4id27Ck85J05M+JWLA9psxpZ+Q12Nu7kmeZUaUxp6vG/C1E/aPqE5/UM1oBWK/fExflJhj6xnFcwzuMlTQ3ud1hLqPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jh7rPgUO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jh7rPgUO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-279e2554c8fso11064665ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758813932; x=1759418732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=jh7rPgUOlXeCa8LZlCgifXnIrDWM7wHLotwLy81jP4GAN7rF0YCOvrvtjyp6gwYJzC
         C8QxIyaI3/jitsbR1IkCKO1BxA06m6ylQb5EAYtM/kGnkTf/dKU/d35R+B939ugfn6mT
         hyyXTVcpk3BRv0mkZqLh7aCqZko1Mf4LdEzHu+oQ09nVPkaSZqQeaXCwQ/lyOBAWfWFa
         /4ppII+2vZjpJCu18DDMasG05CI7xbq0FYXYtTCSp/8EiQlvyYLRNQw/cZvwTpbAyZux
         WScC49PNIgwSdz5Kem/Ouc6f++LaZTFHXwmN5HclD7lyxZx2STfdcRUgoanB6e1NJmpY
         iUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813932; x=1759418732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=gXUOxG/Cosc+NY/+vn7eRM7PwXcqTIkQ1WSdCY46MTXTQH+BFUB6eK3APT7DgR38gF
         P4qltiEsoiqsrWRMj8Loq/LrtNVtjZppVliQFte+pFg0ORWB2Fc3nImcGDGKvWSz2q5S
         8Mcsp5LKfoOWOqKoAP9raqfIynGR5yIhQs+uyLIxdZ5v0nDnkantYXgpXNM1qiFYMzQz
         JM/ZmbChH2xhoKmchoLwb9UBF5sKewQpCRTwQIbue/prrV106i7RiMKjTahBkFPoT4iT
         Atdd3kYXKIhA3CpYXXpUKOXxUIO9zEO0vojQjQXvq7AtLeaQgWUFCj2OSasyEv3WsQ24
         zKGA==
X-Forwarded-Encrypted: i=1; AJvYcCV86nlQFXecFnNiC3ld8UBqikspWVEJfQeZEllNvON2EQrkgVAR+J32Z0Xil387gFPkBqnwy9W2thxPpuucE0LL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxn5avdemhI+MnTnGCSN4JRkbERvuzlypyTVqllEXCjMkGSgN9
	qy0Ia6ypaJkBYAhDPQoq166lCRjfC8K9pPjk9RRPygYbkg7hqIkgdq/dEuN4L8wrmmc=
X-Gm-Gg: ASbGncsiB0vz0i1Ke2tfl87+XN3J3y1lbGWrP4F1dJvy2om8ZEQ/EiDBFEhsXWQACmO
	q+00Ub4wcM+1V/2O6XI6YL3wBcp6240IWZ+CI5/KgsZM20zt7EDhX04mRwRNFXcU2Nm63bPsQyr
	BygQgrYUzT6p79aFqRqKSIYKUGN7WTfgNWvAyX03ScuNB4gTV7ELuVkhEc4r5AXmGOgGkO+h8Kn
	al2A7/GsWv6/zuVbBns9xH28I+pm+2csOYVj/MuLUVB2ZtC/REN+XpH8fkukW2jpASNmvJwoSgy
	7QOO0rzY3bSIkgkjS95UgSNH2DLNHLv/vr5Y90YJWBqoRBrym8EvBWwWtsXwodhmjHIEXeVmfqq
	QUIsBX8xfOwqJmF3JB5rWraspgb61xNVsxqmMPnnsFHG+h1bOI+m9Zql1e8/Dh1MD8nNmlX4fXT
	KR8dAkE9P6BVDEjKZGAofph5M=
X-Google-Smtp-Source: AGHT+IFaUWm0IMFuhwxwZ6ZVuoRzGDUplyarDIAkk4+v9ajtIq9wSLIjRgUT3UbBtMTnindWS3TDDQ==
X-Received: by 2002:a17:903:19ef:b0:274:3db8:e755 with SMTP id d9443c01a7336-27ed4a7ec49mr43070925ad.30.1758813931703;
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:491a:5e5:2a2d:1b96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm28336435ad.8.2025.09.25.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:25:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aNVe6MG2HiWNJZQP@p14s>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
 <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
 <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>

On Thu, Sep 25, 2025 at 04:31:15AM +0800, Peng Fan wrote:
> On Wed, Sep 24, 2025 at 11:10:33AM -0600, Mathieu Poirier wrote:
> >On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >>
> ...
> >> Sorry for early ping - I just wanted to check if there's any chance for this
> >> patchset to be included in 6.18, along with the other cleanup patchset [1].
> >
> >It seems very unlikely.  I am currently looking into how the PM
> >runtime framework behaves to address my own questions about this patch
> >[1].  Furthermore, I am worried about the usage of the device
> >management framework when it comes to freeing memory.  I will get back
> >to you with comments on that front when I know we are doing the right
> >thing with the PM runtime framework.
> 
> I see. Not sure Ulf could help clarify or review, then you might take less
> time.
>

It is fortunate that time was taken to understand the problem and fix it
correctly.  Otherwise we'd still have a problem and more patches, possibly
wrong as well, would have been needed.
 
> >
> >I dropped the 3rd cleanup patchset.  More than once I asked you to
> >submit only one patchset at a time and you still refuse to take notice
> >of my request.
> 
> I apologize - I now recall your earlier request to hold off on submitting
> further patches until the table_sz clearing patch was clarified. I
> misunderstood and appreciate your patience.
> 
> Could you please clarify whether there's a general rule in remoteproc that
> developers should only have one patchset or patch under review at a time? If
> so, would it be possible to document this guideline in the kernel documentation?
> That would help avoid confusion for contributors.
>

Most people tend to address one problem at a time, especially when subsequent
patchsets have dependencies on the previous ones.  I'm not sure there is a need
to document something like that.
 
> I ask because I have other patches queued that are independent of the current
> series, such as:
>  - Reintroducing the table_sz clearing
>  - Misc cleanup in remoteproc core

I'm fine with those, as long as you address just one proble at any given time.

> 
> I understand you may be busy and have limited bandwidth. Would it be feasible
> to offload part of the review work to Bjorn? I rarely see Bjorn reviewing i.MX
> patches. Alternatively, could we consider bringing in a third maintainer to
> help accelerate the review process?
>

How fast do you want to go?  By and large, I reply to patchsets within a week,
sometimes two when things are busy.  And when I can't meet those standards, I
send out an email to the mailing list with the review order of the patches in
my queue.  What else are you expecting?

Bjorn is maintaining over a dozen subsystems - I stepped forward to maintain
remoteproc/rpmsg to help with the volume.

 
> Thanks again for your time and guidance.
> 
> Thanks,
> Peng
> 
> >
> >Mathieu
> >
> >[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"
> >
> >>
> >> Both patchsets have received Reviewed-by tags, have been tested, and
> >> successfully passed builds (arm64 gcc) with each patch applied incrementally.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
> >>
> >> Thanks
> >> Peng
> >>
> >> >
> >> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> >> > 1 file changed, 57 insertions(+), 71 deletions(-)
> >> >---
> >> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
> >> >
> >> >Best regards,
> >> >--
> >> >Peng Fan <peng.fan@nxp.com>
> >> >
> >
