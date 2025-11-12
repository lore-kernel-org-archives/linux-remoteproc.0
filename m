Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59042306482;
	Wed, 12 Nov 2025 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952263; cv=none; b=rOQjSRvBPeULoI8khI9uvyDithQwTDvbACYWuehD3HhbpjlfDiAuyavI69FfsoGrPsf/tZtoUJJNmhOAPOt7SpL1E3HZScV3fN6zOHdIT/an8Qy4WAzLihrWSrx3UkGmAOO1qPu6kaDC5Rx3wfTX5qv0yzIgUDyv2Lx80V1Zy8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952263; c=relaxed/simple;
	bh=Y/Te0HzAS1xw4J1YENHr8HkxRQWKOBx9e2X1tTKC/14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrLWrGVAIjHV6yYhACgWw5hFGLYHdux4hV8y8PuzGXRpuNZOdFf4nBKTGWBJ7Q+WKjKfgovn6fOlsqMbJzrR2U8b+zIUuoXR+Dvhpw+r3tmz6TKjqlyu18IlICkbGsRVa9PNRyKNGs8suEeOEKDUo1iTfJJXDEQIOhH249eEiDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt7BT9fq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt7BT9fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B7C4CEF5;
	Wed, 12 Nov 2025 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762952262;
	bh=Y/Te0HzAS1xw4J1YENHr8HkxRQWKOBx9e2X1tTKC/14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt7BT9fqYmX2s6rGY/Y5Pn+fl3hnelplJ/8G0XdVownkJMcqeUveEY+c+6sqke1CN
	 TIaaRP3aqhelwpqNdbgb5keCkIHsI7reg9X4Vfa67Q17ngwXdm54TKsaD+rMJ5IGSG
	 CgUWWJDMwPlWnsNuanNbkA13zr0DimaRrwd3hZcFirPMrznvZmKK4ActGNGP+6ZIVl
	 jtc0m9iRz+ebyDSEj2Snmz04lyNxP1yv0R8iiCM4YkObOP7FBFWy3iPwltL4OtBisp
	 WZ2VcEC7SlBQhTcV7rw4Uv8eYCdnMtBs7sSn75QwBdVMi0ExoeDEoiW1NpGvZ2rI9p
	 zBApvYzKSz4Mw==
Date: Wed, 12 Nov 2025 06:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <20251112125741.GB1319094-robh@kernel.org>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the cores.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
>  Documentation/staging/index.rst      |   1 +

Why is this in staging when none of the drivers are?

Rob
