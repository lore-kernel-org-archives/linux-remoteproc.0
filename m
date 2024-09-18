Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D81BE853;
	Wed, 18 Sep 2024 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726670799; cv=none; b=JPb60I323/PLz8syIblyR9ftllBlYWJgWm3zy2oiZGYN+DtvNVrnKsHhkNT+x0ICmHUkqGEaKPRGnDgSE+H0UKnQRJfGyHhd3jmcTgEbGcLpa4VFxhfLJaKrpEF9x+drxFNbYY5f69XB3YLosWvRbLD2/zGocp0pTLTEtmQFpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726670799; c=relaxed/simple;
	bh=BM8hNkRIdH5oUzp/C0nNik0IY4RsXG+YF5a51+mTTyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=loDF4Mzd6MjiqKjdLSLIeNL+6KwWDumJy0JE+twZj0ylDLzA4C/Ly70X9RYY9NBjaD7DgodcZ0Xer7iekbZ0Vv0aRYat5SqgGek/Oo3oXEEngcDqoUYB9DE770x1Oztx8bCXELWOKzNEFAPDZu63ivkVRIArBgIAR1MzpMdxt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ek9if8Nt; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ek9if8Nt"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ICZctX017253;
	Wed, 18 Sep 2024 16:46:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ds0wtYkHarzU5Z0GpuaBvBbV3g5NZzHffS5yleTHHoQ=; b=Ek9if8NtFgnioPTi
	lUeIjqVVQwrHB5LrcoTOXITp5DzP0AM852YMxrLqWSI3iXnGemW8ZoBhqwPAPbWz
	ThlgQRA0JHR789Oqj/mMTTzF30fO3z5JAWnR37eZdImJJkqEcNaM7Bb07sb+qD6r
	HW9rJSpjBspcR6oAAKFn0zSTBNmqyE6HGqmMEHGStByRiMUVd3KM+Ua4suiLE6S4
	vOELQ1Av8TvtRzaj5nSFU8KtSJGSXCRzajM9qFd/K1xaLIn80RGeFjmkOcpusHOI
	I3rJiyTRRzac9Ll1tp8uosZAhZ4fkoMCwM+NOEzyq/dn7j+/18xDLIC4r97WorcY
	bjeKrg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41nnehq9gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 16:46:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 33D6340044;
	Wed, 18 Sep 2024 16:45:03 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 253FB2928B9;
	Wed, 18 Sep 2024 16:43:34 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Sep
 2024 16:43:33 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Sep
 2024 16:43:33 +0200
Message-ID: <fabec69a-3b3a-4068-8906-7996cf125c0b@foss.st.com>
Date: Wed, 18 Sep 2024 16:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Mathieu,

On 8/30/24 11:51, Arnaud Pouliquen wrote:
> Add support for releasing remote processor firmware through
> the Trusted Execution Environment (TEE) interface.
> 
> The tee_rproc_release_fw() function is called in the following cases:
> 
> - An error occurs in rproc_start() between the loading of the segments and
>   the start of the remote processor.
> - When rproc_release_fw is called on error or after stopping the remote
>   processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..32052dedc149 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -29,6 +29,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/rculist.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/iommu.h>
>  #include <linux/idr.h>
>  #include <linux/elf.h>
> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);

I'm requesting you expertise to fix an issue I'm facing during my test preparing
the V10.

My issue is that here, we can call the tee_rproc_release_fw() function, defined
in remoteproc_tee built as a remoteproc_tee.ko module.

I tried to use the IS_ENABLED and IS_REACHABLE macros in remoteproc_tee.h, but
without success:
- use IS_ENABLED() results in a link error: "undefined reference to
tee_rproc_release_fw."
- use IS_REACHABLE() returns false and remoteproc_core calls the inline
tee_rproc_release_fw function that just call WARN_ON(1).

To solve the issue, I can see three alternatives:

1) Modify Kconfig and remoteproc_tee.c to support only built-in.
2) Use symbol_get/symbol_put.
3) Define a new rproc_ops->release_fw operation that will be initialized to
tee_rproc_release_fw.

From my perspective, the solution 3 seems to be the cleanest way, as it also
removes the dependency between remoteproc_core.c and remoteproc_tee.c. But
regarding previous discussion/series version, it seems that it could not be your
preferred solution.

Please, could you indicate your preference so that I can directly implement the
best solution (or perhaps you have another alternative to propose)?

Thanks in advance!

Arnaud


> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto reset_table_ptr;
> +		goto release_fw;
>  	}
>  
>  	/* power up the remote processor */
> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	rproc->ops->stop(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
> -reset_table_ptr:
> +release_fw:
> +	if (rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
