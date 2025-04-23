Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4527935C;
	Wed, 23 Apr 2025 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442399; cv=none; b=Ojw2vJSB0/4o2p4hrR1x5Ct63pQ3q6PRA+7QSSbux56NDfM/FpnEvDI2xJgOIH8ebTtjpS55z6y5VCTsx4T+4xbwyyq/EvDJCNRB+YMi9Rsn9+x9lLcOzoF42IQUxxiAyG9N4hhgQY/sSGt9/pO39JlGIwANVGyIy0uhWQNgcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442399; c=relaxed/simple;
	bh=MrFjFwFEBYSnwokagwFI4FsVi1NjjLSkYj9T++yRFvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=muNNmXv/9PKzdUQKKxgnaHsBLLQezyfY3S6WIU/vigUgM4vUgGMqFVqducZYs+0eWhEYSTLSuuOTWa7zRUyIvdpO6/kEqUJs2KtXS2WK3SyF2jy9cLH1PHkPjrsH9d//L+mSg1CIwvXAPjIga6q/+S5CMgf0aVhaJrXJAzaPHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=odrFpynn; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="odrFpynn"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53NL6Rai2420278
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 16:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745442387;
	bh=smSHb3c2DIMga+K2xQVRxKRjJEwwRaYZ9IFnguMMFmo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=odrFpynnYLgeSq9deChT3YMZT1kISdqImSmHwfH7Auhgotl2XzopFuQD1xJtnvZxI
	 BE+GxdV2G3xvumQocB/Q78ZZoKfohWf6bAEc36d70KZq6UCifaTYURdVtEp9YbzVew
	 cmBTLhOdnwC/tQ7t/9XLtGZzxu3TME8yjZqIXZL8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53NL6QAp091711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 16:06:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 16:06:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 16:06:26 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53NL6QVS058072;
	Wed, 23 Apr 2025 16:06:26 -0500
Message-ID: <f18c954c-f4b6-46b5-a619-60ba23922e27@ti.com>
Date: Wed, 23 Apr 2025 16:06:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/33] Refactor TI K3 R5, DSP and M4 Remoteproc
 Drivers
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417182001.3903905-1-b-padhi@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Beleswar,

On 4/17/25 1:19 PM, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from
> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
> drivers. This is a consolidated and final series as part of the
> refactoring of K3 remoteproc drivers. Below is the breakdown:
> 1. PATCHES #1-#3 fixes important bugs in R5 and DSP drivers before refactoring
> them into a common driver.
> 2. PATCHES #4-#10 does the pre-cleanup and aligns R5, DSP, M4 data structures.
> 3. PATCHES #11-#33 does the actual refactoring R5, DSP and M4 drivers into
> ti_k3_common.c driver.
> 

I noticed that for am62ax DSP, local reset is not enabled, which is an
issue, but I see that it was not enabled before your patches so it could
be a follow-up patch once these patches are merged.

Also, I have tested basic functionality on am64x EVM: 
https://gist.github.com/jmenti/9e7fb3cbb7a34fc1800092e8fa6cce87

so for the series,

Tested-by: Judith Mendez <jm@ti.com>




