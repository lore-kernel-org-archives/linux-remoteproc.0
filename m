Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2987D3F4;
	Wed, 25 Jun 2025 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750871534; cv=none; b=niVKv/HMvnrTpwWML0qakSxU/uCef93xw6mfK0YF5B6oD90OmWHkpr2ezfPZUBe6NWhvcw6xu5bgx3IIO0/BwLHAwOlCNUUaz8tlOpwwz4HrHk8tyhVT7/gdeJ3/zvRgC8Nx5UZfxBasTghNvGnRuKY30MiaA4xsLIwph1K+X/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750871534; c=relaxed/simple;
	bh=YaeCqA31K3Ilmu3te7dK2oKu8g5ZeoTHNuNZ16Qh2Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OU4wSK1OpRLdICenvWsCfhJui6dibXh7DaoXZLsRWUyMGm6GB4X+gbpKu9H0yj6tOPniaAaT06i/ePKU6+y06gxd4oefwJDnOBkfptPzUUIhNJjy/1/hZfH+JMyJL6EdXmYvUVDzg5n+/CMILg5lwUFMwWDAxg5lWwLohSaGqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P+4L+PEG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P+4L+PEG"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHC5752238235;
	Wed, 25 Jun 2025 12:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871525;
	bh=k3+4eTElymS85z7iOFtGbKaOKqZschF1hFgFwnsrxMo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P+4L+PEGKGmlph+Qb6zeL9hfzVBCyrQIaMPEmM/oN7vtgXBkOo94d98lM0kjGfiDj
	 7ouAOnjCI7lx3qpRQKCxh4VFnA0TckKBbdQ8oIdIj5lvL/7Swze1OBtZToXl9hOCYJ
	 SzMhvs22IPXSqYUTP2eJT5qRqYcVjsYVd/82kz5Y=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHC4K72770384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 12:12:05 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:12:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:12:04 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHC3tD3742857;
	Wed, 25 Jun 2025 12:12:03 -0500
Message-ID: <a6d77856-cf9a-48f4-a66c-d124752b5f64@ti.com>
Date: Wed, 25 Jun 2025 12:12:03 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250619205722.133827-1-afd@ti.com> <aFwgQJ8B7EcjM1q7@p14s>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <aFwgQJ8B7EcjM1q7@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/25/25 11:13 AM, Mathieu Poirier wrote:
> Good day,
> 
> On Thu, Jun 19, 2025 at 03:57:22PM -0500, Andrew Davis wrote:
>> Module aliases are used by userspace to identify the correct module to
>> load for a detected hardware. The currently supported RPMSG device IDs for
>> this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
>>
>> Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
>> supported IDs. And while here, to keep backwards compatibility we also add
>> the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
>>
>> This has the side benefit of adding support for some legacy firmware
>> which still uses the original "rpmsg_chrdev" ID. This was the ID used for
>> this driver before it was upstreamed (as reflected by the module alias).
> 
> I was surprised to receive this patch - my question from almost a year back is
> still pending.
> 

I answered[0] your question and never received any follow up questions so I had
assumed the answer was satisfactory.

>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Acked-by: Hari Nagalla <hnagalla@ti.com>
>> Tested-by: Hari Nagalla <hnagalla@ti.com>
>> ---
>>
>> Changes for v2:
>>   - Rebased on v6.16-rc1
>>   - Added Acked/Tested-by
>>
>> [v1] https://www.spinics.net/lists/linux-remoteproc/msg18959.html
>>
>>   drivers/rpmsg/rpmsg_char.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index eec7642d26863..96fcdd2d7093c 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>   
>>   static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>>   	{ .name	= "rpmsg-raw" },
>> +	{ .name	= "rpmsg_chrdev" },
>>   	{ },
>>   };
>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);
> 
> ... and I still don't understand why this patch is needed.  What is broken that
> this patch fixes?
> 

Today when this driver is built as a module it does not automatically load
when a matching firmware is started. You can see examples of documentation
working around this by manually loading it[1] and even applications
attempting the same in code[2]. This should not be needed. Here is why
this happens and how this patch fixes it:

A given firmware that makes use of this driver will have one of two
RPMSG device IDs: "rpmsg-raw" or "rpmsg_chrdev". Let's look at each in
turn:

If the ID is "rpmsg_chrdev" then this driver module will be loaded into
the kernel (that is what the MODULE_ALIAS line below did). But it will
not cause the driver module to probe, as probe is triggered by a match
in the above rpmsg_device_id table.

If the ID is "rpmsg-raw" then this driver module will probe with the
firmware, but only if this driver module was already loaded into the
kernel, or was built-in to the kernel.

By adding "rpmsg_chrdev" to the table we make this driver probe for
firmware with that ID. And by adding MODULE_DEVICE_TABLE we make both
IDs trigger the module to be loaded if it has not been already.

This patch makes it so both IDs do both needed actions. Where before
each ID would only do one action, but not the other.

Andrew

[0] https://www.spinics.net/lists/linux-remoteproc/msg19814.html
[1] https://github.com/OpenAMP/openamp-system-reference/blob/main/examples/linux/rpmsg-mat-mul/README.md?plain=1#L42
[2] https://github.com/Xilinx/meta-openamp/blob/master/recipes-openamp/rpmsg-examples/rpmsg-mat-mul/mat_mul_demo.c#L306

> Thanks,
> Mathieu
> 
>>   
>>   static struct rpmsg_driver rpmsg_chrdev_driver = {
>>   	.probe = rpmsg_chrdev_probe,
>> @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
>>   }
>>   module_exit(rpmsg_chrdev_exit);
>>   
>> -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>>   MODULE_DESCRIPTION("RPMSG device interface");
>>   MODULE_LICENSE("GPL v2");
>> -- 
>> 2.39.2
>>
