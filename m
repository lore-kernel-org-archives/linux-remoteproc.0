Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5134EEE1
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324044; cv=none; b=RnwKXSvnSsJW+4qcnvTYvJv0EGdhuPKz+km2KeETl/1JZzTReZ6F2nQszldN1jRYP0wbBsFULrAGnefP9Et3nIusFxwXOzY8dUBC/MhvLcHSqsdXcHSmjCVDItbw07jNfjzHIsvYCiqudRvEPdZmDmzm0yykHtEsY8129zfTHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324044; c=relaxed/simple;
	bh=VKQO1dvhlSzjN1XUqKBcYefeEELarKqe4KTlZLk2ixM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWgPNOtd4RIdVrShaIkyVvFeRbmC3n2jzMQHWXzd7l/hw7iEqqzwztgTemwsXbcOMRb3XQv7C4D5Jv6521Bo/kqvvrfEMtilHwd7qeGi/lms7iNjZOC9W27ioqccU9L3bYxA0jWCruasNQ/czd+jYPdS3pt+s7QFiCiPnaJl0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYXA/U3N; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYXA/U3N"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0a95200e8so44620565ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768324039; x=1768928839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=nYXA/U3N1O+/VruhRXQQAm5C7Q9lV7a9MfyBvakZyGmwTNtWLiUnejcwsNy12A2v61
         q6lO10UGEBf3X1v0LBVHG0VJEywDI0FDJxByd/1kdOel6PEtFYW1m2yLviRC/wDVXa13
         E+dsd1Y5r3ss7fcqs4dgvGWwPtsD7lAPNb8ca51XTQ0R92hhkyB/zl1B5ps7USByvxHt
         eCYzYk9fYnPZCKbpgZjJm86xTes1UfYqD9RzPmLYJ/9GYDRgCnN4DsU0iwRy+e+/O6el
         NT3QO1tepaymcJtAW4aT95dCqovell0M7URiSZTrHAWCyKHAD0qvUpEl9h5Bry7U0DH/
         lTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768324039; x=1768928839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=DoAzJDLDtPjcbXZuGMzGtu0cDGl4RdkjMOC0uQHA4OW5QrbGYDo12wS2cdNRbGNC+y
         yqRQR1A3Y7/6+PZ41+1esMQVR9HTuqtLcLpvXSWUlYXfJ4tpPLBKW/UZzcj6y94ofLMZ
         aGousExl9rf5kWVRqjX7Hx361jvzkdAzgUNhtEh/fyeB9cc/1O9/LHCNxkPZfZLyledk
         K0bbX5a7hRSx0Guw1XrxinBoBaSG0Ckp19S2vSZSFx8tiQRTWNgEq9FdlY7ZTABrdXEU
         Mkt3wVhb9A4IrlDDkGeBzeyD6SjYyNJtXnBj+19svzi821T9ePDXom7S1FJW20EuGgNt
         Kjrw==
X-Forwarded-Encrypted: i=1; AJvYcCWVpuyTjvCVtAMUKJDmvtLPA2Js5Kq4pU9OEdnWUSdCeU26qbqoxmCwPN/s7+LKBwF1CHXDz5F/hjn+Tt5wFVwg@vger.kernel.org
X-Gm-Message-State: AOJu0YzevkpMDHVGeify+UMDGSzXd7ZjYZR/UnKcuX+itmVCaSNNkXFh
	D/EPozHjHRycX2FSrIit5p7RS/cCoGkJ2kMawV3eltF2aYMMH2SRpZM8olpsRho+fTA=
X-Gm-Gg: AY/fxX6pNusPhS0opiPWT6IFUyXnHR4FpYBOo2+lUtopVap+JZGjOgOHjXMoIBpMQn5
	oN8tMOCscaKkNZUA+txGOyh7Honfevw7YOJE4zGyg7AZTFHX3iEQ+Sa9sIKXe64Mddn/pgVdcwL
	DAVO/WdQ2ione916ojZauJHnMd064h9bXbBleDV+m2HzJQnekghhE7K3q4aKz0owalMLNA9Bsdq
	b+WOT2S0PyjnFHQyRDmhehFuZZpufWdnX+X5qWU93lfAurZeKLPHI5yuFey0elDCTyGtXhhnrOK
	FD6MT0rv4KjG6Z26aOCFHRHmbS44FEMoSfoamVXJHMdF4/HkGom6O8dM9BoaP0bC5ZyrhT6KG7s
	oqotYcdvnbyCbq9QxWhVlWUH2xS6EeVyCQZ8kymudcdIlXb+vZwBtNvtzj109JqVpEDaejYHeJC
	XWNSvnsr6PwF4kiw==
