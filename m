Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538378F4A;
	Mon, 30 Dec 2024 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735531640; cv=none; b=MarUzd0cxTOYB3tab6W/L3rhL7N8zQVN7svQNFztZMBAApJoWaRFvOlJRmb/IKIyOdix2XP/+CKr+9rtECtgR+iZoFOrO/ovRRa6ErEo0GbOQAi81bil9BdDQ8zzr6Ng22B2GoULmvWoHrB06LW8rhg8tELXAs14uXZNIpKH/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735531640; c=relaxed/simple;
	bh=M9oxc8FWBRc6pRvOLadnxuM0Ls1QQlTZHW45OJHYAtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ml8Acqq4MkUzBPml0dr1lPUS1sc+WaYlMiQphCHShRlAhxZzTLirAnVCf3YFhiza8ypOp0Ft9HA25WCbiNkwh22CXgK0XDaiIeSrJInkKD+3tl0AQpei5FUhX8nyWM5Av3FlF8l78k31YYeasvpT+gteayTte8YiOpB58gUNSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OyP6elT8; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OyP6elT8"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BU46s9i062180;
	Sun, 29 Dec 2024 22:06:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735531614;
	bh=TRIa22DB7mDL1LrJCt64NTPQGZ4mWXv211hS9Q0dzZc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OyP6elT85CxUKo1H2GWpqxbrOCLga2J9S1JTmt4PtUdDv69X2tOIT3qxyLhil4g/U
	 sKlO8XlMTrocR+3oAOuWCQWmPMV+EffQVBKzzRQCZVhx1nvB66AlNvpTeED7gf1jtz
	 EPmyfK2v0aw11tQtCkkJk2t1xnD4YC7BymO9JuAE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BU46sNv114821;
	Sun, 29 Dec 2024 22:06:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 29
 Dec 2024 22:06:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 29 Dec 2024 22:06:53 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BU46nG3055355;
	Sun, 29 Dec 2024 22:06:50 -0600
Message-ID: <31b95870-2405-4f1f-bdee-3d635e169c13@ti.com>
Date: Mon, 30 Dec 2024 09:36:49 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: k3-r5: Fix checks in
 k3_r5_rproc_{mbox_callback/kick}
To: Hari Nagalla <hnagalla@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <srk@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-2-b-padhi@ti.com>
 <ecba03f8-db97-24d8-8a10-1b4d98d0e1be@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <ecba03f8-db97-24d8-8a10-1b4d98d0e1be@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Hari,

On 27/12/24 20:08, Hari Nagalla wrote:
> On 12/24/24 03:14, Beleswar Padhi wrote:
>>   /**
>> @@ -194,8 +196,11 @@ static void k3_r5_rproc_mbox_callback(struct 
>> mbox_client *client, void *data)
>>       const char *name = kproc->rproc->name;
>>       u32 msg = omap_mbox_message(data);
>>   -    /* Do not forward message from a detached core */
>> -    if (kproc->rproc->state == RPROC_DETACHED)
>> +    /*
>> +     * Do not forward messages from a detached core, except when the 
>> core
>> +     * is in the process of being attached in IPC-only mode.
>> +     */
>> +    if (!kproc->core->is_attach_ongoing && kproc->rproc->state == 
>> RPROC_DETACHED)
>>           return;
> Instead of introducing a new state variable, is it possible to use 
> device virtio status? 


See below related comment.


> And i wonder what if you remove this conditional check altogether? If 
> the device is detached and with no virtio queues, does not the mailbox 
> message gets dropped?


This check is necessary for mailbox level communication between cores. 
Some Mbox messages directly use payloads like 
RP_MBOX_ECHO_REQUEST/RP_MBOX_CRASH etc. which do not rely on virtqueue 
read/writes for communication (see omap_remoteproc.h). In that case, 
mailbox message won't be dropped even if virtio queues are not 
initialized. IMO, when we say core is detached in "IPC-only" mode, this 
mbox communication should also not happen. What do you think?

