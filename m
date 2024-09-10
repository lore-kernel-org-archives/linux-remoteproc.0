Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE903194132;
	Tue, 10 Sep 2024 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981197; cv=none; b=iyruc3v79N2DgrXSLU1gU8nqE2BJiGMXD64cF/L+4nzF8YznNKb8RNPg/Uqg3cIgX8+H61mCReDhf9l4fFE/tCTLSz5pKgKPXT4/DWiU8BE8Gfhwmih4skSMu2NiyxbSJv2Fe2oPzaYmMFH1CiDpKmK7Wmbh9xZ1B0TUMalOa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981197; c=relaxed/simple;
	bh=ny+s4snXEGzRDSQDdkFxNUtev9o7FcK3Q/Bd7myQTIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qgFT9xaHF8jbic35FHpUayqBEw+9GlYHKf4/4N6LoCBFz02Yug5EcWiNud+3obov/M8VF6e4alyqLSanwAs1ioZLKblCXIB2ky7rNhOLk09D+Z9756fvXQ4SjuQkGhL4Mn5g2u9cStIpmA6lIy5jYIdwi1TVUWGI9CG7dWbitBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MGgSn72i; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MGgSn72i"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48AFD6JR124718;
	Tue, 10 Sep 2024 10:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725981186;
	bh=/YNxsv6W/QuqlIj1qdNV87SeaqDDXOyz+4D13V8/c4I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MGgSn72iCzCUBZNU1yCAYeiS402qJOb4X/3r8n30t8diudcC66rGnrgIYa/PO+6Gt
	 Jo31RpHyUUS54z+ZlVIDSnPRpgqHclxzxVUPPv8/yoZuDXJlPPK5WCXaCH5I8DVSVZ
	 wEE7lbe2wgoEFW+EeJg5xp7JKJqslgL82hOKC3os=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48AFD6HL065986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Sep 2024 10:13:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Sep 2024 10:13:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Sep 2024 10:13:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48AFD5PY072398;
	Tue, 10 Sep 2024 10:13:05 -0500
Message-ID: <0465fcaf-f63e-4846-875d-2ed855c861e7@ti.com>
Date: Tue, 10 Sep 2024 10:13:05 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox, remoteproc: omap2+: fix compile testing
To: Arnd Bergmann <arnd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>,
        Martyn Welch
	<martyn.welch@collabora.com>
CC: Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20240909203825.1666947-1-arnd@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240909203825.1666947-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 9/9/24 3:38 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting CONFIG_OMAP2PLUS_MBOX while compile testing
> causes a build failure:
> 
> WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>    Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
>    Selected by [m]:
>    - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])
> 
> Using 'select' to force-enable another subsystem is generally
> a mistake and causes problems such as this one, so change the
> three drivers that link against this driver to use 'depends on'
> instead, and ensure the driver itself can be compile tested
> regardless of the platform.
> 
> When compile-testing without CONFIG_TI_SCI_PROTOCOL=m, there
> is a chance for a link failure, so add a careful dependency
> on that.
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
> 
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/mailbox/Kconfig        |  2 +-
>   drivers/mailbox/omap-mailbox.c |  2 +-
>   drivers/remoteproc/Kconfig     | 10 ++++------
>   3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 4eed97295927..ecaf78beb934 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -73,7 +73,7 @@ config ARMADA_37XX_RWTM_MBOX
>   
>   config OMAP2PLUS_MBOX
>   	tristate "OMAP2+ Mailbox framework support"
> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> +	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
>   	help
>   	  Mailbox implementation for OMAP family chips with hardware for
>   	  interprocessor communication involving DSP, IVA1.0 and IVA2 in
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
> index 7a87424657a1..6797770474a5 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -603,7 +603,7 @@ static struct platform_driver omap_mbox_driver = {
>   	.driver	= {
>   		.name = "omap-mailbox",
>   		.pm = &omap_mbox_pm_ops,
> -		.of_match_table = of_match_ptr(omap_mailbox_of_match),
> +		.of_match_table = omap_mailbox_of_match,

We could have done this in its own series. Someday we need to
check everywhere for of_match being unconditionally defined but
still using of_match_ptr(). Coccinelle might help here..

Anyway, LGTM

Reviewed-by: Andrew Davis <afd@ti.com>

>   	},
>   };
>   module_platform_driver(omap_mbox_driver);
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -330,8 +330,7 @@ config STM32_RPROC
>   config TI_K3_DSP_REMOTEPROC
>   	tristate "TI K3 DSP remoteproc support"
>   	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
>   	help
>   	  Say m here to support TI's C66x and C71x DSP remote processor
>   	  subsystems on various TI K3 family of SoCs through the remote
> @@ -343,8 +342,8 @@ config TI_K3_DSP_REMOTEPROC
>   config TI_K3_M4_REMOTEPROC
>   	tristate "TI K3 M4 remoteproc support"
>   	depends on ARCH_K3 || COMPILE_TEST
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> +	depends on OMAP2PLUS_MBOX
>   	help
>   	  Say m here to support TI's M4 remote processor subsystems
>   	  on various TI K3 family of SoCs through the remote processor
> @@ -356,8 +355,7 @@ config TI_K3_M4_REMOTEPROC
>   config TI_K3_R5_REMOTEPROC
>   	tristate "TI K3 R5 remoteproc support"
>   	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
>   	help
>   	  Say m here to support TI's R5F remote processor subsystems
>   	  on various TI K3 family of SoCs through the remote processor
