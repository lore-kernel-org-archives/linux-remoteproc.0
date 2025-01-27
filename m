Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7E1FF601
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985469; cv=none; b=dduzKvEOXduKnUvnvXK6x4PY+KNl4H3ZeCt8JZ3/TxSwC7XNNSP4j3I8/4hhL/+tGLeqsaynv/F4KCwjmMNc41AE1z7zbtcnEG68XBsbWkgk5EOEQblM0iWii15MK/VJF0ZgGuagF6yWz8lhgwiwz7dteNJa56JLeyhsLDteHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985469; c=relaxed/simple;
	bh=Rkx1iTUUeQZ9jItjTalKVKe5WXo2fdI4KcmHPpiHqRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8Jb0FKDoiv9X5DCzDuOdK+Cdjk73oNyPjnpyjdCFP9CHQqmCrBiAQ+fWWhy7SMR8TwdsSz4AIvNymCuQLoNrmaCxR1CDUeDDycLM7sCh3+8G26R3vKJfSS1aVFcMxblrEDpwG5SS2rhlOOlzB6fRzSUGI3b2c5Ms/jajmqb3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uplUxJmG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uplUxJmG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so51487025e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985464; x=1738590264; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dzExPNnBd5BadPD/edPrSpxx4imET/WpNDJrURoTE0=;
        b=uplUxJmGoppbh4zz6hGf2VSXzkgiEYeQ11SGd8LNLhsLTHFFJ01TRqW6Odtn6sePKY
         lgGhfiyrmMeeCQE7CeiDQS/R+uTM3zFYEvX7bVPV8uQcJFglaSTcAXgp/bYk9NOehTIY
         F0OlC4BJr5m248IVqiVZifUyXute/29GlSjevdyXpm0dZCzR5ZV4KOaWGfRLA79W6P8Z
         aQLQumCShRQG6NMImTdqIiN6CRkQQ0VukVhy8eeUz9rmaLo2uhWwWlL/cAKzQCRlG2u+
         aGDDYf5t9HyEVgZsxW5l4OsJizvxYURwj0nEQCtkJy7TapDik3cySJwGl1/kughQNe8h
         7wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985464; x=1738590264;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dzExPNnBd5BadPD/edPrSpxx4imET/WpNDJrURoTE0=;
        b=IBmaEgsaKScJQosm9rCsYiNGOcT0ua0eMF7lj2G+NzC6lCMG0uLE+LS4I8SlhXpxsp
         20C67lD5V+L75gfn2oIWnxFJSFYhGeY/4E5C+blwxrnrlPCNePumsA8v7fAKfB2lgmcU
         4hfHyKC+bRsqzZD+kxnurh0eGFYSUh0Z+ZS/huGH/2kRQvlHjmHw6KyypiZQA/aUZBme
         Pa1WlTJNxqMp6T5UrRp121lXcGlOeRWMgdt1ldi22Y8Sv7Vuph8gXGpwp0ckvRapKXUD
         G1MFj4QEvLroBh8uaCmNjs6TfkXzrR06Qq2mSPIbdvz4BJFB2rX8iYlPX7NNEaUbXA2l
         +CxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwxK8OqVhOgjK1+KdwGBVTB5vjr0lPhlB/IU1CcRQHWBALC+TBtDxwIEDBgeYCng2dyVlTIQN9avqQOZaZJkdV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6UyeYO25c0fCjO91QE6bHvkjxMkrVfgrYHWj+wvpVzewNGFr/
	1Uloc2nkTUN1naw0uSHCqDZwhq4besIMDS089dY3xZJM5t0kQy88QpOOjUP48d0=
X-Gm-Gg: ASbGncucEcBSFcnStkczQucBjvXjtv9JZ5HB8vM/YtubQPbioSO7Ybf9C/cDNypt2M3
	TR2n/NfxzR6OaPjHmUarLq0OSfT2qwKBCal3u2Em3n3FWMhxlxS5+Fz0nht3z2wwDRNjSKwtGkV
	94VZRh+abZTzJMbcCgVGXUphqU7fxlFu4QXZfFyw3JTp0C6FX6OZof+8kzyAOV12wsuWW36Ky8N
	95jtiB2au9XShLVLyITotV+5q936O/+mTyXsbHXcro08Bd2mJi2InrW7bkKGzJduPK1IQQ5dieI
	CYVEkusnIocsK7te
X-Google-Smtp-Source: AGHT+IFcNIACKzDb7XoSvjv5r3ta+0ItVzl4s9sZxBESJf9DT3bmkXC5vB5QT61u2Xtp4cyOELCBYA==
X-Received: by 2002:a05:600c:5486:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438913ca694mr374369155e9.7.1737985464361;
        Mon, 27 Jan 2025 05:44:24 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:4750:4bda:32ab:b090])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d2a82sm131777985e9.36.2025.01.27.05.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:44:23 -0800 (PST)
Date: Mon, 27 Jan 2025 14:44:18 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Message-ID: <Z5eNsk5Vvp6BxmJ9@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
 <Z5dVc9yTynAsPDcZ@linaro.org>
 <5638469.LvFx2qVVIh@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5638469.LvFx2qVVIh@lucaweiss.eu>

On Mon, Jan 27, 2025 at 02:34:08PM +0100, Luca Weiss wrote:
> On maandag 27 januari 2025 10:44:19 Midden-Europese standaardtijd Stephan 
> Gerhold wrote:
> > On Sun, Jan 26, 2025 at 09:57:28PM +0100, Luca Weiss wrote:
> > > From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > 
> > > Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> > > 
> > > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++
> ++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-
> common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> > > index fbd568c7d6b7415d240aa1a2329d07cf9135274c..
> 4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
> > > --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> > > +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> > > @@ -225,6 +225,13 @@ &blsp1_uart3 {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&modem {
> > > +	mx-supply = <&pm8226_l3>;
> > > +	pll-supply = <&pm8226_l8>;
> > 
> > Hmmmmm, so I was looking at msm8926.dtsi downstream and it seems to
> > override the msm8226.dtsi modem/mss definition [1]:
> > 
> >  1. ext-bhs-reg is dropped
> >  2. vdd_mss-supply is added
> 
> That's the same what I found, and have working with more (currently hacky) 
> patches on msm8926-htc-memul. I decided against introducing it with this 
> series since these patches have been pending for too long and initially when I 
> was doing 8926, I wasn't sure how to make this into a proper patch. Now my 
> idea is to introduce a "static const struct rproc_hexagon_res msm8926_mss" 
> with the compatible qcom,msm8926-mss-pil which has these two differences.
> I think that's a better idea than adding some extra conditionals around to 
> make the mss-supply optional and ext-bhs somehow optional in the driver based 
> on dt.
> 

Yeah, that sounds good. Could add a new qcom-msm8926.dtsi include that
overrides the compatible and /delete-property/ the ext-bhs-reg. Then
just #include that only for matisselte and add the mss-supply there.

> > 
> > This common include seems to cover both apq8026 (matissewifi) and
> > msm8926 (matisselte).
> 
> That's a very good point. I didn't think much about the matisse patches since 
> they were introduced by Matti but yes... Either I add the msm8926 support in 
> the same series already, or we just enable modem for matissewifi for now. I 
> think I'll opt for the latter since the series is already 9 patches long and I 
> don't want to make it too complicated.
> 

Either way is fine for me. I guess I'd personally throw it in one
series, just because it fits well together and it can take quite some
time to get patches applied. :-)

Thanks,
Stephan
