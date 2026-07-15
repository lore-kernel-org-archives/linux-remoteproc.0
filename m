Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF53C1A9FB0
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084520; cv=pass; b=htrvdki+e50ingQZGPtB4v0qIb4cSYZ12YFu2CjLyBAVT7diXRr8BTfxHCtKWJWhl98yQNkS+pZE04dB2GZ6yYXVJpkEx6K/CoZ9DSSB7F10M7K7tNWUDl1GHM3J5S2KVEh51NumKlkCCzKltPpMwSmnd1Yleta3xlnnQwfXAvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084520; c=relaxed/simple;
	bh=gztsi8R3KcnU2Y68ziTBqFgTiO1IhBQcSODvmhfJT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQONx5ndJuVFwmSNCxwCMSMKqQuz/TILKXt3gz94JMBDKmD7XQL+Kak1uFVYYQrDxNWbVLida0dGUGTDIqebrKPyqoHVXZHseN82GkU39u0y6qsJFuQiEkFWaFBf3VZt1ZlV5bsLz+S2BtHTiuoTR083RTJRDtIt1iIekZNEqhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioVAyP0F; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioVAyP0F"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso29785061fa.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 20:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084517; cv=none;
        d=google.com; s=arc-20260327;
        b=j03+bVzCYzqHOUpM5mZ7nJoX22P/qDjZHmUQoL9hKL38tWEbNh7KfI0QGjfSJ6E8gl
         Lw/Glf0Wzm6xuX3FXiMfxUqeYkQ93tAWZlU9+bLgFY3yJtA/j9RdCAyHViNqe7eCEAbu
         IKVBb20dWxttE+HQP/Pi4lypdPFOdqYBgAwUxT6D7CIH753yJBgg2MDwAlnqJWuIJoYb
         xyzFGNjX2GNCA2ZSiliPGJTJngMd4UBjgpbH5C9Cn8+S1FheKfokibRCGrFJbcdiVFCR
         hUCYl3l7foCm6txmxVdzCpZG8L+/uKt09ZJGsGsFXReErRYyZAj3lVXG/s+8XClgloMh
         Fhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        fh=v05WHVCZiZNT0sc/Gvbagu0D4wxeIm8kPSzHbW4ejqo=;
        b=IGHzFG7NCfjztJQ/JNqXyNZvaapXRxa4yXjNVxn+rg6tPB3ChEB6x9NMDYiAjZCwCY
         r568H+z6DCe8fT6TuS2+AytXuReEs7CygvjdEDfO55FBVQIRRse1Ge3MyZpaaIKHC1GI
         KhYvzWdfh1YYKpZKBGO4FqITNyHdiP3Bo0+2trVsDQWHyzy5uXartSdIYzz4PDWaum2c
         aqrv/1xH/VmDkDaF62/Z730F+FfPBdaWTdTx/Az31kmFkOaQAo3WlYJGvcSaCf1Herzd
         9bJMnouvGnjldKPqY6ibQSWStw2HFW6Dc4mmFtuCuxFLJPemBNMyHn/QB0/Rd0DPEqa/
         lP/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784084517; x=1784689317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=ioVAyP0F9MUNE71P5kQ8il5qAayvaiadBfcgm5D1LMivu98tZwvhUTJpBSNn2hd1U7
         ChYfEZ5anj5XmVOqvVXjLNwmpSwX6I25ImvSxCvwhda7InJ0+owWsPvijsVHdZAJy1WX
         p/fYf2JRc80o8Ofcgf7IFUsAwSIU/auT8ASPZyEBLhOkRA3FJBUiRKDvWE8tL+Jfah9v
         /Qmtz9UHdKzRgCu5PUOy8vJK4SYMXOduihfY6QslzqG6MaGWbogUnhf1uLTg0oxf7pKi
         3PzhC1rqNJ4UVlWkkybyWLO64LjPL33M/QaI5mf9xuH++b4/Ba1ZfTQQh3AeRHzQubSR
         9DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084517; x=1784689317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=e5205tQIWTqSjjJnbTSNy4jclDYZ6mP7sdbchT+wjh7VYWIzdipkjnpw27sWnhWa4/
         mQSVG7X871smBWrfs+TGIi+dPJZogfr4Ex9sRSy8ZSXWTinloL4M0KqCIUyBnMYC1tcJ
         r8Us+2iEbGp2O1f4GDgZjWhPacdwgCKvpm+c95FXcrUgJVuQGJVZAGBUqfTfVGqRKJV5
         2B0n3w7PkkdqWwLmmZKZsREgm13cO8Aoxm2COTP1bNtbph591GBXmtOfZU7mi3V0a+Lx
         xavc+vkP42CZX+n70bMYNEIuspGDnbwO+fsQSPH/HfiXHBRj33Q1jHJfMutNJFeCBMt7
         O6JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqo/2QaD+CD7iyBMaa49kw1pLXhk/k5b7LRWB1LaSAXZ4AexzxzqN0LrNrDBdemmGBrY7XP/FRTEo53NN+F/sG/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WhLlG0sST197pyAbJVwUb6zVIQSOOQM3X1f3S7rc3S6BX0Fm
	ceW4zM4Cxix1FXuWNtu0HKxJHK0aj/dHgAQ5Iv3YjtkhryVKj1NehVJ5JxrHQoiewlCxdedC1LB
	TWko0u6ZEafV0yD7R0km3JMwHj1xQqOU=
