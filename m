Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E84B3EF64A
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 18:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990125; cv=pass; b=AGsxwYIRwTUxGOlITVol1MYYlAV7ofSu1o/DNRZ6jLEPOUXct/nepsgCzudxEExpBQZ8FBGuty977iGFFBIJhL7TQSoUQafA2MUn9QKdR/ft0+w5JGa233mIy1+xT+ldv5B8zjl41TkzWWCL325GIQcPPzJ/Gt23SLskBsC81zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990125; c=relaxed/simple;
	bh=g9vm5w6edydR/psOaPLVrWIm43mfOABWY3KZ4s6f9J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4V8RlxwU78PBlEwDDqv/7/vuql6eUJr4PixoYQNeXqTtOZwmSnm3+HNLkK0/4DjvibO54BBJ07OG/zEQgpJIIKvdoIBFISqpj4WGf6Ur356wduZWwy+vljPN8/QgiHQrtBXrtgdHQ0yuW1cOTQJu1943bxtAK18Ur8DLrDdX7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWHhQg4D; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWHhQg4D"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfb1151c8aso148592e0c.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 11:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786990122; cv=none;
        d=google.com; s=arc-20260327;
        b=Mh92kpKLvaKoiGS9RxnDYJWj9yjzZ4YPy3A0t0SiJCZHmQneiOsnXK2YvBUV0rZxE1
         X7FFhSwnMXzE2n781LHONFNZs+pLVd+7UMQhQGUCl+zibFZq/i5gnUE7n4AFaYDrNjN2
         KHjHluKCaf4gsDnJGFJIuqxtFgQlwHiEANBlYMXpwi5SYhRmvFp3dq4fxMcwjp+i/8uM
         BRY3F/xDMo+8KiEv8J9IzSy+UwSLsYFh1yWArMzEA83/C6eAvqxMAb9y8QoMCUsdSYAT
         FbPQV8iOsHUDW3gMcQHAg+aP1kGszSUU3CBtvRt55LQqktMWmDYmk4uASs77VAQHYK6i
         4Lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        fh=ToytMfvzvI/0dCg7UnCaTVe0SPq/wBn9UF50RliT5/4=;
        b=ksTXUAYcZVaK1XBhtf/A/6MmK0cpFovpdblI7pcWVzGVin7X1dPhrQ1pf3+9M39Wsx
         qbFYjU+CCRn4EUJMKV7mu9bjCXVvVgXgPaHoupLiYTAir6v4Rxt/6Bp6kGxysmef6p+Y
         96VDvsfyc2cciIoWe9TsERzklTaWt8Ne9t3UztKpmwhr2XPj+/CMR1u4JTAH9BjAT8rz
         bmaBU+Ov5T9BvSHSpj8VAItJqfloaFSTiSErV5TUFZv+xR4KmvZ3AVGbrh0T4gf33WKg
         varazOc3hK5U1+f/Wm0TCbUjZ0r+RxLIc++Slvyl3Xv2YETrHrDMl+2YD1iytuQPHZIc
         x4XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786990122; x=1787594922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        b=BWHhQg4Df0G4Rm6VKsGONzMO4otwcPwIq8sHSLOt5GLLVFrjMsFRPRS0akYr9QAkm3
         CsbGg2oTdBDbAfDUlDnz8Ea42ugJaOJLwKeyS6nrq4pE0/2LZWB1kGcqyv2+XraQ4Bdc
         Pc//YYPeKcf8+vNfOz6dBX3w+UMV+85clBEM+NYLoZza36N30MnVzEZjeqsW5gG1Tv7T
         D1Q1RE/MtUM694HEXDdoP89V5KzDxZC+pxbhictqby7StjSesm9eVjgGqBJ/SiBmdLVa
         C4DcqaiNhMvhqvKSsaRDsqiah82WBC6VjfxNa6aD4Pp3FVzVKZm6OE9vgs5SYOpamCm/
         a26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990122; x=1787594922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5mJBVeRBN256FUPWqFXAEOzYwxXlado9G43KCVVgU8=;
        b=Ec7gNcFaUutTk2xzK5LOg4QiVnU3rBuTAzJ9f+BS5znRFmcBtze9M4N8ru0/oRyKOD
         k92i2PuBn6wPKCgqLcI3OjhOq8bn80kbuIQAg7F/QYdJKEWRtaDsJ+1YfrUpExK8Q1uy
         h2AhfcDZLt2CDSrf/pU1zIFPLCZea+pFZPho20uYVMq54p3VXEmU5CmdXuWdxBbG6hpG
         qkHLreUbTnGYbgftkGn1f3A2diVkxdoMHsn5gjJY8uozdaFiUlfkx2caC2OFig7mUr9/
         jUE5HUWabEzY6Uw+AGV5MWdZu5vUKCUQdIYHC6goL1hSs/mAysm6cXDqANEBAHd0P6rf
         rSsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfUYSIR6wgeKCBUiAi0ljxPA9dhFpjtNlCfKu4MFpJBkIAOA7Ro1aeaCOGiPvgKnOfYWIIgslzO5SSs83leJYA@vger.kernel.org
