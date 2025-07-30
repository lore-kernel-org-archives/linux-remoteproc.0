Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34463433A5
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jul 2025 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753888052; cv=none; b=BoeKvjSWHwScczT6TmsXSPrH3Lagbron6HQpFyo0o0CLK/3yo+MR7JxqWQ1vReZt2k/CBNJYQiModHT0Z6CDBZs8LZmczKAPF6dUeOsh33rKrS03tDNTCD9zp0lP4WpDRpjq5W9/dXbwNTkvDnvaSoBf5X7HPSbDjuP1cx7LP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753888052; c=relaxed/simple;
	bh=S2T1WxPA5dM4lrAM/9y42kWN4a3zLOoUtRlThk8KE6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjnbPRXDVXBOPzaAherfCXAeGjK9+fEv1aligVr4+2Oal1ep1khcyQ1QwncrUWMkwLjz2e7NO93gY9f2pb1GYdJh+nZ9C1vSjUtVCNZZUIQmGXYix3LuPpOCXnDy8kt6kr1DLs513b3sUmzVMrWfKzPvoTQSwkcj1Mc89pftDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaufiJop; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaufiJop"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso733496b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jul 2025 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753888049; x=1754492849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6zbDF6DuNywreDfjORRT1cKAmeYmyOF35f+RgRaR5Jw=;
        b=CaufiJopECyIj/I7d3UKCvu23y/K4cPMEzQG+R3J1wLtpBDc29x9LeNqvIKfur9Yu2
         ToHwU4WCkr+koZIF9yStYcw7yAIRKTiX5qlhI/3iaoCuJdr3SnBcbpPg20fIY9j7a4t9
         iNwATRTNZiWx5EAQwVHU8n4AYX2s9Jv3l/aDp1cv89e22OHQKCI3HizrB9nKl4E8ddjU
         aGAwnEPKJr6WrMxQc8oZj7lqqyoqvwNVy+WYdZ9qK3CPXC5JPFsIP8l1KC57gjlnRW01
         TDkEivY+ZaDaxq/GJoq9OiyPuY1Q03WsMmokITMgxI+my/WZ93hppdhCz77X1dt6JEW5
         YK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888049; x=1754492849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zbDF6DuNywreDfjORRT1cKAmeYmyOF35f+RgRaR5Jw=;
        b=GQGJwGumlanuQ7QmzaFJdmPDoGNHdzHh2P+mbc/wc8fZFjOinRifmlxBG29eGGzAvv
         7f5W1ffAcqnjtoYALhhsfWUs3hd8gPYswX1QSLxyuM6ZuJGpHs1eTOIo3C5vfdbCwSiy
         vccFOUgs4LhqkcbmGitcJ7YJdWwPEioQ7oNXHqUQw2liM82CxPFbRgJ7QOwgCyn3/Lvd
         3qeMdN8m7p2sdNRZvUsZPtiaB0qnBARaNOI2378kJyuVd9PdGLKCISBnoxPjPYzfNE8t
         IKySmPCEw8+mIdzc8HhXmPk7mnGxtrdKnxqHib8TIbEvoJSn2kG1ZnShnFuQ6ywP8NfF
         Q4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiZZ2i6MFvJY9w+xYnSi0KI9MfWi6lxRejVjtlUttjjyd132gvr4YAPDlN+59GpfCL0BgfnItqpqoVpH5AztSM@vger.kernel.org
X-Gm-Message-State: AOJu0YxwFLuCe3lhIsOq1QzKBhWkBBZNqgcKjHECwd4NZDsWLs+39J05
	9UI3FspF+QZRjKqxQl9x8nlYhe3wzPpTZ42/6vqktOilHWUmzby5TlTBs+VptpTwcnc=
X-Gm-Gg: ASbGnctEKMz4fXSAoCgDnA4lAFbfcpN6QBBKkRm2xE346QwzMWDSmPKMcHSyythNlGl
	AE8IvF0u8x25DxSi1GgCyb9B8qAovwwYn258wmeQQMqz1WOlq1XyE1WCHFzIQt28QiOzdXh991N
	unM9kI470YyE+PMZXPPnk9J07aECxRQQOH+PcD5QB1bJTEPgV3tcf4lCC8Uy/J6UvqNoCrGN5HR
	PYXMorQQum88Komz9GpKe1jUIbOmnppceOKgFec4kVuPDLPfxyWQ/cYK4NbuIM+92KVmdAnmDiT
	lv8gxzSOtfOIyRDlwWjZVn8ZaNARW2zOvCQVA27Ja421bVB9LaXlJe938HtvI7pJ3I0EfMKs64Y
	fOcTc52gzQ7hWEVZgg7UZ0mN8Nje5CUf/rlP4
