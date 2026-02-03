Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC0C1F3B87
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105058; cv=pass; b=hk5laEqm1Y7i+IT6V44A0J2FU+vxR9nxHGMdkkcwVq+9xcO7UTsIXU8C5qp1sjbyxidfn+YOBJBNQR0z4lqhO/jiMbX5AIjvBVtDUkQXBa4BYuTIOC0OgehvPASNbU5hYIpO4nj6hMRlLmCuOXrhqPadJ+kjP3G5yS4o/ty3YLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105058; c=relaxed/simple;
	bh=z3uO4wDS4x6z936FnI7cggR5KRAC0BgutNuhO1txo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGvYvwB1+JCd9AqKu6aAIUKcjnxdlLJ2IpctRcuvMm6xsGNyKdSSqTO42z7wej9O6IH2a0DFz110NQxgvbp1FyBDbLaoWLJ79oj/38zFDXxdkZYAlkvyCPArnsfQYiEiHCA4bfQCrUcxRdWdaNFgbwRjO+kAnI0ycnbBK/Vbow0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxdbBWyk; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxdbBWyk"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12460a7caa2so8078380c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 23:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770105056; cv=none;
        d=google.com; s=arc-20240605;
        b=Kvelf0N0OeY/EijQbtPQ0hj4BNaZdkAXOwBZehAHBUmrDO8PkSKcappK/rZGAw1ww7
         xbdC5Hr+F2clAjVDYmEeu79NW739i1xZsTeEeRrJwVKaYKtzjySlgaZMseFogdgFuL3s
         Tsqm4lFQ/2i73m2WwzOhpNeRkjAUaUfJ1tGC9ajB2EEhPH0vQW/Pxoi7gSan7BOXLBLF
         D84PmtxaSWwP0Kl0c7lTrqwrgr2EUBYZyQ/bueHeB8CDRlAwUJpAJwOUExRwOMHQ4W5v
         tsA5+QUh8CO5CjY1/HhHnmsVzi7AWhjwmMl41JFDNeZfMJ75RT5OWRpkfM0JcAil7Lnz
         VtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        fh=9GWxxS4uJLJcDR2LJRW0NzKrNqmIXXT7C/HyQA8GR4Q=;
        b=JXlXcWtawStUBg5WxV3m4W3xTH2P/VZdqqubqhbGVzWCpDWAfje8hVBGBdnf6Oqm+O
         yfJLDQKxPff+Mj8py6w9/PRML35BE2zUTSVacCZuQiHCL3EYJik1sou/BVfiFgNi22JH
         ouqItxB8zgczqqbZ3dir7lbC+kUWzi6Mfy9t1LE37CnWIR8nCBHxZFQEVWbDZz1ym6DD
         vxdHvg81tcztZtGV9bUy7ZYSl3fVHCLM01EzSAwFkUd3BAiwIhFGMGDHMBaDl+AXifRP
         SDkkMH6FbWuicYvILssFkc0UKIra6BLY741s+chkEUrgkXUPq1iL2xIFHnCoNn7Uh4mU
         XfXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770105056; x=1770709856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=IxdbBWykyN6SCKXUzV/u1uJzV5XIMNTY0ESeHRhKeO0HdvhevwhONg9J1h5Rfk4tpK
         eBpD8sYdeaasAQLZIJS7PDSjWD8bIiMDElOw0CYrLs6pBaWVG5auFRo0Bfpxywr7btas
         vid0zfnI40fizGts7Wc/KUg3Z6iq/rdt5uuWfAol+ZaOIfZSbwlkiLhFMIQFpF++XHSO
         wxgK2VuCSqeQdmWn34q95Po5SBsh3m9oICbashUv4U8eAdCO6Tjk3e7ZiRkjHbtC8wMK
         YbQ898CrnGZRF3K3YQXNtKi/2zHvci83WYHX/erAZCAZ4VRm5Pzy00wwZYgqI7pGc9nk
         KZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770105056; x=1770709856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=myYRMPDusbt9G5bnmvQGWqToHLk2yzcGoQXHLoCMwyxM2N0c0I38J2nKN7hOAqGL7x
         E+kyCXVVPpdjohdVkLOvGVYTrPJ/baWYsOy3I9J/ghlWWdItKekYYmxoGXvYKvCUwvwk
         YaAGHlYH+Loszv/5fiKQilPl1VSEYa7seoPwX0NIXqVQtgRe0g9aDNIVASOqQA9mJDo0
         WM6r2FDcvi9x4bXsZfwdABaIMeJ7DRv0RC9G/VKbmwklVgfEe7Ksd+cHivpBouJJTfrB
         yKQssVEx1Mi49+Y1yTBUPo2H9PGtCmLd8gJl0PYcazPhNuZ2FXwITUhDC4qKLuS3FUJU
         BABg==
