Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188C1BDAB9;
	Mon, 14 Oct 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917782; cv=none; b=tDPhDVyFPAMSg9fCmtghgsVx6p4nFFF4cTc2LNkwIlcC1lpu+tcNYJGOadNHYJJcOZtkbHQ0X3D80ncQsVk3NkfqXTwQ5bNayiEyXpnJdWCOKufcHvcKwYHQ2qJUVDTUS1UVEnEEJhP2ZEGHGR3I08cWLhbD/oLbIXoiQF2isqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917782; c=relaxed/simple;
	bh=qXSXHG9ISioDZ/1MurEHMon8AgKFUmbmZuQE71q+k98=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gc+5AWqFhEFSlUzTrUzkcXgyTCr6jzZildo2BDRb35Gyowe0GmXs6haBe4p4Ed3neO3TmUfaviI8HekkCR0oSunhbxknwimR+RSzEIOW0tGoryOC+B3MsvJ0+nKW0v0rA4NwgdctiRXE0H7KuDBgioilqC86U9L7E2q6nX/Rn6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I5BFDxWj; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I5BFDxWj"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EEuC3I061916;
	Mon, 14 Oct 2024 09:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728917772;
	bh=MUZymZMVInDcCqBNJMdz6hHQpQPYAq6vzD5TylfxRUo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I5BFDxWjYrlw4MY7WCHNWPpopChbqa/HQ/EqTu35jskBEjZQEnREs3wef1jw6yQYL
	 Fn/+Hlw/v4JOhmDr+Z3wSwPJI77jfFH2PB+ZKhRYWEb5VuHaOq84j37iev0f3kY0my
	 B9A0Mc2fRe5eq8K5eN08TiiAlZusrk8+9XSVR3AU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EEuCSF013787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 09:56:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 09:56:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 09:56:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EEuBYk018323;
	Mon, 14 Oct 2024 09:56:11 -0500
Message-ID: <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
Date: Mon, 14 Oct 2024 09:56:11 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Martyn Welch
	<martyn.welch@collabora.com>,
        Hari Nagalla <hnagalla@ti.com>, Jassi Brar
	<jassisinghbrar@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241007132441.2732215-1-arnd@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241007132441.2732215-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/7/24 8:23 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The k3-m4 remoteproc driver was merged with incorrect dependencies.
> Despite multiple people trying to fix this, the version 6.12-rc2
> remains broken and causes a build failure with CONFIG_TI_SCI_PROTOCOL=m
> when the driver is built-in.
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
> 
> Fix the dependency again to make it work in all configurations.
> The 'select OMAP2PLUS_MBOX' no longer matches what the other drivers
> dependencies. The link failure can be avoided with a simple 'depends
> do, so turn that into the same 'depends' to ensure we get no circular
> on TI_SCI_PROTOCOL', but the extra COMPILE_TEST alternative is what
> we use elsehwere. On the other hand, building for OMAP2PLUS makes
> no sense since the hardware only exists on K3.
> 
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Fixes: ba0c0cb56f22 ("remoteproc: k3-m4: use the proper dependencies")
> Fixes: 54595f2807d2 ("mailbox, remoteproc: omap2+: fix compile testing")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/remoteproc/Kconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 955e4e38477e..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -341,9 +341,9 @@ config TI_K3_DSP_REMOTEPROC
>   
>   config TI_K3_M4_REMOTEPROC
>   	tristate "TI K3 M4 remoteproc support"
> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on ARCH_K3 || COMPILE_TEST
> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)

This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
dependencies, as often only one ARCH can be selected which prevents
compile testing drivers with various multiple architecture deps in
one compile test.

Normal dependencies, on the other hand, can simply be enabled if one
wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
cannot be enabled as it has a dependency up the chain that doesn't
allow selecting when not on a TI platform. We can fix that as I posted
here[0]. With that fix in, this line can be simply become:

depends on TI_SCI_PROTOCOL

Andrew

[0] https://lore.kernel.org/lkml/20241014144821.15094-1-afd@ti.com/

> +	depends on OMAP2PLUS_MBOX
>   	help
>   	  Say m here to support TI's M4 remote processor subsystems
>   	  on various TI K3 family of SoCs through the remote processor
