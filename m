Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67D272E5E
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667523; cv=none; b=mMxGe7bjBlNJNK2rptZJl88KYlhJateHGElEELWK8MmHbTtr2netSR56mcTrEF9ZD8fUddB/n8XcOJDERGSSvM2D+0+dtS5wprFadKlQhVGm4uX6brzcr1PaYQiIX/lzP0hpJEZ5GYe3GNM0S7W/ZLD1wMz40tW+L/w1MHPHRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667523; c=relaxed/simple;
	bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZUoRRkkImJLc5YGP6Ar095PsOhblxUpWnA5B2tNvRzr1+ebmXzIwDZi4pPX1fsO0nLrStKear86p4yskcOqu3L2SfB8gbsDdrrLBimdO5hBhQpLWOJvhUosRr/t2v3/9bxx/m+iIZxSLqkIS3uvE1unme2fgw+qmeyUG8QKKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaF+QRyo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaF+QRyo"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso1408401a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757667521; x=1758272321; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=MaF+QRyoFYU20kgbKaK75dG1TbU8x9HgnrmOBAv5ZMD4CRSMWYEmo44ng+PpHv/ZS9
         zyVSd4qsOfgbPdXqUgzoPoOfURQerp+hbi/f6ZqJCZPJVLPnWrOl/ZUMk7age4wLQUvt
         snHa/rg5XOoP+IWsdRXKcd9QjlLK8zxYE1/XIi8FrSQUiFStgGvqrXT/zNrHpkViie0v
         1GCnjCgL19U8ry1b+AkaZcO2v2l+RSaxcF4ckPz3nGsYV9npWRQeBmMMjzWJbJskcDbq
         1swsR/ehTnESigAP9+CvkAx3eSgY3koqQb2iFC6IuKAjUgsioRg7LM0sad5wNAgFyS6A
         HzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667521; x=1758272321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=dRkEgPArDeVelxHNDsm8j5hp+4sdlkTOy3lPQ3qVprlD/7GILVHA5SQWwxBoYX1Tdd
         i1qxr5tyTyIhNc6RIeHlgpv/7O3AY6GUGYSXuUv/vrz43/dGcNghFI4rOVkxf/zEGfWB
         +B16MkD+S8yT2N2nnCIAJ/kdPIdv2f+vCDRKbrC7PIAOrDgv3wQC0exRxnIKiQxk+H4f
         st67GPt7wXoRc0tZuAHxfNIZl1004xs0DnJvv9kQRcqpo7t095w3tfMdZP41wtMaUrb1
         Yy5BrPHm4/bR0cmxUn5EMt1mZ1F6MC1/jWM6ZMVRD9yBYrWTba39304sp31IYAiGBRc9
         qCCg==
X-Forwarded-Encrypted: i=1; AJvYcCW3rIiH5J+KWTB5c7MmPWC1k7q4Mt+DNEGegJjy8d1tMwQdNUX6E9HSgcIjFR8lZbjv9ylmvKHw/Uy1LnhVlqyw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JQmnNfnO19XJY1SKim3FkSGLSHg7clFrsWsV18AkoqpAD1YH
	KQaoMVv+BxcIZgtd8av7yDr7q/b6Gic/Z/LA4IZJqWQlHS+m1shYsJC4a5cxTBi56fgL/brvvVm
	ZTQYSu6cUxSUZCH9yIA5jjeWO1ethctg=
X-Gm-Gg: ASbGncs4i8WrWhS9zJ25/vW+sZJMTzxKMfCbbdgxpMeVSr/dugEKtuCmvxk86oPI/Wr
	NNf6fXd4YJ6v4iY1IfVY6AWRwoG3B8A6nGPPVb1yseknsMI663Gfw9UDPjEhUSK/Z/rWVpqyssQ
	wFuepMakDTfSuNvna6iIHjKRxtoli2p7EndGXVh7cmYvNLL7a0EbVklb/xK2+X22Oim8qKnK4N8
	j65+lqLkXxXNSjFJdWHwnTSYp1G0wQX0aBZDkDsTOVqqgMq6Eha+U1xuDU=
X-Google-Smtp-Source: AGHT+IFQRimSGNTZUF8rsCECFnkgLkqZ++YXJEJA7EhcHsbtO0t6DFoZ5dfeGu/99EC1Bwvu0xIa9exB4T1QYyticTg=
X-Received: by 2002:a17:903:3888:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-25d24100ebemr28596975ad.12.1757667520671; Fri, 12 Sep 2025
 01:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com> <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Sep 2025 11:58:23 +0300
X-Gm-Features: Ac12FXwYlGvGgqyGXugiWWObiJmtXxlEmnlZ40W_NSnxtz2WGuiuVYkoCU-Wo6s
Message-ID: <CAEnQRZB-yoV+BYsM-9CvmuSZw_8EF3ijtZhqtBoJOoyUc+-pSw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops introduction
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

<snip>

> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
>
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
>
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
>
> Mathieu,
>
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?

I would go with this as it is now. It is easy and clean. Lets always
go into small increments, test them across all the hardware we have.

Then we could come with the next patch series.
