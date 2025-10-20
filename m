Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAB32F747
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979227; cv=none; b=S90wMlEcycyRQ36PlgeSeAhROTGYTrEq5BkuPlLobtWeeFiUPcQMrJz3w4Y+AoHiDZDnlb8ea6KQLK6BROpQs3CPDPIGOgCZoxSvPwWK6YtWXIoVfwcnDQSlbNRLul0ucS6KRigacMIIn7UPp0uLoymAZMft2yWmBuw2nPhIwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979227; c=relaxed/simple;
	bh=e+m6gKrJ9WVNcgrFV+aGX97kgnEJRRQEVjtTKxNaaSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5pWYvBCsqxdcF7fsNwH8qc+F7DsbS4MtoWXU6M6IffhzeXdWoeEDE0B06gIShWdq3LpIB4Svnc0CqAPxpWA7lyQZdkoGY5Ib8G4zsigzXbtlPI1/ExDGQs9gBouRE8z7mtoQ/RPr6SktafAL6Im2lftbaCAjigfZx3HZ+gbFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNXt0DvE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNXt0DvE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290d4d421f6so32349055ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760979225; x=1761584025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=cNXt0DvEY8h8iMHGJQ76f5gu+dvr0ZElqSQDwIIJZSJdS6dkpJyQZ3hDiS+LlOxGLE
         IfFev5UOuL5cqR9Gq0kk6YuIp0Ps24t+LVBMVCYvEwsNIjkoCnAi3MOaYyW7i0LaLvfa
         got9B6cZleN2R1ZY4F7O0erI0bVJ9n2Kd9Q3mMIoOlnHPhJ5VqqP61e8nf5hBDONnlJz
         NKWbTTLdkMg9UzDP3RRKv0A/rk34J819LyN0Acqws6ET77M0X4ix0SB7qVA77ZKb+BzG
         /plVyhHGuE579Q6tt9sgDbNuWoGiWuiGAppBAsxBElJxEuRvbj9LkpnpiQl/U9QtFIBr
         8v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979225; x=1761584025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=ve0wkK6jQS9MxhHUniAK47XmBIBluv/U6blM+G9n0fvUG/Crc5YCel9erq4zd4DIV1
         A7W/eLwelL3gmvWJWiY8dw62YT+8gJCOJmt5lEKf7atabvXJyLzed15R2La2eGV3jPj8
         d/B9IhOrmv/oO45r1gCq+UapL3iBZDD1A3ocqGXaJJERjQDmuqVLwbZJz7z5LaGDqXjP
         hkxG4XpJSeb6RUldxOCGensnsbtDWdo96OZutmXW2oHRk2dXrRK/UiXUGKb9dTK9++5o
         LLa1a62FW7VquDy8xN+hqXThZOXOn241cg96QKoZlv+V0lJrXDK5Ko23T5LBzeNY1CyC
         kkXw==
X-Forwarded-Encrypted: i=1; AJvYcCXLhWqAx7KTE9dE+PbAXWvdhaKKb4A7lyT/6smTibPqZF1xD3WUnZWrg/zj4gsckRSOTn83JfP/uDAKUhfBViLd@vger.kernel.org
X-Gm-Message-State: AOJu0YxvpI7CSujisS5FtuVFfqyUau5FFzR4aQrxirayhuYfCLybMKhe
	4bHrCn6zy8dZo2EZPRzDbrxHP+Y8QqYTCzmdljASMZ4qMyd8MEYQgfAUMZtndYCW5pMSCBh+gux
	Rl2vWb4npnwDxqPbzWGTetz3DTW07nSY=
X-Gm-Gg: ASbGncttDRA3QZXsBa0IbPZl1qC8M0X8kFOqRRZB/BSe6tDkvM0wlHsxqTAWWydy+0o
	/+O4GnLaxoGRr2E6V0c9Lgrm3cyp0q8y4SmSRkN2GjVMQBRrun/ZHsPElADq3tZUkjePPu0hJpV
	lniDdJk0bEjQscEjGFSK6S8eNvSW9Q1ks6zTDwMW9bu6pHBL9Rg6Owxe3DZ+QJZ78IfyzwnF4zG
	euh/SqJZ0doz6rCXD2GraUmx5tb2cT5boRFsmaxNzSXJ+thXglS38uRz9WEV+1fFmGek+za8xNl
	KIGVYmzKzZ89qQ==
X-Google-Smtp-Source: AGHT+IHRLawtbL1et4hkHzQFikS9RlkgNZ3tXH8Fnn3CVZHXzJcNVH96n3jZk81ZCVZWEMKh95kb9ashTsLbS1kPQ3M=
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id
 d9443c01a7336-290c9c8a738mr162660385ad.9.1760979225307; Mon, 20 Oct 2025
 09:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com> <aPZXNlY1MK4--Q_g@p14s>
In-Reply-To: <aPZXNlY1MK4--Q_g@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 19:53:30 +0300
X-Gm-Features: AS18NWCDDzyLXdoJ1ww-uT69WkAwCVMMmB4swG4QnzjbOUSySmr_LsY0EDRbg2A
Message-ID: <CAEnQRZDk0qLb2kegEZrE24oBfoKjqcc86N5e9QLB800vsKbOoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 6:40=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> > PM runtime support is safe and applicable across all i.MX platforms, no=
t
> > just those using the SCU API. Remove the conditional check and enable P=
M
> > runtime unconditionally to simplify the code and ensure consistent powe=
r
> > management behavior.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
> >  1 file changed, 8 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rp=
roc.c
> > index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb=
2a8ae5e20b6b4f667 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_devi=
ce *pdev)
> >                       return dev_err_probe(dev, ret, "register restart =
handler failure\n");
> >       }
> >
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_enable(dev);
> > -             ret =3D pm_runtime_resume_and_get(dev);
> > -             if (ret)
> > -                     return dev_err_probe(dev, ret, "pm_runtime get fa=
iled\n");
> > -     }
> > +     pm_runtime_enable(dev);
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "pm_runtime get failed\n")=
;
> >
> >       ret =3D devm_rproc_add(dev, rproc);
> >       if (ret) {
> > @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_devic=
e *pdev)
> >       return 0;
> >
> >  err_put_pm:
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(dev);
> > -             pm_runtime_put_noidle(dev);
> > -     }
> > +     pm_runtime_disable(dev);
> > +     pm_runtime_put_noidle(dev);
> >
> >       return ret;
> >  }
> > @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_dev=
ice *pdev)
> >       struct rproc *rproc =3D platform_get_drvdata(pdev);
> >       struct imx_rproc *priv =3D rproc->priv;
> >
> > -     if (priv->dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(priv->dev);
> > -             pm_runtime_put_noidle(priv->dev);
> > -     }
> > +     pm_runtime_disable(priv->dev);
> > +     pm_runtime_put_noidle(priv->dev);
> >  }
>
> Daniel - what is your take on this one?

This is on my todo list for review. Will send it asap.
