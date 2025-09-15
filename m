Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D5279DA6
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Sep 2025 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953644; cv=none; b=Ya7IxvBWQAuhQ46rO2hfRtecmbL/j+LENdPg/k0LJ0Kgrr9Bdwg1TX2Z6RBMfei6Z6JiqRcsOqqXK8yuKK2Y53UWgxkEPIKNozZF/Yp5iFaSCI5C1RjrDcXAJ2dyDDKEYl2CIIER9W5LoHjjBVheS9SUQUhH3wF/uF+fs4+/Z84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953644; c=relaxed/simple;
	bh=0VlPIbvVpTDmLyoSfoRRRH9s5pOp0mu5ypKCH+mS90U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnncRr1bpJKXDhOETBGOdz9dAUDWBXCdVXG8dvsmnnsd9a/QO8J4JSCaLSW5ykUesMxFOZ6OCD0yBKOStqP4NTpl0dTIsRG40seOHeD0seEmRd+UJdD2hd6tInn9zugWSV3wPQp9ycu6hehAQOsB7mGmQ6DTtNfydNRAjg9D//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSqXKx1V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSqXKx1V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-263b1cf4d99so11601855ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953641; x=1758558441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=vSqXKx1VHSHz+0QBCpVWHdLGieKtqFWF7jTW2OAivUPCEH31tREfQLOZFDc3EBoDXR
         nl7NZmm8zGYaZEGRBUofCnLlvQ5KUAAyamJA78JYgKDHlR8QayopY9XgU5NTMRHjJUks
         AERDIP1ySdy4MzQTWyo2GhFDyoTYvvoSUrZR/dCTzB7iDGaFipYyY/JEoou1BGuMgbDA
         DgLah2pGuyjLrF2xB270C0U1aMMKmFy23W7p5PBzZyH64k9/xM02KolABQ4Gm5a7knxw
         7fd37nBwBVVnRG56uUJG9js4AbyndNur5RAfh5MlITcyCxXHnutsa9rBLAdhJP7223AL
         ulTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953641; x=1758558441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=uYQfsGyexqUqkFosJ7yM9ybFIChSb5IOsJ0AS8Vs86m2/niHGUAyr1CWL6G3GKYHh8
         /y0WetlSTcHRBxQYvRVFBX86DNzijHEK4p8bOy42I5yuX8r2SXIH4a0w3VjgHAXOEbbU
         ZIVHpNF844Sm32B4O4nfM1LRmgkPz7yCDtquw9eBYu6UzHvjy+vmJ3vMKRpQ7GBC4Pge
         kzKm7X8UNsPTiLkewjOYEQ/uyhCKJrNHnxPhZbeY+FlWkXSKq/iKYtJRB5qqcC3BKrdC
         SUV9baR/M3BGLz4b1X43+XaB+2yzYOkiL3NQPZ7T0ZiH5wytFcPyuE2y8Y9ZzAkdbiEe
         oqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN4VxAALq7QTPhzQDroNASvF/uyBZg86PzNKablqj1oOKnmZJH/7tmE/a2n4fC/ck/FzSDn6KWd6V3SumEfk9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4AJnwla3K3CTXNhhG8CzT/av/aOKuFEMcs67BplwLDiy9kl5
	9pIZNELyiwnzb6FGMFQ28rMePL7WEcTQeuOuyLAlh2eNGrdxaCqfeKRXxcsOSENAY1k=
X-Gm-Gg: ASbGncvP1THIp3b3VMBivsgfqdQq7JmhLOI0c+/rMdQED702kdfKHHZRHiuHzJp+uCz
	bRDa9FJzuSodDfDZ6ZvHLPpAvDK0k5B83HqSZK4FDQuuJGmMSSCC/L9GTWCz40/8FJnXBkB9SYR
	KJ5bb4rZfXP5CVUx2Tgs7wPuhYjjiQGJF4lKSWfTQkpx7mf/ha/VRTfIHleXZMCOcG9PqvR4kLt
	9EJ4Nl0kzimnAMl5dsDrhpcL/MA31BEokDB1UFAtdKNJk5xem/Um/1Zdii9i5wOl09E3uL6KOps
	WO30cA5U+0jZTrzuFhHuhK06leOwDjvGY5Iks7FvlNHA2/EglXXplQ74IxYzo9wjf0tCNJBCaAZ
	hUeQ3RAc+lPtihCSf7gpfVZbGdGrFEnsAsocWm42QZQpAWuT6v8FABl55ltDg7Hn12CAEAB3Yq4
	VKOnDJNNqazrepIY3STnUgujsedrpN30aRWw==
X-Google-Smtp-Source: AGHT+IH31zRCUDSkqS9JLKhdPK0Ywp1tQqr2PiZwav0DNP7t0zDxlTNym5N+G+H44epmJz9G3i3bdg==
X-Received: by 2002:a17:903:41c1:b0:262:3e45:4c88 with SMTP id d9443c01a7336-2623e454f01mr114037935ad.18.1757953641028;
        Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:67c:a85d:f066:9008])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267a1d2eccdsm22392055ad.97.2025.09.15.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:27:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] remoteproc: imx_proc: Simplify driver by removing
 the switch-case
Message-ID: <aMg-Zg6juddLZwfO@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>

On Wed, Sep 10, 2025 at 03:11:44PM +0800, Peng Fan wrote:
> This patchset serves as a preparing patchset for i.MX95 support.
> 
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
> 
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
> 
> Thanks to Daniel and Frank for the help.
> 
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops, i.MX8QM for SCU-API ops.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Simplify the if/else in patch 6 per Frank and Mathieu
> - Add R-b from Daniel and Frank.
> - Link to v1: https://lore.kernel.org/r/20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
>       remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
>       remoteproc: imx_rproc: Clean up after ops introduction
> 
>  drivers/remoteproc/imx_rproc.c | 449 +++++++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h |   7 +
>  2 files changed, 265 insertions(+), 191 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
> change-id: 20250908-imx-rproc-cleanup-6f3b546b9fdf
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
