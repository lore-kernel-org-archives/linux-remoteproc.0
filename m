Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA438D6A2
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964672; cv=none; b=kIpmWJ/WeDxg6mESO5OZvD/WWZtAuuGcQjN+VJCVbmCa36HjsqtGqdELxW9FQOdKAxG7MegpD1ly4qoILUSiY+Ca6Jg/P2hD+kcg5IVZ6+X2Mu26r/LAASq+jkDTbpVjFL/GT/GEns/QQQEt/pg2WHR7NmFDtWjs05+shNKY6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964672; c=relaxed/simple;
	bh=+GOblQzyAJodv9b6rNOw50K4n/xTVlzZw8d3VUVRDrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnoQwYMwmHsIcsdnqhujSIKMwYw7PUi3RYTycj9Q6cPSuHPnAbRWa6mw7eZ+vbutchbJalPYLu2N3/diQmxZCLXpNhMuoRDEibOF6mrXZOqNBUKsliU00oBA98iU7KlX2I7CfzBBIV/l2PeSlpKTqQ4rWugHyOgmawAJ3mZMDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSY7fo1O; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSY7fo1O"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so4527353a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776964670; x=1777569470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsUocZL2Bn6GCAa3hABSmeuNfrbPhRDBHVb9kanPFaA=;
        b=hSY7fo1OuMlHryfNMYfA167b1YFMb03SUlaMVL6909Bzlj5NCbwABrk/48JVfg41qD
         1wfMpgcRsmdN3vA3jc2g8IR4DXyEx3DKo7mglV/pHuXhhFIqXFvnyf607jjn8TwM4y6M
         9RVLmn8WafHdVx8o8cnJcO8DtgJ2NgwKIgh64wjyw/6kREbyX4dHHsDm009YqYqwq+9V
         JfNuCQQxdNNtg+/QMND6ElHpNravVJFCekKnjhH0lfNKRMBlyzWgbe9rf6T7Zm4bfpLh
         z+rd+/6+Qp7xc58713a7GlgtLGCL2ZhJNnUY9FIkyo6H1NzVF3NCa0c0j8qfYVzUj+JH
         ArdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964670; x=1777569470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsUocZL2Bn6GCAa3hABSmeuNfrbPhRDBHVb9kanPFaA=;
        b=B1wz4LqgIDzwvHvY8aHx1mZyPrKh1lkHvD4GYREnlSU+2N04tFi6hZWYOGOlLq1bLN
         cGG/osk6JSxo+S4RheLFot6bdz2guxVSw97iMcIKhnjXXHPBoG6wl28zXkKPM+0EZ5Ze
         c1vUZb9FJdb0xarvTxp0f+s+Rn+AuSHbEjpy+yXijLFXjLqUINqSGU9+E7sr8CMfst+y
         8CaoM5sVkJoFDa5x+cOyJTniMNBffikwQSqIOhbkuvp4u0KrQ650Tr8xdpYUutbP0t47
         AqkIsSCaCp2dG4ZoRdow3PYAAw6A//+jODpuegASx6b/x/VsVHI8GAU/003fYXSgIpQg
         N0zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W55a4bc3FCi92yukbmhmFJ15XxILwpFofuWqMSsuj/t6GkMJIjZc7aAzSOZhGbZoMS4yN5zh45ONBrUI6s54E@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWsUAt3KFSknxKpyjlr5GcYKGHE0RreU7FypCuT7/tMTaxxnd
	m/UNn/EdN2tf4Z27yyIDrCpb7r3dI1JtUu9zboUS8XgEQ06oBXWRsL/pmN2Xyu7SOOQ=
X-Gm-Gg: AeBDiesiQz6biYYKwFXqCUQD+MjGgWFzCuiX61d86P5Ex4OJFK+xKoyUGOvzvmpRjYw
	LS8pTxRTNE30q/MQqD5k97EHzTdxMgst2cOLXrcJ1nymfdTnqaQZJj9VRo8Gv4P8DcjxbobAx+H
	NxYjO/ZeqrRSmkM77dkmMXRajJR7BPmS+fhbwoi6xcUjWHciiOakvkhMu3Rp+0LWz26rOMaoQ+8
	QhQwfqeNoyYOIJUy5avylFUL0AfW19Y6TaKNww7FRg9LdnOsUoxlnTbca8arXBVABGt+Li6jB42
	2PDfKFIKlYDpYMnp71JpZiHwWBSLX/xsAIkLtFMaO+5VX4QyjkgzeYYBAiiEFdGY/rd8AGKbxhP
	LGtaeA4P1yjtP56YbA9PMomgE2zzlg3LF5Ma9cJZ4f59sS/u7RJDheBaHvJ09AmrOTiq2Oc0HqT
	H+KNdXKnGpn+/b8FQu38l1eAa+3KLlHstVLSiNHw==
X-Received: by 2002:a17:902:f78d:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2b5f9d888e8mr278593665ad.0.1776964669767;
        Thu, 23 Apr 2026 10:17:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:54c0:dbdd:6b84:4488])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c4fsm250035145ad.59.2026.04.23.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:17:49 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:17:46 -0600
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
Subject: Re: [PATCH v3 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <aepUOjXBOWK-0wt9@p14s>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>

On Wed, Apr 15, 2026 at 03:50:37PM +0800, Peng Fan (OSS) wrote:
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
>  drivers/remoteproc/imx_rproc.c                     | 98 +++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |  2 +
>  3 files changed, 101 insertions(+), 2 deletions(-)

Much better - I'll pick this up when 7.1-rc1 comes out.

Thanks,
Mathieu

> ---
> base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
> change-id: 20260311-imx943-rproc-2050e00b65f7
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