X-Google-Smtp-Source: AGHT+IFaZ9+p55hN5f6LxwvTNGvq2uEnkVbWsMgb6AANE/sV3IXqIf2qyYyxe/SLSbbyK1EkPLnaaw==
X-Received: by 2002:a05:6a00:4b0c:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-76ab092312amr5779637b3a.7.1753888049439;
        Wed, 30 Jul 2025 08:07:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:19cc:e53e:637f:aa72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408cf75dfsm10232542b3a.50.2025.07.30.08.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 08:07:28 -0700 (PDT)
Date: Wed, 30 Jul 2025 09:07:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	--cc=Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Message-ID: <aIo1LsFeKqtPoCDm@p14s>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-4-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729023125.9036-4-huayu.zong@mediatek.com>

Hi,

On Tue, Jul 29, 2025 at 10:31:13AM +0800, Huayu Zong wrote:
> Add SCP support for mt8189.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h | 11 ++++++++++
>  drivers/remoteproc/mtk_scp.c    | 37 ++++++++++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index fd5c539ab2ac..fb2131e0ed07 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -35,6 +35,11 @@
>  #define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
>  #define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
>  
> +#define MT8189_SCP2APMCU_IPC_CLR	0x30010
> +#define MT8189_SCP2SPM_IPC_CLR		0x30018
> +#define MT8189_SCP_SECURE_DOMAIN	0xA080
> +#define MT8189_SCP_DOMAIN_VAL		0x3303003
> +
>  #define MT8192_L2TCM_SRAM_PD_0		0x10C0
>  #define MT8192_L2TCM_SRAM_PD_1		0x10C4
>  #define MT8192_L2TCM_SRAM_PD_2		0x10C8
> @@ -112,6 +117,12 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +	u32 scp_to_host_ipc_set_reg;
> +	u32 scp_to_host_ipc_clr_reg;
> +	u32 scp_to_spm_ipc_clr_reg;
> +
> +	u32 scp_secure_domain_reg;
> +	u32 scp_domain_value;
>  
>  	size_t ipi_buf_offset;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..956793fc6901 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -225,7 +225,8 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  {
>  	u32 scp_to_host;
>  
> -	scp_to_host = readl(scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_SET);
> +	scp_to_host = readl(scp->cluster->reg_base +
> +			    scp->data->scp_to_host_ipc_set_reg);

As far as I can tell, this is the same for both mt8189 and mt8192 - it should
not be needed.

>  
>  	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
>  		scp_ipi_handler(scp);
> @@ -235,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  		 * MT8192_SCP2APMCU_IPC.
>  		 */
>  		writel(MT8192_SCP_IPC_INT_BIT,
> -		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
>  	} else {
>  		scp_wdt_handler(scp, scp_to_host);
>  		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
> @@ -559,8 +560,10 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
>  
>  static int mt8192_scp_before_load(struct mtk_scp *scp)
>  {
> +	u32 scp2spm_ipc_clr = scp->data->scp_to_spm_ipc_clr_reg;
> +
>  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> -	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
> +	writel(0xff, scp->cluster->reg_base + scp2spm_ipc_clr);
>  
>  	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
>  
> @@ -574,6 +577,11 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* set the domain of master in SCP */
> +	if (scp->data->scp_secure_domain_reg)
> +		writel(scp->data->scp_domain_value,
> +		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
> +
>  	return 0;
>  }
>  
> @@ -1464,6 +1472,24 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
>  	.scp_sizes = &mt8188_scp_c1_sizes,
>  };
>  
> +static const struct mtk_scp_of_data mt8189_of_data = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8192_scp_before_load,
> +	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_reset_assert = mt8192_scp_reset_assert,
> +	.scp_reset_deassert = mt8192_scp_reset_deassert,
> +	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
> +	.scp_to_host_ipc_clr_reg = MT8189_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8189_SCP2SPM_IPC_CLR,
> +	.scp_secure_domain_reg = MT8189_SCP_SECURE_DOMAIN,
> +	.scp_domain_value = MT8189_SCP_DOMAIN_VAL,
> +	.scp_sizes = &default_scp_sizes,
> +};
> +
>  static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_clk_get = mt8192_scp_clk_get,
>  	.scp_before_load = mt8192_scp_before_load,
> @@ -1475,6 +1501,10 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  	.scp_sizes = &default_scp_sizes,
> +	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
> +	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
> +	.scp_sizes = &default_scp_sizes,

You are introducing a duplicate .scp_sizes

Thanks,
Mathieu

>  };
>  
>  static const struct mtk_scp_of_data mt8195_of_data = {
> @@ -1520,6 +1550,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
>  	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
>  	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
> +	{ .compatible = "mediatek,mt8189-scp", .data = &mt8189_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
>  	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
> -- 
> 2.45.2
> 
