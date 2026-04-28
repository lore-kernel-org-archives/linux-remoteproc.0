Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C433B9DBA
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388764; cv=none; b=J/3IdOYD+8hzoFBnwh7KoJj7l/owgU1kxn44RQWIizZp+/eNi64L6zf0JIxtLXbH/PV1ocmXQRtXJT/wETaYPJI8CMd14Ghm6Z19uVR1Lgyt/0BQmx1cLRz2se+ON1ibNR9MrkKlNlsb9oJwG/47UQDttKFZhiirnOITWo8kMBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388764; c=relaxed/simple;
	bh=xoNuD8JS3btCKdjzs3bUeyqzNLPY3psjI8zo9aZsx9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK4/zkcXnHnf5avv9KiI5pNbDuCza8towS6z54t0yno/u0SiB7A0xDDi3IzXz3XxEwKVQSaDvIU7eGekkuQL2fOJKEJfC3nJwiBPaZzBVEnxZG0VSMnzn6P3VhCC4V5SRavj830KzGDkW7e0ZwUEI5ZjBsHJ4ToOntFx9ybv61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UN9SJxP5; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UN9SJxP5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so9713073a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777388762; x=1777993562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=UN9SJxP5HB3RKaF/JdRZv/vGGWoElexyzugCEsllyNF7jV4PhYjOUBlkMQpISAgIAX
         2IoAsemA3BY5tMKrd1tSR8X3nQF18eA1uoES6XpIJvEsUrYfFQ/4igETshOtuegeXjOd
         NLfTujghDZPmHuck7W1q0fEu42zYwGEPgbDodGskhMEUDBpiOOOQTZ0sv7883hLnORHj
         5gFlGdaTyS1lRbVhz9Lg9Nr6M9Jl5toAlBs62tG06EBtr2mZfqk7i7zLWUtZ26wCqkjR
         rf4i/w6A77eKjCCxLyC/dOhi6J1/ZnjH+xeFEOSpDr/5RJX+MzvoT29mS0p5U4M4Imex
         nogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388762; x=1777993562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=MXSDOCsFAP35amApcN03jW1VlvYxFClm80q71jr8w2fuI+5OITNMx8ASl94QWsF70h
         /KPcPlPj5+nKt0hw+IOMgpdbkVEGj58hInbink5i4WE5b6xH+WvlAK07sgON8XfETjGb
         OkooNIJ7whyBLIZXMQZfLFe+JOiy88D0a71UYUjRHLj+zf5H7D6yST6p4cp4RPZdjllN
         0jsAA9SvHRuxcDhLMk8gJjt3QAsU3sfPMv+HgojNEkRfxqA+hNmaZjUzt7qKokxOV2zq
         blL2zcmmvuIuwmyfmoTioNFsv6bw5ucPjQfo9fdIrNGEOeSGzm96A+MgWks9NvNAKAng
         w5Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+UPG4W0LqGqitPox28j6lE9LORiGAcSOYMnwz0ZUMNqfFDHPDQOQes1wgMLksnOpgkQ7hk30vxywZY49joqQzp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uRXV3gX1J6mYIQocs+MSrSyNquSdLjAuvDujsr3VK+u8D0Nk
	JsJNpOLkD7dofLau9TBAlBfminmDlq+B8ClseLuXge3MNTaHSlJMJU4kZ93/o5LY0Dg=
