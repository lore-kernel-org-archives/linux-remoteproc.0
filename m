Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E62F83B4
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954892; cv=none; b=tj4Z0Ps6yvbNYyh4VQbj0Z9HgEdZGPAt8zKxCr5yRnemsiMbGbVUIlN0vNxaFlNsBvbC4G/5lh6kZ56d3F8ZJSZtlz+fh0iUD1A8Noa2PgSPziJ6aFqPAEV2IOJR2oDrNlfUFXtwkGEkWb8ohBMG+v1/lSbT+zU9epT5ioZcJwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954892; c=relaxed/simple;
	bh=IthgwRg6yJ7su7+hxwU0G1XvJdmaJcprtOIDD6R14Co=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l6abppB4AprOIDQp2/fi2lECIxiRBAfJXT4OD9Nx2aaH1TRQYzpVi0omB2owLTDznVCAB4hEFmV7gMhveeYPMwjpSojCG32Tr4aP7p3z+w1n0BxlJif2kupRlRWJNOh7KFLsk0Ay9zfTy/rJlTIwj05QNxAayGZJNwPC9dWaH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iaTmQs8s; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iaTmQs8s"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b4557950d23so81079666b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954889; x=1761559689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=iaTmQs8sGobgcCnAwOGcT2JMt3hGcDM2rPSWUTW1hga8LZ9R+75zYPYjbX7jjgpoK6
         xxGGF0MoeP29S5daUFe6Y7UMZZGOCjnYK7CZjFioe/glBogpjdOLXq/xKJ/A7/pIgFPw
         r/K1Z94H9ICDSPJyHI+itNbBjKgacdeL30X0uxDgGHWtJj9oeJd7uabpph0gOjivglKw
         2e7pZFgFSs1OTsh5lhftQBRx/MPk/ZM5/8l+nordHY7nbjIE62hJhtKA7yAkbxQ5ZKg7
         P4VAYVGV3s0WMixyh4q5nz1FImVxR5IKFGSBMJwNdC12Ui24JOq9cnKwMDoymEYFFJCL
         nZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954889; x=1761559689;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=MJQ9cmlnDf6Fg/7Mv3BtyTI8KxSVbjNKJWFQKBkSnD/Wq08cRYarHyxvhWtfBAnk9r
         +SNx37VuXMtBMhzngUwIyW64LK3OjuyoeNxltkXBGNCNe3Jg6ZF/gUFcrJSsSHphckrC
         3JPuuhJwLllw+mKHEz27smS/y1rHyfJdpxk7Xqd7bUTUaFhBftWq04mtwKKkFaBxLkET
         6FfFb+rsfWplv0eCdh0iRywI1Y7Ttj8XsNSIVYrJV4dRAPgiNgSgg3yDbQGJRB+yYahW
         vo8RpzPM69kVN8CG0OOt1nTrqrnM3HAi+fjA3nBS/3WK6LPvB69skGAnKx0qLxMy5+Hs
         EFwA==
X-Forwarded-Encrypted: i=1; AJvYcCVwTjAYDap4AZRgorNU6CtXIUNWt5VS9YsvZz0W/UqxRgen8hQMVkItOm31BzqFHULieJprhjf2f2/mYUK9/zbU@vger.kernel.org
X-Gm-Message-State: AOJu0YxA907iCmwgz24eizNk4gTjuZjiXHeLCN/tl+Sl6GsM+RZc3nM8
	nIQigkFR9P+5ddmM1ZEtogoOTiAm6Rh/Ms45MnnmQ7t6RSkgymYLNAyHEVIpRVv88ns=
X-Gm-Gg: ASbGncvmaIc1Wy4jJjBjY0rtQemgg6KQehxFQH9lqqB+Psmbr7dCAr7gOP8sHRWbXyB
	HOUap9BrlVGC/ByGwa0I0m59GWheqzIStJvOL02g5TpJpEdmFK8ewsFrGsU8tMOiQYDKgMX1AKD
	TaCOK0KD0/1fhp0XE68P5cIodHYSmVBI3TZ56nwDIjI6+U+rsPlf2RK8gohaN8RU4iOEkeFupPx
	AgvNNCfCenRzNyYT9xSfrY2jJr0FOHrxyS92VlyV0kyBGz3mAWkyt+tRGfP+bbdx1vmq/44hNN6
	noMWz7ZNGgYIwcg6wbIOFrHU02lAYfAnga+SWdaYZadC5DgaqMGeonmPrpEUfV/pAEhA+GbUFYr
	LXXV+ojTUrI0z7epQP0+FGHqy7OHzxiUXSvVAhexmRLrlBPgwmXf1oueDNE3/mT4H3VsQRTdjGC
	Hr9bILB+jGywYlR9o16aolHJu7Mkg=
X-Google-Smtp-Source: AGHT+IHb4qKarfFb2e6yhqx9qlyNVzUbEwguNDAebFS+BWqgt85Rblg9ZZAJ2S/IaUQJYck+aE3lyw==
X-Received: by 2002:a17:907:3e98:b0:b50:5956:482b with SMTP id a640c23a62f3a-b6474b2e281mr817509466b.7.1760954889230;
        Mon, 20 Oct 2025 03:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036846sm740987066b.54.2025.10.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:08:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
In-Reply-To: <20251009222716.394806-2-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
 Add "rpmsg" subnode support
Message-Id: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 12:08:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

