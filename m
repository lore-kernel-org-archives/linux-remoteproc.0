Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1841FECCD;
	Tue, 17 Dec 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451240; cv=none; b=CQyYcVHBAps2bMN+zzOZ5nRHlZUgGw/M6oOSd1CvhbZ1uIzNd6nKcFKqhMloxurfEBKa6RV9oqcqPCv2x2SlToAUlnf7BUQLIX714k21ElfYUm76Q8fBPpcyAZOuXhp2m9i8un1+8aahhb5Rg6yLUiJ1IuWsfMG8P3gatuWRh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451240; c=relaxed/simple;
	bh=5PQZtM/onZDqugqlBSkcI4wLyuMnZ938QwoR5qNlk80=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bM4UngNkLbMZES94MGhgBDtmDtBLtcJssBqNBabQ3tvcfesoMdMcpI5QQLlyn1a8Icu5zOjvikh3+8cxXIf0oiInzRNESmKEHoM0RaMeQ2vuDMQleYTCVwrV/RPJ7rXqmJ8WkWLKKKnCZXRZxH17LYYJaay2cHjgrFucTXGmdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Xn7r34tk; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xn7r34tk"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BHG0Ns8119787;
	Tue, 17 Dec 2024 10:00:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734451223;
	bh=YXx0EnD5O13mSB6W5vBFxR2d1CpX/jsC6fmG7kti750=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xn7r34tkMj7goKSkowE7RCDVSC2nZSXgeNWaOIZ0W1tGNNgZMbi142phfrXoWxW+F
	 JPJ/TBgDIZZ2cwXb+Yor1EGkRVNMhmbBwkwCh9/sGVlrm/DT+MeKpZdsDc3L5rKya8
	 wJqTR7csxt5DHb5QMw62wE6rZF0Lz4rUBpKf3rDU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHG0NO0106227;
	Tue, 17 Dec 2024 10:00:23 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 10:00:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 10:00:23 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHG0Me1072550;
	Tue, 17 Dec 2024 10:00:22 -0600
Message-ID: <85dc5e05-5d54-4d0f-a7e2-24134a5392f5@ti.com>
Date: Tue, 17 Dec 2024 10:00:22 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] remoteproc: k3-r5: Add devm action to release tsp
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204111130.2218497-1-b-padhi@ti.com>
 <20241204111130.2218497-4-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241204111130.2218497-4-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/4/24 5:11 AM, Beleswar Padhi wrote:
> Use a device lifecycle managed action to release tsp ti_sci_proc handle.
> This helps prevent mistakes like releasing out of order in cleanup
> functions and forgetting to release on error paths.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 0753a5c35c7e..2966cb210403 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1513,6 +1513,13 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>   	return 0;
>   }
>   
> +static void k3_r5_release_tsp(void *data)
> +{
> +	struct ti_sci_proc *tsp = data;
> +
> +	ti_sci_proc_release(tsp);
> +}
> +
>   static int k3_r5_core_of_init(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1606,6 +1613,10 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> +	ret = devm_add_action_or_reset(dev, k3_r5_release_tsp, core->tsp);
> +	if (ret)
> +		goto err;
> +
>   	platform_set_drvdata(pdev, core);
>   	devres_close_group(dev, k3_r5_core_of_init);
>   
> @@ -1622,13 +1633,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>    */
>   static void k3_r5_core_of_exit(struct platform_device *pdev)
>   {
> -	struct k3_r5_core *core = platform_get_drvdata(pdev);
>   	struct device *dev = &pdev->dev;
> -	int ret;
> -
> -	ret = ti_sci_proc_release(core->tsp);
> -	if (ret)
> -		dev_err(dev, "failed to release proc, ret = %d\n", ret);
>   

One thing to remember is devm unrolling happens after remove(). So
here you are changing the order things happen. ti_sci_proc_release()
now will get called after the below functions. This most likely
isn't wrong, but to make review easier it helps to start from the
last called function in remove() and work backwards so nothing
is reordered.

Andrew

>   	platform_set_drvdata(pdev, NULL);
>   	devres_release_group(dev, k3_r5_core_of_init);
