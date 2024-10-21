Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03947A73;
	Mon, 21 Oct 2024 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529685; cv=none; b=SfoSd8vhGOsdhM89gkl9/Zw/raZfFfh5/aqSN85qgaAyCyvirKTY9bQAiIGMNLo9gQlF5zfxxIuB5kPuq6oM0eZzeiuBjAg2vYGS/BNoN+Rs6Rz0+KC9pbiDDCofO1IXuvOL6WoQz979iibAZxErrSu15Z/NmMkiOcblcEiZS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529685; c=relaxed/simple;
	bh=xVLV19LdlMTEBFTYZcWLoFa2RJ2kafrvx0eUdZTpY6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S84tOM977unALE+YeT7RTPe9VobzNWuYuqRgm0N7D+c7/eH1UWELEZsHTtzQnhlP4EohWRS9GOvs5+sBpr9xDCawIBPz34KkTC49cR5KS4842uunoS1/haCi948K3sfh4FytsIrhdpnTi6c3W0BGmf4LUv32fl5yEE2nD451gIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OgJaCPHM; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OgJaCPHM"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LGsS1s015685;
	Mon, 21 Oct 2024 11:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729529668;
	bh=BkUiQQbb0Y/+KVsC+QJluVm1qSPbgAKIhXWGfYSCIF0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OgJaCPHM6sf5ryq0I2x45RORcQ1AKdvc0U+8TfYon+TW3SurtPoXAh299k00xJHie
	 I9IiEJtIYo+8D6DXRVEa2mSxD6UpHP8LDjji1imk/T5FEXgs3ynCmXCGPTTCJWdkU7
	 40/O2b+HwPJLSul4fVA/sqLJ6xbjcyBpFDOX9R4k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49LGsSqb008487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 11:54:28 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 11:54:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 11:54:28 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LGsRhU034368;
	Mon, 21 Oct 2024 11:54:28 -0500
Message-ID: <4954e8a6-06dc-49db-afdb-93260539649a@ti.com>
Date: Mon, 21 Oct 2024 11:54:27 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: k3-r5: Add compile testing support
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241016164141.93401-1-afd@ti.com>
 <20241016164141.93401-3-afd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241016164141.93401-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/16/24 11:41 AM, Andrew Davis wrote:
> This driver can be compile tested on non-K3 architectures as long
> as TI_SCI_PROTOCOL is not compiled as a module. Enable this here
> to improve this driver's build coverage.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   drivers/remoteproc/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0ac1c8a6e4581..83962a114dc9f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -355,7 +355,8 @@ config TI_K3_M4_REMOTEPROC
>   
>   config TI_K3_R5_REMOTEPROC
>   	tristate "TI K3 R5 remoteproc support"
> -	depends on ARCH_K3
> +	depends on ARCH_K3 || COMPILE_TEST

kernel test robot is giving some extra warning now around the lines:

memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);

This was already an issue and threw warnings even on ARM64 builds, but
now that we can compile test on other archs, all those will start
complaining too.

Fix is easy, just s/memset()/memset_io() here. I'll give that a test
run then send a patch.

Andrew

> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>   	depends on OMAP2PLUS_MBOX
>   	help
>   	  Say m here to support TI's R5F remote processor subsystems