X-Gm-Message-State: AOJu0YyC32oJC0VLzAplzVtjBcj8T0FXXab4vC43RoMNWedIeddtp5QQ
	NG9M/kXd8GnjzwvVVzCVOMb3MDN91QJBNRGOisDSWboSyMiVbpE8/DTkiHtmrH9Ce6ZWCSMGA3w
	F5YLL9pW3xLRgN6n533JVKQ6GTO5j7S8=
X-Gm-Gg: AR+sD11WJATx22X9rUkxNMNJcO6rYqKLBOVE/3va45+yuRjt1d7VNHcFvf66SH+91PU
	ZqQCQkLugG9myuQw3UhgMagrpEzEho7Y6nh70vF8zBDDSDK6eV+2ZQuxHd8mGafQd55E4xrIlvV
	UVGLpDQOXtQ310xqNjVEDKWKono1tX3Bc+tx7ORhwhWNJbGdpqpdFCNaY5SXAwH2rpuIl9YVONA
	/JaZb7A7ilJJvNOTzQNGw8ZzivsamAQ72ug9NGvXBPpAm7auDuZ+9sZJEX0GBOnGbCeeKwdvr1Q
	oe2sgi1nn1lKySsMUR4gfwjQ76fiRqirOuMnA5RBoqLNS+Q=
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id
 ada2fe7eead31-76f2cd6ba90mr1698150137.3.1786990122356; Mon, 17 Aug 2026
 11:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
 <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com> <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
 <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
In-Reply-To: <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 17 Aug 2026 23:38:55 +0530
X-Gm-Features: AcwNN1XbJOOIvkV8kvtl_H-i18dMwgL565JAwIvCltqfJM4L9alfTNXqZpQAn-0
Message-ID: <CAF+TLO2YiAUe0Yqzg5fa7-wKUVcjWUzULszhxYbzLqFak_zk9A@mail.gmail.com>
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

Following up once more =E2=80=94 still hoping to understand whether your
comment was a correctness concern (the err_enable/err_set_load
fallthrough into err_set_voltage) or a preference on the label
structure itself, so I can send a v2 that addresses it correctly.

Happy to rework this either way once I know which direction you'd prefer.

Thanks,
Sailesh

On Sun, Aug 2, 2026 at 3:12=E2=80=AFPM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> Hi Konrad,
>
> Just following up on this - wanted to check if you had a chance to
> look at my question above. Happy to send a v2 as soon as I know
> whether the concern is about correctness or the label structure.
>
> Thanks,
> Sailesh Nandanavanam
>
> On Sat, Jul 18, 2026 at 1:27=E2=80=AFAM Sailesh Nandanavanam
> <saileshnandanavanam@gmail.com> wrote:
> >
> > On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> > > The first two labels only unwind a single regulator
> >
> > Thanks for taking a look. Could you clarify whether this is a
> > correctness concern (e.g. the fallthrough from err_enable/err_set_load
> > into err_set_voltage not doing what you'd expect), or more a
> > structural/style preference (e.g. avoiding three chained labels in
> > favor of a different approach)? Happy to send a v2 once I understand
> > what you'd like changed.
> >
> > Thanks,
> > Sailesh
> >
> >
> > On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > > > In q6v5_regulator_enable(), when any operation fails for regulator =
at
> > > > index 'i', the error cleanup path unconditionally calls
> > > > regulator_disable() starting from index 'i'. However, regulator 'i'
> > > > was never successfully enabled at this point, resulting in an
> > > > unbalanced disable.
> > > >
> > > > There are three distinct failure points:
> > > > - regulator_set_voltage() failure: voltage was never set, load was
> > > > never set, regulator was never enabled.
> > > > - regulator_set_load() failure: voltage was set, but regulator was
> > > > never enabled.
> > > > - regulator_enable() failure: voltage and load were set, but
> > > > regulator was never enabled.
> > > >
> > > > Fix this by introducing three separate error labels to handle each
> > > > failure point correctly. For the failing regulator at index 'i',
> > > > only reset the resources that were actually configured, without
> > > > calling regulator_disable(). Then roll back all previously enabled
> > > > regulators using 'i--' in the for loop initializer to skip the
> > > > never-enabled regulator.
> > > >
> > > > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy=
 and active regulators.")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > > > ---
> > >
> > > [...]
> > >
> > > > -err:
> > > > -     for (; i >=3D 0; i--) {
> > > > +err_enable:
> > > > +     if (regs[i].uA > 0)
> > > > +             regulator_set_load(regs[i].reg, 0);
> > > > +err_set_load:
> > > > +     if (regs[i].uV > 0)
> > > > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> > >
> > > The first two labels only unwind a single regulator
> > >
> > > Konrad