X-Gm-Gg: AeBDieuX+pPJzIBK1FBWRF5JnIBo8hL9HrZTtrEJgs7glmlWH8hFdJIAX7GqpzJr3Zn
	sqTFKckBT+4giOc8rWmzkw9/nzVKAA8hloMaQM9JDfwypQFj7mUL3WRvnfjqiBTb3wnSmV8NYQV
	cNDYU4RQKtxF0wHhkiWR3WhpLWbJk55+Fz7X0mfo7K0N3tkabLPyiWU6g555Fa+nvf39j2ywKtc
	9qUuZ3PVWh6z7MGEUF9yRCiUaKDy9nawpMWW+X3/3HwzNW5YBPWgCC/ut/xAaPqR59Ka41sBP9v
	6pvcLnNFhHQb+6mP7F15vXW4u6HatzUZtS5aFfUuhr2+OwRmbAJYiN24e/+HgP7q5vGrhk1Q78y
	GT6mYb8YuBHcvXmXxBuybdhboljS3jdW9/cG0wfKsiKIcnEuKaEZ/QZSEfY/66Mb2zeKKq8hqjI
	4Of14MV3CHEgrJCQp/MEctz16MV0MhMUZ5OBeeSA==
X-Received: by 2002:a17:90b:5291:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-36492046369mr3453884a91.23.1777388761787;
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a4ee:17e1:59a1:f1e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa7b9d2sm29165775ad.11.2026.04.28.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:05:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <afDM1Vhw77l3zpCr@p14s>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>

On Mon, Apr 27, 2026 at 10:41:23AM +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc support for the i.MX94 family, including the
> CM70, CM71, and CM33S cores, and derive the hardware reset vector for
> Cortex‑M processors whose ELF entry point does not directly correspond to
> the actual reset address.
> 
> Background:
> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> table. While ELF images embed the entry point (e_entry), this value is
> not always aligned to the hardware reset address. On platforms such as
> i.MX94 CM33S, masking is required to compute the correct reset vector
> address before programming the SoC reset registers.
> 
> Similarly, on i.MX95, the existing implementation always programs a reset
> vector of 0x0, which only works when executing entirely from TCM. When
> firmware is loaded into DDR, the driver must pass the correct reset vector
> to the SM CPU/LMM interfaces.
> 
> Summary of patches:
> [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> Adds a new DT property allowing SoCs to specify a mask for deriving the
> hardware reset vector from the ELF entry point.
> 
> [2]remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
> Ensures the correct reset vector is passed to SM APIs by introducing a
> helper (imx_rproc_sm_get_reset_vector()) that applies the reset‑vector
> mask.
> 
> [3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> Adds address translation tables and configuration data for CM70, CM71,
> and CM33S, enabling full remoteproc operation on i.MX94.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Daniel raised the M33S secure region was not included, but since I not
>   have image to test secure region, so drop the Secure alias region for
>   all. Updated DDR region. R-b kept since this is a minor change.
> - Add R-b for patch 2
> - Link to v3: https://lore.kernel.org/r/20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com
>

I have applied this set.
 
> Changes in v3:
> - Patch 2: 
>   Drop R-b because of changes in V3
> 
>   Following suggestion from Mathieu that apply reset vector in
>   scmi_imx_[cpu,lmm]_reset_vector_set(), not change the meaning of
>   rproc->bootaddr, add helper imx_rproc_sm_get_reset_vector() to get reset
>   vector and use the hlper in scmi_imx_[cpu,lmm]_reset_vector_set().
> 
>   Add reset-vector-mask for i.MX95 CM7 to avoid breaking i.MX95 CM7
>   boot.
> 
> - Link to v2: https://lore.kernel.org/r/20260327-imx943-rproc-v2-0-a547a3588730@nxp.com
> 
> Changes in v2:
> - Drop fsl,reset-vector-mask by using fixed value in driver for per device
> - Add R-b for i.MX94 dt-binding
> - Update commit log to include dev addr and sys addr
> - Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com
> 
> ---
> Peng Fan (3):
>       dt-bindings: remoteproc: imx-rproc: Support i.MX94
>       remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
>       remoteproc: imx_rproc: Add support for i.MX94
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
>  drivers/remoteproc/imx_rproc.c                     | 92 +++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |  2 +
>  3 files changed, 95 insertions(+), 2 deletions(-)
> ---
> base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
> change-id: 20260311-imx943-rproc-2050e00b65f7
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
