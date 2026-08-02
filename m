Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C6396560
	for <linux-remoteproc@vger.kernel.org>; Sun,  2 Aug 2026 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785663775; cv=pass; b=n/2uOECEGIdk2yBahbwCrod/F6ySHPquNAKDAIecehcMuKFDA41pBA2Jv733JpZ15XCr3XLZExpTLdso/S9/lpERfvncMlpeOk1Qb1Ck7BxPo4kCnR3KPDVerK36ZCkCPT3Aw1JRDtTxE0s/Ufh8vCFTmj5sEfhGYNik9UqDGSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785663775; c=relaxed/simple;
	bh=dJOBLOQUqN6A2keWqFB+qT5VTZMw6IdkXrYBZAaa2+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjQuX9Wo654uNhplpTy6VxpJgmNLToi2pXVY2u1c8/mxrgfbF+Y09TP5q9tEW3TSiF+mekrcYcGwUzsAy4g2R0ZTu/0x/L89GhexYFZW95StVzFyzKFzZogczlkgb5hrr3H1yzd7vo0qk9ax+X32gJQfLrWGo5vr6J8lMyH4QC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IejQJV7R; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IejQJV7R"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf8ccc3e60so167449e0c.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 02 Aug 2026 02:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785663772; cv=none;
        d=google.com; s=arc-20260327;
        b=BBuRCakEPKZfkne0R+oie1KSNA1sTbxBSNuecoclN2Qw1f4DV0p1kLgsFLpKHXDZ8u
         C8SCc3jwN1sFoehEQVbnu6TekHR4LZ7D+9jOS2HWlGRfo7MeDn2HLYsWKEXXgkS5cANB
         cLzZmVf8e+m9Fcv5/T+8DNVGZzAP6BXcraI4+07ZxypXM/xo01UZz+LfJjgd+tbPxyHI
         eD/jfCNw5hHlSCg5ViFbKTJDFUL+T4ojKDUlriS3P5rGWGraJIJ/bhhCO+i3KRodbeCk
         G3WOXpSCfPwt/L66wL4xoig/xwSW5ulomKcxRWL/ohuwQtAstS0/NK0zEDSLCfnlPo3N
         u/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        fh=C+jPW0n0K97QnxG3+MNYAdifCilSdoUxsVvXz64wLlk=;
        b=k1YBR8sLy3anjc9ejhGFFoX1NkQlPH1ie8BuudDW5xef0nM2n26q8JjRFhsqtefcoC
         xb7T8cjM4qJS94/27yUl03S/TL3f2pvpPpGjXkNDyGPiKtbVpBCCA94/pHYwfFOQvG85
         fV740LSPkMZ7mHROYKCCjLNzE8pN9YEqZzxdSJM7Xjwil2MyURF5CyjOi2U+YOhlMYu0
         B2vCARB1itGazdyrjn8oF4iaWkgTXXKQxgZxDy91r8amW6/Ic6nkdcCQPjfZp/LDKyEV
         /eRH+Y8UwgnlanhheGST8NzRq4epm66ycMTcC5R6DepYwIyeVnaDqjHYO95so22vVIHc
         fLvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785663772; x=1786268572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        b=IejQJV7Rj0U83T9r4pxml+OeFbWRiUJJMSxtZgIzGbfu4dqK1j4nHrgStYziTiEKMq
         BCcTmEzxdXFQhuN8mp0bpOQyWAOahx+esD+ekEmMkdf3FfAR+ABG8QBFVyUfG8+IFHAe
         rTDVhgbyQZrzMoQ1Odrn7KQGcQnKT9ksZunlHxcOs/R3h7KtgBPrqbfmrRC+Q8yiINQ6
         CZDkJM8+XVFr+tl4zUZ8fBJ8L8BgaNvNlelCrXoJSZdXfwhe0kgbh0KlbG1eVmx1PHRv
         KrodULNRQpn6O8/h1sZctKpi7+b7/dCUUjuXQ0/ZPxYZRH+dnGqgrgujW2P3r4Z5yW7w
         l/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785663772; x=1786268572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        b=JFU2GnRyM/27nGeOmcTDvV1WN0Sn0QTbgYWho4+noSqN5cO1TM5frlD8zXDrB7K9c4
         t2s3d+kpO0yH6LYQxYFMnZE302X8wolOfiJAv5jXaBSEVJPpF5wFqBNd5DyXKCDd6xpD
         9RgwnoQDNCctWwS5cikiO/C0NImXd+h/9GiFBSjt/k4v+zjjWtOmGryE/xA/4AxrNmcs
         bAw/K6RgeJkzMm00woXe6tzBmOOhevYEq+zv6/g8BVPqfqsYZXn3HEk/frhZmGbIAlmd
         zdY3osY+iRck7u5m99HAfmgUWnyJClLrMfhFxo8h+yIySubJxaBGwv+4lN2YhetSkp80
         iPZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4xqfCFqzP9Pla+v/APK7EACnCqkY/cTYP8ukFNKZBp4groCOp3WAJGX/X+PkgLPv5nKQp+KhIvLjIFw1vtLTC@vger.kernel.org
