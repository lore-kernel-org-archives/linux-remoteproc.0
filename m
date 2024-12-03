Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738142B9B9;
	Tue,  3 Dec 2024 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243607; cv=none; b=TDxlrUHwWExWQCLrkltRw3HOYB49/gHSxEMnzgtXMhRGDYB3OxRN1iOyC8wZ7JBvSWd7XOpr7zvEQaR4F2dbxWdrDGNu43sFwd1H/yQPXieWuGEfC2HRtyUoSSU37D2BtVAkc7Br8qpsB9uvj+lSOqUo0MO8/hqRDTx19H4X+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243607; c=relaxed/simple;
	bh=gA7F9G/Vm2WzLBR71+pSShEsxcJh7JAiVE+wSLX1rTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bRVrUtS8lJtle8geAMVF1eEH0eVRosE1bL3775nGgLTeSA0qnmzTGpycLMUahYOzms4uTP1BOU2o6NanIgBy+POygmtaUPoylHKdFPV5qPcKsIgSMVn2Ipk4vDAlLQOIKfYM10z0W5rHlOswhWLZYMaoxa96KJxdKV/eO5T1J3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QZvjnIgL; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QZvjnIgL"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3GXKlB1472774
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 10:33:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733243600;
	bh=rYCpB/8NQ6q8NSGjZ0kwCi//jv5DlFZe/pOnHVtk0ZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QZvjnIgLQQoZituP+35VYrjJgZd3hhetLErCXs4DwSzFuvZu/JmZZPom+GiqCiN6b
	 Y2T5j3WYhdZVaGAWooZuL9PjJUgnFj+Oof8Ky1xxXRAH+utsKVcETP9vKc7kBj9sEf
	 jCYdujAHcmskKRWEz+X+ZKa5AlyFyyA3tcoi0YtE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3GXKWv058795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 10:33:20 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 10:33:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 10:33:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3GXKfn027924;
	Tue, 3 Dec 2024 10:33:20 -0600
Message-ID: <1a7d37ca-d969-45cc-87fb-e7cdba8feddd@ti.com>
Date: Tue, 3 Dec 2024 10:33:19 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240729164527.340590-1-afd@ti.com> <Zrk0MeDFI1vvsK9A@p14s>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <Zrk0MeDFI1vvsK9A@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/11/24 4:59 PM, Mathieu Poirier wrote:
> Hi Andrew,
> 
> On Mon, Jul 29, 2024 at 11:45:27AM -0500, Andrew Davis wrote:
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
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
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
> So you want to be able to do both "modprobe rpmsg-raw" and "modprobe
> rpmsg_chrdev" ?
> 
> I'm not sure to get the aim of your patch and will need a little more details.
> 

So there are two parts to driver-device binding, loading the driver into the
kernel, and matching the device to the driver. When a firmware (or any device)
is detected the kernel starts by emitting a signal to userspace so it can load
the kernel module for a driver if available. Then the kernel looks through
its device tables, if a match is found it probe()s that driver.

In this case, for the first part, this driver has the "ALIAS" set as
"rpmsg:rpmsg_chrdev", and so only firmware which sends an rpmsg name
equal to "rpmsg_chrdev" will match and cause this module to be loaded
if it is not already loaded (or built-in).

But this driver's "device_id" table only matches with "rpmsg-raw".
So only firmware with that specific rpmsg name will actually probe().

This means for a given firmware, either automatic module loading will
not work, or driver binding will not work. I want both to work for
both rpmsg names.

We put both names in the device_id table, then use MODULE_DEVICE_TABLE()
on that table. What MODULE_DEVICE_TABLE() does is it creates a matching
module ALIAS for all items in the table. This way any matching ID will
also load the module. And we can then drop the explicit MODULE_ALIAS at the
bottom as it will be created for us for both names. This keeps the ID table
and the module ALIASes consistent.

This patch is still valid and applies on v6.13-rc1, but if you would
like me to re-send it to help your patch tracking just let me know.

Thanks,
Andrew

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
