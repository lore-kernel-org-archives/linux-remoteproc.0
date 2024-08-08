Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5013C814;
	Thu,  8 Aug 2024 05:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723094446; cv=none; b=JC0QrElH78THEUXHr+wO/XtgsvWnx4ZtEV7I58Yey00yRyz485J9QF1oQgQadUnuxig3xb8G/eJj5Q/F4kbnbo9QANCKUxdnDT0RIm7LFob6O+Gd/cO427GXYC2mHJWXouXFV9CzFr9adH7Cyp9sy3/8/728RF+X1SAG18Y9e4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723094446; c=relaxed/simple;
	bh=hMPG68e6k3OpSOOimZthJaI9R7KPj52PD1QIznQJBk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q1EtqmNfVPIPR/5N3Tvh1Ecd3b7GzTNZbG3KW9WbE/oSr1KWfsIQeN3kTaoF1CpFzeTbHLq2wU3VmJZOdJMzXXAOMSVWNSlZ5tfcT00pOWwTiV2lkmkdUSiFT2YUHttZj9ozsL4446g/12s4jbmlf4+ve7kUgFzGMVG94GdCg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rVwfLYpb; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rVwfLYpb"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4785KeVt090430;
	Thu, 8 Aug 2024 00:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723094440;
	bh=euq7HWPdWrs6GO5Xe2C3wf9o77aPHduNiu8luvY+WQs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rVwfLYpbazojIYviqR2+dtDLm8V1vpa7DcIXpz0Ma3h//qjESCO8HL5bVMK3KE/R+
	 BanbQBg1Z0BqJYzVPjmvhCAydp2Q7WGmOGVFPnLDF36+UP3jgqJSlYU0AkZ9ol8bN4
	 iLxd2oeX5mn94h+ftKO3e3ETZqAo6o31BTP/vHeE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4785KeRU011666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 00:20:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 00:20:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 00:20:39 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4785KabX072198;
	Thu, 8 Aug 2024 00:20:37 -0500
Message-ID: <00311e5c-a8d4-46dd-9f59-f7fea5ae4104@ti.com>
Date: Thu, 8 Aug 2024 10:50:36 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] remoteproc: k3-dsp: Acquire mailbox handle during
 probe routine
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240807062256.1721682-1-b-padhi@ti.com>
 <20240807062256.1721682-4-b-padhi@ti.com>
 <1d434d6c-42ba-4142-a701-032cf674c50c@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <1d434d6c-42ba-4142-a701-032cf674c50c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180


On 07/08/24 19:21, Andrew Davis wrote:
> On 8/7/24 1:22 AM, Beleswar Padhi wrote:
>> Acquire the mailbox handle during device probe and do not release handle
>> in stop/detach routine or error paths. This removes the redundant
>> requests for mbox handle later during rproc start/attach. This also
>> allows to defer remoteproc driver's probe if mailbox is not probed yet.
>>
>> Fixes: b8431920391d ("remoteproc: k3-dsp: Add support for IPC-only 
>> mode for all K3 DSPs")
>
> Not sure this patch counts as a "fix". There was a bug yes, and this 
> certainly
> is an improvment that solves the issue, but I like to reserve "Fixes" 
> tags
> for more serious issues. Otherwise this patch will be backported to 
> "stable"
> versions where it might cause things to be *less stable* given the 
> size of


Understood. Will remove Fixes tag in revision.

> the "fix". Also, the commit you selected isn't the source of the issue,
> it only adds another instance of it, getting the mailbox after probe has
> been the case since the first version of this driver.


Correct. My idea was, since we are also making k3_attach()/detach() 
functions NOP, select the later commit because that was where the 
k3_attach()/detach() functions were introduced as well as the "mailbox 
after probe" issue was present.

>
> Rest of the patch LGTM,
>
> Acked-by: Andrew Davis <afd@ti.com>
>
> BTW, I've folded this change (getting mbox in probe) into the new
> K3 M4 driver[0] I just posted, so we should be aligned here accross
> all K3 rproc drivers.


Thanks for this!

>
>
> Andrew
>
> [0] 
> https://lore.kernel.org/linux-arm-kernel/20240802152109.137243-4-afd@ti.com/
[...]