X-Gm-Message-State: AOJu0YycQzTZnJNtMYvmQLR2tKRQyR7ITjZ4w9t6z1D+Mm8yRWoGIJKU
	AbL1zP5YTVooOoMcq3goM1XmrmVgce//vBYkwMPwJj2g9b10IAPtF7IeZ4uVrmWAlh4HQTGTNVy
	3hOI4p3b2p0Sp1qmHn3J8WR7uqJZVAPM=
X-Gm-Gg: AR+sD124M4+yKoo8qAkaVeVvuuXTc7eX70mRtzOcHHsK3B5Z3B6C6R7LNDhTKEODyNL
	8s7TiCECD2vB9Ohd2XaPLWXYy0hGdbHyI9Vxmt+U26snv3CDjQ3MGIrZsivxu1ronNq/IL/N7QR
	qnry+ElHu+8JxTK3dpjXNJN14vk/bvnSKqzNfEilTAlBvzmwDvxFsWBkNtFF+HuO5f1owLpvJ0l
	nx/lrKKo/rYibxJ4/ygZsruLHIWDg/r5mRaqNd9TMGsZhoK2l2Y2NvGw/kZl+LUvx6OvVWfWaeN
	gCf434vbmligUBX4054MecjZzZq7MfWzHNImutto1sxhY2A=
X-Received: by 2002:a05:6102:f8c:b0:74c:551:54d2 with SMTP id
 ada2fe7eead31-75b2507b572mr1757974137.4.1785663772295; Sun, 02 Aug 2026
 02:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
 <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com> <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
In-Reply-To: <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Sun, 2 Aug 2026 15:12:57 +0530
X-Gm-Features: AUfX_myUV3Xx5wjT5xpW_9kPbTIvUToAVZXKQdsgk1k18pyiY3j3cgrBd5FxHu8
Message-ID: <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Just following up on this - wanted to check if you had a chance to
look at my question above. Happy to send a v2 as soon as I know
whether the concern is about correctness or the label structure.

Thanks,
Sailesh Nandanavanam

On Sat, Jul 18, 2026 at 1:27=E2=80=AFAM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> > The first two labels only unwind a single regulator
>
> Thanks for taking a look. Could you clarify whether this is a
> correctness concern (e.g. the fallthrough from err_enable/err_set_load
> into err_set_voltage not doing what you'd expect), or more a
> structural/style preference (e.g. avoiding three chained labels in
> favor of a different approach)? Happy to send a v2 once I understand
> what you'd like changed.
>
> Thanks,
> Sailesh
>
>
> On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > > In q6v5_regulator_enable(), when any operation fails for regulator at
> > > index 'i', the error cleanup path unconditionally calls
> > > regulator_disable() starting from index 'i'. However, regulator 'i'
> > > was never successfully enabled at this point, resulting in an
> > > unbalanced disable.
> > >
> > > There are three distinct failure points:
> > > - regulator_set_voltage() failure: voltage was never set, load was
> > > never set, regulator was never enabled.
> > > - regulator_set_load() failure: voltage was set, but regulator was
> > > never enabled.
> > > - regulator_enable() failure: voltage and load were set, but
> > > regulator was never enabled.
> > >
> > > Fix this by introducing three separate error labels to handle each
> > > failure point correctly. For the failing regulator at index 'i',
> > > only reset the resources that were actually configured, without
> > > calling regulator_disable(). Then roll back all previously enabled
> > > regulators using 'i--' in the for loop initializer to skip the
> > > never-enabled regulator.
> > >
> > > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy a=
nd active regulators.")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > > ---
> >
> > [...]
> >
> > > -err:
> > > -     for (; i >=3D 0; i--) {
> > > +err_enable:
> > > +     if (regs[i].uA > 0)
> > > +             regulator_set_load(regs[i].reg, 0);
> > > +err_set_load:
> > > +     if (regs[i].uV > 0)
> > > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> >
> > The first two labels only unwind a single regulator
> >
> > Konrad
