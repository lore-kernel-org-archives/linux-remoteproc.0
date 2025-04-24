Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013719A;
	Thu, 24 Apr 2025 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466533; cv=none; b=cNLHZSkdPpwKx1CxzQyywXd+IYXVyGAzLgWFlc58UcuU5wsL7+/lgxKPAqw1shlKk/bB435Cey2ge1e2IQ4WZi1oxdXqeHi1RGsr34H7PhhsOlIUdnWB6Vj2/udsrxUOwO5GrZW1I06doPDZXMQ0+V40UujESatTivdNU8wXPz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466533; c=relaxed/simple;
	bh=pF5/dsssr25wro+N+RnnibDrMqiB5UwQu+cY3hAlMSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dlgCFi+6lkT9/9jqWon/vQJ4PiKyUpPjt3+qJOlnGBvxxLGpTmwyf7sNAJdTQ8izFq9Mo3gzaAkdWV9fsjG749889eJVvGKKoQnmyITpG4UhmP/hNkSUX/5qjuCfr+hNZdAbI/jEJoyswHCSXyFUUjZNULWPU8Q4aBiSVmM3eQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lsQOcDeC; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lsQOcDeC"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O3mYD62496829
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 22:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745466514;
	bh=pF5/dsssr25wro+N+RnnibDrMqiB5UwQu+cY3hAlMSc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lsQOcDeCE1jiXMyK7UO7OCvx8HfEjfKSg6+IOtmmX58M0TSi1bM6jyjpksCjkmL4T
	 ogLr4ihvkYnAsQYaj4Y3Do/ww6KWcLP9iVNWyMsD5x7e4Vkbkgl4qu2WcQY1zI2CVZ
	 MwFeUt6ULwDEoRRzj0ox0tpczN/q2frv9ipvUfLo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O3mY4g083897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 22:48:34 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 22:48:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 22:48:33 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O3mT3o107961;
	Wed, 23 Apr 2025 22:48:30 -0500
Message-ID: <21af91e3-7804-49c7-b42c-c77613de21f5@ti.com>
Date: Thu, 24 Apr 2025 09:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/33] Refactor TI K3 R5, DSP and M4 Remoteproc
 Drivers
To: Judith Mendez <jm@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417182001.3903905-1-b-padhi@ti.com>
 <f18c954c-f4b6-46b5-a619-60ba23922e27@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <f18c954c-f4b6-46b5-a619-60ba23922e27@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Judith,

On 24/04/25 02:36, Judith Mendez wrote:
> Hi Beleswar,
>
> On 4/17/25 1:19 PM, Beleswar Padhi wrote:
>> This series refactors a lot of functions & callbacks from
>> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
>> drivers. This is a consolidated and final series as part of the
>> refactoring of K3 remoteproc drivers. Below is the breakdown:
>> 1. PATCHES #1-#3 fixes important bugs in R5 and DSP drivers before refactoring
>> them into a common driver.
>> 2. PATCHES #4-#10 does the pre-cleanup and aligns R5, DSP, M4 data structures.
>> 3. PATCHES #11-#33 does the actual refactoring R5, DSP and M4 drivers into
>> ti_k3_common.c driver.
>>
>
> I noticed that for am62ax DSP, local reset is not enabled, which is an
> issue, but I see that it was not enabled before your patches so it could
> be a follow-up patch once these patches are merged.


Yes that is planned after current refactoring series is merged.

>
> Also, I have tested basic functionality on am64x EVM: https://gist.github.com/jmenti/9e7fb3cbb7a34fc1800092e8fa6cce87
>
> so for the series,
>
> Tested-by: Judith Mendez <jm@ti.com>


Thanks a lot for testing.
Beleswar

>
>
>
>
