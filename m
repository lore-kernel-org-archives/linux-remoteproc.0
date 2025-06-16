Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344F2DBF47
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jun 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079645; cv=none; b=gqa5c7DvJETBjd4Zv5petfmZjlPnOZQwsVz4e4JtJ5Eof2X1BR0oXNm2EoE9JQoSlb8QSURxvf8qeSzIjC/0/1iK/aU3kbLe/RkYIpOJaMpZF79gJFyB64i96dDKsv8e8BNx5sSuvIYuPY79LBb6dfNdR1PCsA664ZUw98oAhrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079645; c=relaxed/simple;
	bh=bEkIwJKNMLdtIH3qoD09umnOzSE4UEjxHiK/ZI7dhJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Py8NZeZxvXGLz+X1r4xwOxeG0uvCGtvgof5ZglhsZylzyX7Nftig1yNu48c13AJJ5yGT3p7MvBd+KZP+t6o9x/fFSpPwIaFeWfjL7tNDH9C8qz8rKrEYMZZxS0ExX6MgHSdQvS9iUaLsPfrLwdvMims+eyBrJM44hS/A9g+LC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXueeXiX; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXueeXiX"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e82314f9a51so1202862276.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jun 2025 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079643; x=1750684443; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=kXueeXiXDOnLyphxh64NM1Nkew0a6yBveieNTwSqw/YCZHZuRHKe4N0OYd6EKn4R06
         87u9Yt53Lpb8g+AeEQcnrIkkDwd14K7ocAIOvgp9qlPqoYcufwbpYS/D9iqE7a2VmP8P
         hhsi+VFLONtsA8xf5e6vOHDSyGpeviPVAjRVWuKoDQUBYI9e3MHvvUGaoWTSDEE4WFkH
         k/srN1hoauo46MLjdmDQYVAZO+lT1g+1ypzUcnSPa9EK+QjKrk5b6uz7AhRdWOAuFWbc
         RID/da0s1R0sH6neIXUas5q/1Por/QRGBg6djdcdBIPJf2RKfZiLOjcQk7vE/2njHAjP
         ZeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079643; x=1750684443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=U7Buqzn2E5niC/3YUqPRCATqYU+884iDEd35R0oJ1p0VmvPg+2hpyw0qXK86z7J3Zg
         lH/CqtuQGZDtuMhUlM2mwenib/iOQx+oYdE3O8ZArDI1SH6gKp0MX2iWYKzTdhr0RvSe
         AaPPSf+dooTonResjk17EJemmSo4zOWTa70VQChLJ9cM4eCwxlR1tgrlLcSEtyg8Yujc
         WUYjt+mtDpTqTxh9IAV8hAxp0K2qNMj5tCmTUMuW4IRot0iIax3Vf5F66x4xorbQP5KE
         kHaR6if/Ln1hqMXgoxXT3RcU7kHdxty1BvjNcJMMeLFpw32J0P0+Iw81J0pQaKTefeKO
         8Yfw==
X-Forwarded-Encrypted: i=1; AJvYcCVS1puMp0M0GJ+OeQe2PmKPFs7qhpLylfslR1rPFyKKuqjl7/EV6sB1wAn/ut+c0M4OOo+WqnQQfTBqNg1Kfqoh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmNjnBQzrbNinResE0yNzEsOspmLg6YStWIRmvH212MOVaH+O
	judMUNOVpGhC1bKEayB0GADaxkH9mnbPcfir/yKl6Mpi1BXNaiIHGQuZkjIu6Sh6Cx1vQKMRoyx
	lnIM05nHu+LRn/PnBH2JEwFfYR8JN1juXv/+5w5jLzg==
X-Gm-Gg: ASbGncslnhHv8ygv7VmIztnw8W4iENJMO/ZNGIprwKCKOh2kGF7TsQ62V+yvAT1ME2C
	RzpgV2tx8V8p7bbL6NHZAzK9MJEEuBi7dE8ejQcjXi0F56BpXWyHP9Kzc9xzwqiZkmJIEnQmcdE
	46jKvmHm8Ek0r4mSmC0zzz+PhIEUOSLKy0DSTJb9FUmcJY
X-Google-Smtp-Source: AGHT+IGi/aEqL6Rh0/QFbFi5llqcB5Z+A4DQiJChk6fNONAKpDZLCVOKHVzGhfBOvJ/fA1gHl6Xt6hW+mpx8lzQMNck=
X-Received: by 2002:a05:6902:150d:b0:e7f:682f:9536 with SMTP id
 3f1490d57ef6-e822acb5383mr11988415276.46.1750079642672; Mon, 16 Jun 2025
 06:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com> <20250602131906.25751-2-hiagofranco@gmail.com>
 <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b> <20250612173132.ixgctqijtd33vnmb@hiago-nb>
In-Reply-To: <20250612173132.ixgctqijtd33vnmb@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:13:26 +0200
X-Gm-Features: AX0GCFuvpjxjHJP5wI9sLNmiJuYGa1YHq-TFuFSLYi0hAhYmQqrk1asShtl7yPE
Message-ID: <CAPDyKFoHHMv1MUnT-ZUTDiwZdMChq1KooQxnNDx=eettpoTAGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 19:31, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Wed, Jun 11, 2025 at 10:32:28AM -0500, Bjorn Andersson wrote:
> > On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This helper function returns the current power status of a given generic
> > > power domain.
> > >
> >
> > Please correct me if I'm wrong, but this returns the momentary status of
> > the device's associated genpd, and as genpds can be shared among devices
> > wouldn't there be a risk that you think the genpd is on but then that
> > other device powers it off?
>
> I am not fully familiar with the genpd's, so my knowledge might be
> limited, but I think this is correct, if the genpd is shared.
>
> >
> > > As example, remoteproc/imx_rproc.c can now use this function to check
> > > the power status of the remote core to properly set "attached" or
> > > "offline" modes.
> >
> > I presume this example works because there is a dedicated, single usage,
> > genpd for the remoteproc instance?
>
> Peng might correct if I am wrong, but yes, I believe this is correct.
>
> >
> > >
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v4: New patch.
> > > ---
> > >  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
> > >  include/linux/pm_domain.h |  6 ++++++
> > >  2 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > > index ff5c7f2b69ce..bcb74d10960c 100644
> > > --- a/drivers/pmdomain/core.c
> > > +++ b/drivers/pmdomain/core.c
> > > @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> > >  }
> > >  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> > >
> > > +/**
> > > + * dev_pm_genpd_is_on - Get device's power status
> >
> > Functions in kernel-doc should have () prefix
>
> Thanks, I will correct this is next patch version.
>
> >
> > > + *
> > > + * @dev: Device to get the current power status
> > > + *
> > > + * This function checks whether the generic power domain is on or not by
> > > + * verifying if genpd_status_on equals GENPD_STATE_ON.
> > > + *
> >
> > If my understanding is correct, I'd like a warning here saying that this
> > is dangerous if the underlying genpd is shared.
>
> I believe this is correct, maybe Peng or Ulf can also comment here, but
> if that is the case then I can update the comment.

Good point!

I would not say that it's "dangerous", while I agree that we need to
extend the comment to make it really clear that it returns the current
power status of the genpd, which potentially may change beyond
returning from the function and especially if the genpd has multiple
consumers.

[...]

Kind regards
Uffe