X-Google-Smtp-Source: AGHT+IFOvPJP9R1hw4cpVp6os/r5K7GEms65q/AlzRFH4grW4yqI7xvevFuJtgCcEOr5tWpPHLh0Mg==
X-Received: by 2002:a17:902:ce92:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a3ee4aad5amr188877205ad.32.1768324039181;
        Tue, 13 Jan 2026 09:07:19 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:82f2:906c:a8da:1fdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm208565395ad.95.2026.01.13.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:07:18 -0800 (PST)
Date: Tue, 13 Jan 2026 10:07:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/6] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aWZ7w5g7mYMDoffv@p14s>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>

On Fri, Jan 09, 2026 at 08:08:00PM +0800, Peng Fan (OSS) wrote:
> This patchset is pick up a previous patchset [1] with rebased on
> next-20251030, and some changes applied.
>  - Add runtime ops to separate cpu ops and lmm ops
>  - added more comments
>  - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().
> 
> No changes to the dt-binding patch, so R-b/A-b are kept.
> More info could be found in commit message of each patch and below.
> 
> [1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
> 
> In patch 3, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
>     Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> 
> Patchset was tested with below boot images when the patchset based on next-20251030:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
> 
> Also tested i.MX8MP/8ULP-EVK.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v6:
> Added R-b from Frank for patch 4
> Following Mathieu's suggestions for patch 4
>  - Renamed IMX_RPROC_FLAGS_SM_LMM_AVAIL to IMX_RPROC_FLAGS_SM_LMM_CTRL
>  - Added comment in imx_rproc_sm_lmm_start and add comment for
>    imx_rproc_sm_lmm_check, and update comment to use "M7"
>  - Following the suggested code snippets, update imx_rproc_sm_lmm_prepare
>    and imx_rproc_sm_lmm_check
>  - With above done, separate the CPU API support into a separate patch,
>    no other changes.
> 
> Changes in v5:
> - Add R-b from Daniel for patch 4
> - Patch 4, per Mathieu's comments:
>   Move imx_rproc_ops_sm_lmm and imx_rproc_ops_sm_cpu to bottom of the file.
>   Set IMX_RPROC_FLAGS_SM_LMM_AVAIL when scmi_imx_lmm_operation(shutdown)
>   pass or m7 is started before Linux.
> - Link to v4: https://lore.kernel.org/r/20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com
> 
> Changes in V4:
> - Rebased to 6.19-rc1 to resolve conflicts.
> - Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
> - Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t
> 
> Changes in v3:
> - Add R-b for patch 2,3,5
> - Patch 4:
>   Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
>   Add more comments in code
>   Simplify if check in imx_rproc_sm_lmm_prepare()
>   Update commit log
>   Use dev_err for failure path
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t
> 
> Changes in v2:
> - Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
> - Patch 3: New patch, introduce prepare ops
> - Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
>            drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
>            Add a bool for dcfg->lmid and info->lmid check.
>            Provide separate plat ops for lmm and cpu setup.
>            Move LM permission check to a separate function.
> - Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
> - Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com
> 
> ---
> Peng Fan (6):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
>       remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Add support for System Manager LMM API
>       remoteproc: imx_rproc: Add support for System Manager CPU API
>       remoteproc: imx_rproc: Add support for i.MX95
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  drivers/remoteproc/Kconfig                         |   2 +
>  drivers/remoteproc/imx_rproc.c                     | 249 +++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h                     |   4 +
>  4 files changed, 243 insertions(+), 13 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20260108-imx95-rproc-2026-1-8-04f759890742
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
