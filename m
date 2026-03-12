Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF140DFAB;
	Thu, 12 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773350555; cv=none; b=iN1UueB+ot6Yqd/4oY8kZaEgLU6I3C6wfBlS9EEbKfjB7ug4rSpkuRYPRX7dHUuGEFb4o2uP219+hYvXMNmbAC95SN5bhOekyKihEKGzgHin3xPILMfu1UN7IKew7l+UsUMEzzCbKve9yaj/yMFVQ/ICUNn+sqqi7aKFQ8Cv5OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773350555; c=relaxed/simple;
	bh=/zvtEPkxlEgdmnFalEG1U3RoR4ZCdTxr1BmmuBoEV4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ch00F50x8RTfZ35KvjNuN/m9e2MGt6/iNbq24fp7JLyTYHDcL1hehsQmtRgO1K9vYFVuyB/WyYBSJkeGee4x0Ae4P4bm0CM9gTWfTLVAC86cktUxLeWh3BZPwjbR6+yaK9IMi3gl7f7t6fBFE8doqod3y0rU+lP5xggGeS9O91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h7EhDaTl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h7EhDaTl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VaKdAPIhRe7hUwa3N1bm3F+VQZ/SJ2cN2wS/xw5qz0k=; b=h7EhDaTljoHRTEjOZc23S/5KX1
	67fuWmr68q4OpVVEWejRDeGdUwEubyfUX3WGmb6LNbRFZ8FNgnMT52AbcszdNLZk5dPNinuLVIkZd
	ls00q1AqcLhKFTrjeXMUS06rIFeVT6Ow3mMSyQ9nwNcvEzwyeGh+T1an87tZz0pfjisySSMsFsQAW
	Bw7VVIPwGb9xyP16iOBQSyocTX8Ps57n+aTQQuJQhcql65gMeeZfDIQ50d1++RF3xeX2UObuDighS
	Uojif8vfPU8i28PkCfsvr+/3xilstFm+t7lqo7HoDp6Dda+gnNuWJ66hBE27RvQ777VpRda0Jd/UN
	NOsTHncg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nUE-0000000FRw7-1uEG;
	Thu, 12 Mar 2026 21:22:30 +0000
Message-ID: <b60ce38c-e4c8-4fd3-b1cd-6b1b5cd04cfc@infradead.org>
Date: Thu, 12 Mar 2026 14:22:29 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
 <20260312192957.1978329-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260312192957.1978329-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/12/26 12:29 PM, Shenwei Wang wrote:
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..b2daa387143d
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +===================

'make htmldocs' build warning:

Documentation/driver-api/gpio/gpio-rpmsg.rst:4: WARNING: Title underline too short.

GPIO RPMSG (Remote Processor Messaging) Protocol
=================== [docutils]

The "underline" must be at least as long as the heading text line.

> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers located on remote cores on the RPMSG bus.

-- 
~Randy

