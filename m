Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DE1CABA
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2024 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735090; cv=none; b=qStZuHGL8sRlkV7QO3OV/t+emsA1vg1xEZpFaLycYudla9G9Xyx6kLqZIUPijmhbCv/IQSnsE04pobPfrjb73L/+qt7zUmHgRcNA0h9xyDOd/ismHEUDUfEmxnxYcMuKahVcUPdpXIxl6NT+NGTV52Yh3drE9UvUNWMxe0ViPRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735090; c=relaxed/simple;
	bh=YUB/0fLcjzGXnwiC4zI1rAwoYYavPrkSnnTvrKgHVVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=so1l2j4z9Nn1wELHhYdp647g5ZMLwJHvimZNfxOtT8W21ClvQFDXJxSv6HL8VZDJQj8JDOfzVwohs3HPKTQQfRVXnmCVEfz5n3vVuScf3KkshM7yeiLyb+S0w6oewy4LBkYv6dm+5P+4/Ly8Jq5TT25Pk1EY2IbQHT9s46hxMQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kECUarCj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kECUarCj"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso669241e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2024 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726735087; x=1727339887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C+XA2XAWTlEdnUYeup2c1MqxMCgSg8DqVZ7RmeOX0C4=;
        b=kECUarCj/Gt5cEVNs9xUe8O1bQxsjXZizU/puJ8+tdoVDnXCsLGChdhKe/7+O44GKr
         pLyOfHg2spq++wE4/5fkdJfUMXBqaHWMNYKIchVQvmfchdeOl/5ksBvKqEv/xDHCJgc7
         xXX51MZPCFjhfKj2wMWl/Qetjs+5NVnaoS2f1iKKYys5axcSOsldAjUFWyCpwdcGOuFJ
         91+CugzM1NuVKZxrr2sUqg2LUoC2F+YrawQnhJ7a3QThZsz9UEqXSsq8VDXemPInGIXw
         nBk3MfQy9Lyd1Gyi6boM2Uxq8MwyDVNaN2t/+qNCM1hx1aVf3gbTZrZbVGuun78m0kZQ
         XOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735087; x=1727339887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+XA2XAWTlEdnUYeup2c1MqxMCgSg8DqVZ7RmeOX0C4=;
        b=CT2pz5aO/EAPr2OaWh/WiVKqg50X/YelPKMUK7LOwNy5r1JGBvl1j3bXb8d2W8K4ZI
         UJwvNy3cwwYX61pefLAj9v8sEJs7QGl1fiuvyWOzAij1y2+PBgJwwwx/vglirRChULMW
         2cHYdnHJyOhsGmj/jwvDV0C6GrreX3WCSmhxU+Qk2k0cjGr1rKlvtL49gXZn0BmOizgM
         1EaSUSlRpqMyQhWeNPNay13roGN2Qd4Wn5ZNkvdkuz3raSJv5iJx/juCT7/0hiPIxfzW
         xlJyZ0miAoVP7T8sbUfTVQqsVjx6YCVP3S7bR8C7EoP0tCDhljOCG6WAmxQ+4eoO2x6J
         Lh6g==
X-Forwarded-Encrypted: i=1; AJvYcCUViaEf0DjGpI94QnPDmm9w6PpliJrDeaC0ojA0hmwOXeUIkVlLIHRLFogIcSD15HFQnPcBtL8uHLLhw/ZJPHiL@vger.kernel.org
X-Gm-Message-State: AOJu0YyczYEx9uqeO+GEn18cCSf4268G701/Y0fpZTav/9yFggbZo7Od
	z1Oq6OtTzHe3QNbqymsAQ+j0Ie3C10+Yt7TANOeaN9hKo6h3LodNvuIjRhAJIC9c0PmflxThDRk
	R2xFT0+Dflb3gxP0P9A0cKE+9fUqqzgQEKNYvzQ==
X-Google-Smtp-Source: AGHT+IHlAd8jX3MKXVZb3aQKjC/g81iL8wnxQAiPyiHoR+AGu6/IS3gYvhYY5jrJ+9pB346nDJEx10hOjjAtq+yuc60=
X-Received: by 2002:a05:6512:12c8:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-53678fec522mr14377896e87.54.1726735086540; Thu, 19 Sep 2024
 01:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com> <20240822170951.339492-6-abdellatif.elkhlifi@arm.com>
 <20240918154000.GA55399@e130802.arm.com>
In-Reply-To: <20240918154000.GA55399@e130802.arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 19 Sep 2024 02:37:55 -0600
Message-ID: <CANLsYkwgNoSnkqdrWYp7JvP3mF4d-h1iO7LtZmaP2t_+R7pF_A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] remoteproc: arm64: corstone1000: Add the External
 Systems driver
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Sept 2024 at 09:40, Abdellatif El Khlifi
<abdellatif.elkhlifi@arm.com> wrote:
>
> Hi Mathieu,
>
> > Introduce remoteproc support for Corstone-1000 external systems
> >
> > The Corstone-1000 IoT Reference Design Platform supports up to two
> > external systems processors. These processors can be switched on or off
> > using their reset registers.
> >
> > For more details, please see the SSE-710 External System Remote
> > Processor binding [1] and the SSE-710 Host Base System Control binding [2].
> >
> > The reset registers are MMIO mapped registers accessed using regmap.
> >
> > [1]: Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > [2]: Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
> >
> > Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> > ---
> >  drivers/remoteproc/Kconfig              |  14 +
> >  drivers/remoteproc/Makefile             |   1 +
> >  drivers/remoteproc/corstone1000_rproc.c | 350 ++++++++++++++++++++++++
> >  3 files changed, 365 insertions(+)
>
> A gentle reminder about reviewing the driver please.
>
> I'll be addressing the comments made for the bindings.

Please address the comments already received for the bindings.  I will
review this set once the bindings have settled.

Thanks,
Mathieu

>
> Thank you in advance.
>
> Cheers,
> Abdellatif
