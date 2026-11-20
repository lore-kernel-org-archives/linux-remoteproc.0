Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187922;
	b=p9725yrAL5Vxz84VeaA1OkXi/wIXqTYTchW/ZP9OIT6dE/zI22cU6cDn7ebms1uBm08k
	 Tdv0HtA5QqizOuGo8KZddfgdiUX18zPOT/+/nEj75FKtsTOgmzo9BzbfRQPC7pEtcRjkJ
	 wgNWzmB/4pMnFMSu2xVqiNCYUWiBkOyewpTTpPqJFqacZDUVa3++F0/M2P6/iNvpmiY3a
	 MZK0M6Ed1f2r6oU1dRQ0Spu4j5BGD9PwCLiqmFJTVyvRMOTOcNKpiCokFK2YWWQ2ukA3r
	 nA0yFWnOS8wGne3uNBmNIAXXSg8+d7C3Se0ZNovb48EbTocWJz6PW8xYep2cNAE2xhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
	b=uIzgR81lOlZ+eygf1Sj1PMLR3PC97JVTTFWpqmaZC3ZNlM5DL5aCnJ+6dYNilEN5gC5N
	 bxM+vqSqp0frji+rvRJ4MlKbnNNPuV4xR8tlmYEpmqjtD5RnY90Og0SJYjjG2Z/MNHtTY
	 Pzsb2dV2CkukTIL23RKWUJu3L2UtW4elbk/Xo/3MRaQwTmVBQv3VoO+mcFyS5icrym8sE
	 7sSiBxFaz/aA3CMFHvXnuKYIuTMPiAhkA4mXkkRKqZzOt2ET6kDMji1cT6SfTH4I8LWHe
	 e5HBiqFRvyJy0WiX+IJWA77uelMC7OP4pQIHjMJO6EEfe8wzAQCnmp0Wkl4vxGvxPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VI5rgciH;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10F606A326
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F10F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VI5rgciH
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b6b22be970so443871b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 07:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795187921; x=1795792721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=VI5rgciH+NelPukarvxPksemY15+vM0C872yQBDjnvmYO0mEdZ1yU0qL527S10bzAB
         lx9fhmDo+3hmYNxdGuAqyY70k49ZDtFVMK49wo/egoKCgoUNM6BUV1i1omX2YHtbQws1
         2h18MfVyFPsqgjDlol5//H0c5aqLvZlDiWLEJZfD1h8dg4ZLbEn2iN+vk+ZCq8hMllmH
         0GAnNvxiKMGy1Ukraq5kyAdwlcepLS2v3Mb7RmxoD/BX1bKwKtJ4ESAU/kiMrgO20Zj9
         v1XFcP3SYyedkXfBS7coTqDIiMJz388N4BWEiwY8gRjeBUNzTbGmZ4t5P5FgctQTqwDU
         uAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187921; x=1795792721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=xrMI/uFD9iZI5nK7MGduNSlVsbtUNNW1PqEbmb9OS1CKzQaAYmppxGMJD23tDyQOt6
         LqsZK4MDwcCoq5HKF/FPIq2RXKxXA+KMzeskeeXEF8cyaMGzfwBDHT3B2EyduOOZ4O4A
         pxDQvErhsEPPaYXV/8DUjiucijbCDX7qiINx5gDeCo1yEjZy5h437Om5nyBEdz5qPdVa
         s+6FrPHd135RU2bUEL8CBg4KNpE07Eb/y1eG/Bn9ibZ4lvJGR6peIU1MEPmJevg9hErw
         Ppt8cXNkaVyBUQ+iLkyaA35fbaNurBjEPBgfW9NsOjfBaDt4ypTsgXPoXoIWAVQpCgfq
         63HA==
X-Forwarded-Encrypted: i=1; AL+hErEDXQSivUsF8O2hW56Tj7tPn/uhS3zFuPxh+4euQYQmmv6ZONWw0QedS8ImfKrX6wXIsIcFcfYNkTOE3bHPtpmA@vger.kernel.org
X-Gm-Message-State: APuU4Z+hcy9NU7IYoi4QxdcVX5lX/6x1FvMMZAZSoWdR0JsoNrJyMBeH
	eLWhlrsLXFG8yrjPM1hkQZVTwHC1QQ1kwUF/cv7JtUqyTUKWso87i6WD+yZ/qOdaakw=
X-Gm-Gg: AYBFou00ASPssAAN1p9qldOI0s1rmykxSyH/02ycux8S/Rk4JQ9ihsQsNEZM45Udkjb
	hQMJ9SuqsT00MoGXnRtO6tUsv99jlj8bfGmWxwkYl2OM/STmn3NlL5xcJOJ1Qhd72VJSis0wG2e
	U5yvSEGjIk33nPh07LcvPHIdrmY3l3IkzeCfHRfyvZfk94at9w/3KyZViaDoNNU11eM9xD8m/4q
	0KZimi3EFvghrRd2jjJn9sbHfLmhreUNkYfJhwmp+LgC4zBZ5wLAx6Z85YN30oTkACoHuZdkN0E
	1P/lQFEmK0TyPEDHkqMdZi1/tjCeWteXVu5G1O7bhPy4KbGYxO3/PO/aYKYBVFhaJ3litw6o6fK
	Oml7a0haaWpaGsZcDCSbChvQtc+UHwolOi338katqP+cnWSgfa9vjhxwtz/B4YlDwLPSd2m7Jf3
	oRASzKV/PF7ajqW/LKCNyoCgNw3yH6wYxXMRKp0nCvbIwFIwnPWetTWoIK7lPlVA2BxDrepZy8n
	4Qycs833/D8+v/NvspISZjdGxfQW1G4KO4aiJtTX9GO9exLPglzLQsqzbaal9qcGScHOK+xbwHZ
	ARdRu8FQ0CHLlD8/y+F14q2usPlqtamL
X-Received: by 2002:a05:6a20:6a1b:b0:3f8:2d33:217a with SMTP id adf61e73a8af0-4014e35c5bbmr3604027637.59.1795187921441;
        Fri, 20 Nov 2026 07:18:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1534544a12.0.2026.11.20.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:18:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:18:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <awBkzr_uxBxgeLvs@p14s>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>

On Thu, Nov 12, 2026 at 12:39:49PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> Changes since v3 (available at
> https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):
> 
>  - Improve kdoc comment for new callback describing what it is supposed
>    to do as requested by Mathieu.
> 
> I'm currently working on another remoteproc driver that cannot use
> rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
> into the local CPU's memory address space in a useable way. With the new
> callback the amount of code that must be repeated is reduced, similar to
> how the imx_dsp driver's load routine is reduced.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
>  include/linux/remoteproc.h                 |   7 ++
>  3 files changed, 74 insertions(+), 117 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> -- 
> 2.56.0.rc1
> 
