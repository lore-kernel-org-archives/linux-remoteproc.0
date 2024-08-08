Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935418D651;
	Thu,  8 Aug 2024 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723117029; cv=none; b=gBnqKYImpl3YR5uS84Ttaw307dyD6HcX5ORi6QTpMaPU9WPgCHaGpXHo8hr0Tg3N++5LOb8j6PRC0pk+25RaJ4h9lj9zgcjRBUhpkB8ISMheZRt0+/i97/yEATSYVaJ6jzZC2tSoiqtTOFb1VAF9E47DkDaR+qfBaQ+7KWeuDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723117029; c=relaxed/simple;
	bh=bO5swzgkf7BckfI2iGviGyssNIRJ3wpEQFJjpxjBahQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ETcHwBWJWoDCQs8ObEDTP4GvqLCLZWOZzfYyCPXDh1Y5LNjh82OyYmAyJ4AUwNxFEbQ73PhnP1eUK1a3IWDxJieuuieqJJn04Ng3YBchL2/klmO5T+Yeun7LWVgpIEVcitlxULEJ5L9n4rQzi/REvlDRfcubCOs8UHrB5B5W8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kxbvQtag; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kxbvQtag"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478Bb3dQ127276;
	Thu, 8 Aug 2024 06:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723117023;
	bh=geRGxm1lVEOqMNAkF5Fs7S5VI6oFCb+FwYpG/B7OhR4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kxbvQtagwoOjh8BAAMkw1gWhdmxPWajkDybHW0/bR9gq1n8zHfDmf6TsxtaIHXu6m
	 JO1s6P2mJXDbGKwYMD4AG7U5AmHlOGis0pG2SQxYMUKD2aM0KacxX9O//gcAigX3nG
	 B7WRhLhLVf2GWec3TVBIvVoTEr9OIf84rfBJS66s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478Bb3XQ077835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 06:37:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 06:37:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 06:37:03 -0500
Received: from [10.250.38.65] ([10.250.38.65])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478Bb1mq127226;
	Thu, 8 Aug 2024 06:37:02 -0500
Message-ID: <86b3466d-c1e7-fe47-8f0f-af7dcb011149@ti.com>
Date: Thu, 8 Aug 2024 06:37:01 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240729164527.340590-1-afd@ti.com>
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20240729164527.340590-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 7/29/24 11:45, Andrew Davis wrote:
> Module aliases are used by userspace to identify the correct module to
> load for a detected hardware. The currently supported RPMSG device IDs for
> this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
> 
> Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
> supported IDs. And while here, to keep backwards compatibility we also add
> the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
> 
> This has the side benefit of adding support for some legacy firmware
> which still uses the original "rpmsg_chrdev" ID. This was the ID used for
> this driver before it was upstreamed (as reflected by the module alias).
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
Acked/Tested-by: Hari Nagalla <hnagalla@ti.com>
> ---
>   drivers/rpmsg/rpmsg_char.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d26863..96fcdd2d7093c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>   
>   static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>   	{ .name	= "rpmsg-raw" },
> +	{ .name	= "rpmsg_chrdev" },
>   	{ },
>   };
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);
>   
>   static struct rpmsg_driver rpmsg_chrdev_driver = {
>   	.probe = rpmsg_chrdev_probe,
> @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
>   }
>   module_exit(rpmsg_chrdev_exit);
>   
> -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>   MODULE_DESCRIPTION("RPMSG device interface");
>   MODULE_LICENSE("GPL v2");