X-Forwarded-Encrypted: i=1; AJvYcCXbcwAHJfb9bCUcXBEohRQR53SkrFAVzVM46X2q/Cp0HOTpYWnGx11mVUaVpr24x0Cn/O6IZNB3bnhU3qJr9Cac@vger.kernel.org
X-Gm-Message-State: AOJu0YxUK31UQoJy9bevuoRelwsPt88EnWzMtAWTNoCjr9i7W5CSCb81
	Yp0Fs/1SVjC0Ey6FFD3MxpAuBzyGUynwCQnqoqM424BbTMqS6Sfe+PB5ZU0IoFNNGS/C2/ifmNw
	s6bdQAwkOhY70oP4dP/aZc+2rEM5oUO0=
X-Gm-Gg: AZuq6aKADQ6iI9TduDdPPTD3WfWoMexkYD/8SSuCCFPgtYSyh2Zb/BKy8IQ1NIq/f65
	8TrSfKKd2Z39NY4ysUgITLNsNMYjhrd77Cp26/RA/S8bxTdeSdNlnXq6xguks6oirBkGeYlCV2j
	l1c0qaRLq1A3A3M9ANPAdTdE0XfQohvasPgq1vIABf+GSxxy07oJqCTLD///YneHRCU0Fb0PB+g
	8OUDJYS3JbJPnT5nncqAPgXwcy3/VFNEUaxF62To8r0hHuHQFSPZmvKYidYTiTWWfa6dwDCxiST
	G10Ikbl2Lv6K21kQAbDVzMF5KlbFynlzS85I0pPf9q41rgr88sJmf6T+3NFS6xUVwWTGacyt8co
	eSAL/VbIVoA==
X-Received: by 2002:a05:7022:41e:b0:124:9e46:82fb with SMTP id
 a92af1059eb24-125c1010d65mr5955626c88.38.1770105056409; Mon, 02 Feb 2026
 23:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
 <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com> <aYDN6X0WVT9nV8fg@p14s>
In-Reply-To: <aYDN6X0WVT9nV8fg@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 09:53:38 +0200
X-Gm-Features: AZwV_Qi4gqYVwTTFEPdJsETuT6WyCitJtTK7rW3QVszmKRnozagvutFj3QflZ74
Message-ID: <CAEnQRZBVhijvq0VRTKXpW7va2Dxprzz-cnvvj=z90FPXRK+TSA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:16=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jan 29, 2026 at 06:02:21PM +0200, Daniel Baluta wrote:
> > On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nx=
p.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> > > resource table even when the current firmware does not provide one.
> > >
> > > When the device tree contains a "rsc-table" entry, priv->rsc_table is
> > > non-NULL and denotes where a resource table would be located if one i=
s
> > > present in memory. However, when the current firmware has no resource
> > > table, rproc->table_ptr is NULL. The function still returns
> > > priv->rsc_table, and the remoteproc core interprets this as a valid l=
oaded
> > > resource table.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()=
 when
> > > there is no resource table for the current firmware (i.e. when
> > > rproc->table_ptr is NULL). This aligns the function's semantics with =
the
> > > remoteproc core: a loaded resource table is only reported when a vali=
d
> > > table_ptr exists.
> > >
> > > With this change, starting firmware without a resource table no longe=
r
> > > triggers a crash.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook fo=
r find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Changes looks good to  me >
> >
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc=
 *rproc, const struct firmware *
> > >  {
> > >         struct imx_rproc *priv =3D rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> >
> > I wonder if we can make this change generic because it should happen
> > on other platforms also.
> >
> > Maybe something like this:
> >
> > remoteproc: core: Only copy loaded table when valid
> >
> > Copy resource table in memory only when:
> > * the current loaded firmware provides one
> > AND
> > * there is an explicit request to have the rsc table copied in memory
> > via rsc-table
> >
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
> > const struct firmware *fw)
> >          * that any subsequent changes will be applied to the loaded ve=
rsion.
> >          */
> >         loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
> > -       if (loaded_table) {
> > +       if (rproc->cached_table && loaded_table) {
>
> But we would be doing the check for rproc->table_ptr twice (->table_ptr a=
nd
> ->cached_table should be the same).  The way it is currently writting for=
ces
> vendor specific implementation of rproc_elf_find_loaded_rsc_table() to do=
 the
> right thing.
>
> The merge window has been pushed by a week, giving me an opportunity to m=
erge
> this patch.  Should I do that or should we continue discussing the best
> approach?

Let's go with Peng's approach:

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
