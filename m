Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F37C1519AC
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301883; cv=none; b=a7UP/GGLQfhLL2O3Kh5bnYcBUs8a+rKa4INhqr5E/z2yTp9bx0eUcCaZRjBJ6nEvBtlsy6s7YpyAcMyDgU2eXQVpL9sINM/gl2AiF3+Tnyr5xkeqCnFQikSkdF/tcukc3ZuDYSgSHobcqyGcWc+jrYw6OfujvKnkd05EOTG4oiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301883; c=relaxed/simple;
	bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVrysNQ4KL240LG4R39docE5OK5Ojq2+9+v4xnqj2bDV1L6Or16zJRTTtFLkMGqvqw95zNqd7G3kQCNOgbJG/XcxsWy0e5940s0g7XqCLhhXbtUxlCsoR9GhTzL/Ix74VHzYimCFTgO3xVo+pus8NLq6xyvvx6dXp6z/0pses/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ldnhcjb6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ldnhcjb6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3696f1d5102so60095931fa.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759301880; x=1759906680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=Ldnhcjb61uXjdr9zylGJieG7AtCoVHGe/ndwlXeVqCx6H544qlfC1sH5cpv2fqTHI1
         RD5GlU8CPdbfnKSEgyF3giOQomDqZXaWxnJtWxXUiuX00QyUKi1AhLsVg8k2AvBQ2hia
         272ay5lBDU1ncuQ0d3X5JNdLUZL/6RpHv9av1Zx7VTILQN0gyW6oTXxsxMHdsFrDMOnM
         JLHDVEdpRMcqcFtB7aa94g3aFXWY/G2cqHbyKShv1lBpCi0q5cW0jsKyC7gbJxTTCpqC
         /2DEpllaGzlJ4okIyzBp+C8wNZRu5BACHK6iY624SuQ098FPWDfexnCLHEQnC/rwN24t
         x+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759301880; x=1759906680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=IshsRhTSMkXg6jo+5zTqLd7Lp9+n6RoK3fyDKPB2fImEqnfiDttHHSZ2fgceH4cHI6
         V7Fhd30ZSx0mIIrwToEHDUjCGY1jvozQOWbKZO9epRmIj3KfdTq8Edt8nuUemRAXcQ37
         euPe8OUhFMXt+M3GlZtoTi3yp5fvuCCT3LtdUaym37pUFVlOc8cRc3gLOSvi/FhK6UjQ
         JtArljQ0JicpKUc14za+jAju7sh4ffSBlbHmfvaRlyoQzrfMq4wwlJGkx/t7Z/d8chp/
         PFjUHhn7WGALZ8Wo624VqKAnXdCXwHpTF9rIWSttev7rm+EAxsvSNz3zqV3YjfkFZhE/
         vNuA==
X-Forwarded-Encrypted: i=1; AJvYcCX1/iLh+zjmqLyrKSRf1i52xs0oyzCMuKKSAQTZXcXm1JM1bzU5UOR7hXurHm90mpYYtPbdxXoStnpwyk2RrE3/@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIo7zojH47w4YuF9+ZtUczFYmmKX/XDULV7ChYz8WXZVX2L/e
	bbI10ILByVk3vUVEsH+VvoY5bS25ohDhJMmtQ0Kzc5z6f1JeAAx8CIXtU/VM+no/c5jm4Bp6WWJ
	HCS/m/gkZtj35R84tscjFPXDCQMoY/SEdHMRxVUA8MQ==
X-Gm-Gg: ASbGncuor8Tu+1E3jUp8zGf7ZJtduI0+PZUxvhXmdCL55A6Z0VRHdZPYNyaR3p7X20c
	SK3+AXspgp4jjF6HMzBQbNu8R87QEUotLY2+OrtEI5Qcf+2qobi3XRfKk1ReqkbdukmQvWHTkkJ
	h5YZpkj5s99PA7d5qQ5KoN7UqHhwP5wS7+PH09Gb0EwMJpMXXK4pc0PF9Ox7RW6FLpG9E+Ofn2E
	d2XENgM4mY9XHE4bfYAGF1KAMD1X/o=
X-Google-Smtp-Source: AGHT+IEFYBTk9nGSfmBNRwdlnBZfU/Sd6UTKJyGtF8VquxDEPDVY/XxX8lcgahg6Ei0VXCczWM+mbwbqwLB0jcHsDcE=
X-Received: by 2002:a2e:a548:0:b0:332:37d5:da95 with SMTP id
 38308e7fff4ca-373a7404f33mr8420991fa.33.1759301880298; Tue, 30 Sep 2025
 23:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922200413.309707-1-shenwei.wang@nxp.com> <20250922200413.309707-4-shenwei.wang@nxp.com>
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:57:49 +0200
X-Gm-Features: AS18NWAuz5cqgLXrZSSINvwGEDmvTaVcLOQI-X1PgOUAiEVmWUpsc5bfCXSgBKo
Message-ID: <CACRpkdbB+DfhqUE-fsz_RQ1U02+nMEhNsXrKB4bd6dvLDLjWUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Shenwei,

thanks for your patch!

This patch was not sent to the linux-gpio@vger.kernel.org
mailing list, please include that or we can't merge the driver.

I think the OpenAMP project should show interest in this
patch series so I created an issue in their github:
https://github.com/OpenAMP/website/issues/122

After fixing the issues pointed out by Peng the driver
looks good to me.

Yours,
Linus Walleij