X-Gm-Gg: AfdE7ckW8/GfQovqOlcCuP8CmXih23ftIv8ieAHurufSNrjE1H2SlQhH/2S6zYKtjc8
	5fokqwJHqczJRlVL8J4WCg37NDBxFmeeUPLXMuZkYYvmxCJ1/Zh/3oombPcCvZBq7SUqXldf2E3
	VB/qrFkckfNfcUnM+CsDAkYx21/jvXeWo3gWUFBMuLXpM6vaEHppVMT8gVFwlcGAYLEtsc4Tn/o
	TDWctS1LhzSpoA8ndSXErny8y2URTJYSty7rGPeOWKm028EKBkPuBRMShrQJP4Xi7Ej2eZm0Qtk
	lgT6BvdP11J8DeUkhTB3XGbqeRrDC93z+T5qka0z6chdsd7vaCg1CA==
X-Received: by 2002:a2e:a902:0:b0:39c:9aa0:799f with SMTP id
 38308e7fff4ca-39db6d92796mr2546101fa.33.1784084516752; Tue, 14 Jul 2026
 20:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
 <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
In-Reply-To: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Tue, 14 Jul 2026 22:01:44 -0500
X-Gm-Features: AUfX_mzpMEopUQE7TosDVBxiXPh_gfwtw_3Imj28x21OlNZglehtbqTvg-XngPU
Message-ID: <CADi83T6uU+L5+SxnZsHN8ejUZ1JfQxv01q92wF_y6MbVsOu=wg@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gma=
il.com> wrote:
> >
> > Hi Rob
> >
> >
> > On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> >> >
> >> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> >> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_=
wcss
> >> > > driver. This firmware is usually used to run ath11k firmware and e=
nable
> >> > > wifi with chips such as QCN5024.
> >> > >
> >> > > When submitting v1, I learned that the firmware can also be loaded=
 by
> >> > > the trustzone firmware. Since TZ is not shipped with the kernel, i=
t
> >> > > makes sense to have the option of a native init sequence, as not a=
ll
> >> > > devices come with the latest TZ firmware.
> >> > >
> >> > > [...]
> >> >
> >> > Applied, thanks!
> >> >
> >> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struc=
t
> >> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> >> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT =
schema
> >> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> >> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
> >> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
> >>
> >> Why is a 6 month old patchset with reported errors being applied?
> >> Anyways, linux-next is now broken. Please fix.
> >
> >
> > I must have missed the error reports. Can you please point me in the ri=
ght direction? I'll get on this ASAP.
>
> "make dt_binding_check" on linux-next.

I see the issue:

      DTC [C] Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcs=
s-pil.example.dtb
    Lexical error:
Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.=
dts:49.28-51
Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
    ...

This is easily fixed by applying PATCH 3/9 of this series ("dt-bindings:
clock: gcc-ipq9574: add wcss remoteproc clocks") [1]. It defines the clocks
used in the yaml example, which resolves the issues. `make dt_binding_check=
`
is clean afterwards.

Would you like me to resubmit this patch for linux-next?

Alex

[1] lkml.org/lkml/2026/1/8/2278


> Rob
