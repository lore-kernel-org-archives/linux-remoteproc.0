Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFB2E7F1D
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410553; cv=none; b=WdjtwYQvdKMdp0SkKG3S3t7Aj4exyTm6qBWN2GkMBjVElqAcvNADniUDaf/jbI76zoVCknue2BOWDz2xhHOEtWaTgra4KCVadB14qTwus6RlTGH/6NFOSf7XFbgNIXDmOxRrfy4spXZQPxBSv894CWqa5By9hm98LRGXRN0hzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410553; c=relaxed/simple;
	bh=98G5EZefFkl/9hWfVjLIKGerKNrUGutT82EZGZKIFWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXaOpZWYB5DqJ9WIr20G9mrn0Y3GgIC+MU9jdVdzo+VUs93uvwxQO0yVTzUGkSnnSnP5Q45Rea1UontdgrVlR/mpJ94a2fxK6oc99bwyo2RAOHOIt37lsQwFx2/+3tGijsnM7a2yU/gIonDVJvYUulzun8KhTF2b0nRIIjuqKL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPOFF5Wv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPOFF5Wv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a1022dda33so405845ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768410550; x=1769015350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=nPOFF5WvpP6JYLkGsTCz7jGiTmJo3jwZ0DTpNAB/ow7pn/vlxcFrZpwD29ke0UgB6J
         rbJ3+aio9aQAN/cJ7p7agdIM2gArdtbkKpupdFule2uW9tjzKdw5wzEb9ZLIXMJcefvo
         S1rTBS1zD+I9E0fKAeDXL/qwvanivjt8nVLkYF3XBmJqeX7JxVBfho6z82phixlXxKLy
         WPnDVpUpNanxQJantCenNwBAHx5K1l7rYJlXR5rXwIai7XMizm9lHuRPOGMlEPCR4T18
         bnDIaqGxUeIy+AfCP+wYoJnaDcStXD2y6Np0om2LDbnEqC2gzkvLZ8VzKenPkvEep7Nh
         iqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410550; x=1769015350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=FhfCmqFboIh4VMdbjSfA057hHLgnuXA40BilvYsV4YUUXIKuxcGTkDwjEe3Ejg0Dxe
         YtHs55dXOfkJUZ9o5YyhfM9XyWy2R/caiNKSdy2zoXjJJmPlbigTNaclzZcwr+RHCGJ3
         +m28+Z/YVNPWkOSZu74Te1ghXjK9Sr8HSjJvQquUTLFh6Z0H4J3EKR9463goNEzv26+j
         M/WJ2eLVE6w76Bd0DqUnMvKXkwljb8mkcbMKg3pVyL0cHwNgI5uZiii/f4eSYakbqhUz
         BGLnko584kSk+Lr2V9e+aJQnoVMhZH8iCoze3S234/AH5AdYHz17QHJUzkj907EY86PY
         6fMg==
X-Forwarded-Encrypted: i=1; AJvYcCVf1TXPvkMcGICmm1nQlX8YrYF6PMJ1ZxTndEnj2u/tNnNHgmut4KtMhHOv7+zgl+4H6kLYcEiYVKBkw5vaMoK+@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJag6fjZycELUvu73Mcq38eMRuIxpDkH0zVj4GNfjsXri1mHw
	kKI7FiKIYmNxuKE05Oe+DnxIOR/8pUElkRhioWJEzg3dnHZzJOtQ+V/FMiB90cLUc1o=
X-Gm-Gg: AY/fxX4ng0vRGxBaslq55DuuMDeHHYHkXa0UHCX15L0/K8vZXjdWy9pm4TNOEoNSIWD
	XoN97d+1I21tPUEaYGo+pYY87J49RRYhPhLeGUPEqJF7Jw2RKHc7vElWQbj6CtpijST5NkR1Kzq
	2hsmhovPivgmT4wrGWlm7KHZVzX+8JfmJzO4pr6KEkbQ/oblUij8PBw8SlCl0fzT4BRcwSuc8ux
	Vo+DsmgFbfFlXiLcs1GT01KhYxJ65beBYBNgPmMh9FE+IMulnySMx33iZgjOWo+WIa6ghdW1yp2
	B2ZkA2eeZJBCMx36Q6uuv3rWfFaf4fnB1RXlMTd74K9+aa65COponSHvyPDMLwghOZWBfr9g4lG
	nK7JMjJQU/Xier5cwcRGHKIVeRRQmiiqhjZVHX1jiF/Aohr+uNP5SplwgbmVVH0h7DrcQiqb5UY
	zhFhhZJrPfoc2D6w==
X-Received: by 2002:a17:902:c949:b0:2a0:992c:c54e with SMTP id d9443c01a7336-2a599e33f1dmr33469595ad.48.1768410550174;
        Wed, 14 Jan 2026 09:09:10 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c447:f90e:a227:47bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88d8sm231003025ad.80.2026.01.14.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:09 -0800 (PST)
Date: Wed, 14 Jan 2026 10:09:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aWfNsrpC5Rgiwwp3@p14s>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>

On Fri, Dec 12, 2025 at 01:43:36PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>

NAK - I asked to use the virtio interface (in this case virtio-gpio), something
I do not see in the above summary and the first 2 patches in this series.  This
work will not move forward until that happens.
 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: driver-api: gpio: generic gpio driver over rpmsg bus
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  49 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  54 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 232 +++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  16 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 490 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 143 +++++
>  include/linux/rpmsg/rpdev_info.h              |  33 ++
>  10 files changed, 1046 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>  create mode 100644 include/linux/rpmsg/rpdev_info.h
> 
> --
> 2.43.0
> 
