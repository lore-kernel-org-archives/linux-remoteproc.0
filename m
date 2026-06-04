Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE13BBFDC;
	Thu,  4 Jun 2026 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780612102; cv=fail; b=D3NT65ucSInZuoZhqbOCpi+bxGVzm+Z0xkXnPC6KzJWzk0/zPB49twcU1+z5t0kAfu2Y/O2Bl/seRZeKNYcVU+uugeDP/lfwMfbR2oZu29fP1B9PC6J6tbNuSy9TewhgaTcWGRa4CKSAQwzSBgDFBQ4ObCmPG5F8607qlf8R9Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780612102; c=relaxed/simple;
	bh=CJ4JV65RsW4cNHfZSU5Cccul5OGpGY6soCyU2vs9Xy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rwa8U/OWagZM/7BHW1XcIBQQ2l6VLWE2Vb7bWa5TRfhhe/z9cMo4VSe/59ofom8jDR9oawHpMe7bg03lG6cdmkz0Jxkeln59emwHwDe5+4vVEjCbWy9iu1jgxO6Pkllb7Rdoh3DdTV+57wWe/oWe8YUwnNYwGGv3EQhMXat3puM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2k4gUC9c; arc=fail smtp.client-ip=52.101.57.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2k4gUC9c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMtqxnyuNMGY0AkxE0Dviwxh7zR9PhfRW1/FdwglO2XAxqBlyzM9r4akxqr4GoXSl8dosMxsF0ZUThqYtP1qV2sVcc23wsAsp4P10t8ZRPAQ78e0AfEl81wk1hYfJGYhd4eXU+LdoHqvjFSmsaoXOH65wnbU+9IXvxeq3q3Dolq0CxSDjS4VesLvSwDPlhfG1wldyd3t7Y/Cbfj4dLUWF9V87B5zGLVFs0TbaBc1EYZgVC2pwUvclxefidKIRm9pnqu6D5v/wTbm2a9jbTTYZ+URKL7aK5cQPoSwy4OnhMSsi2SspgO3HVGX0MY5vzTIBKJXYhAexfncfDoEEaVkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmKVCQpax5QpXyz96VB8uqJ5PjOziUJUVS9xm1EVx2E=;
 b=QUc7tQscvbmwUgappCDYBpWbaPCWZyXnhofslvA2Bk1OZl6Wl6elAPdF1mfvYxGmfzOSiKZLHwQkEyP9KDblMDvQxNgHHXjpDNXiD8kDV5u1H5uD73D579/+w6f9jhoCAUoeMiWiIFnLyXj0LXcZ+F0l6tMiEQPalx1TmtLKY2JPaUah7gukA9ADxU1C9eZXKvZGNp00MFsjas7nywVgREbdtokp1r1gJ5EypFow1PcZKnqhlutE9PVljCLapYOeCAGhvmUU7MQHmghQ9Xiy7wXXul79DzQBxh2tXDARz+sELkULMNbKwKr2EIMyG+50L2kSBV/oYvTMTlBD7k8nSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmKVCQpax5QpXyz96VB8uqJ5PjOziUJUVS9xm1EVx2E=;
 b=2k4gUC9cu6iukINYXMvjJjwNWVvKBEYfjoYcKN2jZxZprCK3IIMwlcelMxZOiH1LLXO0PIIeDVufSVPdK971c/ZqqERkK3cMoI/q0QgUeJ0fj0VDJJxuy5+zVlaKCifFkF8bwEmxxd8AmGJIFOgA6VWzVMHJ9HmHoDqd35sYx+c=
Received: from MW4PR03CA0268.namprd03.prod.outlook.com (2603:10b6:303:b4::33)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 4 Jun 2026
 22:28:16 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::2b) by MW4PR03CA0268.outlook.office365.com
 (2603:10b6:303:b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 22:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 22:28:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 17:28:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 17:28:14 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 17:28:13 -0500
Message-ID: <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com>
Date: Thu, 4 Jun 2026 17:28:13 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 4/4] samples: rpmsg: add MTU size info
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Tanmay Shah
	<tanmay.shah@amd.com>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-5-tanmay.shah@amd.com>
 <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MN2PR12MB4318:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0f0a98-a2d3-4774-b514-08dec28891b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|13003099007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p6L4LyyZF2pkgRazhNwajyPaK7WR6X+tFgNV/v9ZQXdEYuiaF8usYCFYD67v93iIBjBLz9I8mqDtCWE7YOPf43EvYkFAWGe92rhJcXDBb8nrLurTYk/UIVerdHf6byUE2eWcMWQRNSENmxsyovc42F+Ej0M+k4vBpw3P4a+PyHer0AtniY4CaeuXORcQp8cc+Y6E5gPulvT23o66f2Luk0QfOCp9BDVKc0gi91EMynCg5fym9kBEifG+t2XBBJ1JQZop9/127tqznIKHKu9TQ4Pxn+qh5qBH+r/C6NTsJgeKWsnaYfATlxWPkQ3908UL+f9m6+r6QCqVST7CtVRccyOFoDmzDU3JWW4834YpuXxjwZLRhjlB+xm/R48ZE4www4rtWHl4hfl1l/1jWsem9lq/79aeWWgKWme+hiIj/U89Mu/QIvA/lc4+u8YygNBUGKMwnubaycB4Huz4SvQjnZyWjgGOzTE0C/H5PdAgrCR6HaoFpecP1UyYrIFrn4QKuqXE+2o2UVqIk05xSaM00/wIHIdrpZeQwuvOFDZQkQzsZqkciRp0lqmqpAnyHodbXUH4phUb7RqshVpXpM/Zf7B7T7RYoYoNrnIAzT7z/m/mppfv5caE2LJAj8jS6CdjNxaqmhlM5zVdThYJIJmySv183ICDQpRyEwzJbQ6mEUv0M8acuF7fzR99yQxuakD6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(13003099007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UWbBRD8dkMEuZV3KQrE8uhvpqbagp6/tc7nV7WjV1eG5D5ZGsQboxP6YajsX4qZC/HI+UsWk/ENHVnQSNnyyVsZnq7qkyIA3UhbtmB/uzyAQ8zTSd13QwIY4nHcLpcDxgPN2JrNlPGewidvGIf02iJ3dNB+wyNG3z7/MO1huhzU5qHqklc+JDKlJ6aatkqGXCwSbpM4nYK37FVALnxQGuvcX+KYeFhpTTTd8CFVV6tAE8WjNwdD2p5CXvHzhxsDUH9pnRFKkYY3Ls4FPiRTUheiCAArYvnOo6byMgsi/VoWOGrlIbvL9Z/1a8o0UXwX/R2imcAO3KskX8DV7WiX9UpFFcA9tkphAiiEVS4GGeHCG1wLfic5gNBjuTWpK+tMhdxeYcIZNsaeDBPAY2eeF/kdIJmiJW0ikj4lEuDwL8EKdfhglA1zniiZk0Ve2V4pQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 22:28:14.8299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0f0a98-a2d3-4774-b514-08dec28891b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318



On 6/2/2026 3:34 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 5/29/26 18:43, Tanmay Shah wrote:
>> RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
>> Add log to the sample driver that prints current MTU size of the rpmsg
>> buffer.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v3:
>>    - Check for error when retrieving MTU size
>>    - %s/mtu/MTU/
>>
>>   samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/
>> rpmsg_client_sample.c
>> index ae5081662283..55afa53189af 100644
>> --- a/samples/rpmsg/rpmsg_client_sample.c
>> +++ b/samples/rpmsg/rpmsg_client_sample.c
>> @@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device
>> *rpdev)
>>   {
>>       int ret;
>>       struct instance_data *idata;
>> +    ssize_t mtu;
>>         dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
>>                       rpdev->src, rpdev->dst);
>> @@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device
>> *rpdev)
>>         dev_set_drvdata(&rpdev->dev, idata);
>>   +    mtu = rpmsg_get_mtu(rpdev->ept);
>> +    if (mtu < 0) {
>> +        dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
>> +        return mtu;
>> +    }
>> +
>> +    dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
>> +
> 
> Do you really need this commit? rpmsg_send should return an error if the
> buffer size is insufficient [1].
> 
> [1] https://elixir.bootlin.com/linux/v7.0.10/source/drivers/rpmsg/
> virtio_rpmsg_bus.c#L517
> 

Here, I just want to demonstrate rpmsg_get_mtu() API. Now we can have a
configurable size of the RPMsg buffer. So rpmsg_get_mtu() API can be
used to check correct buffer length before even using rpmsg_send() API.

I think I should check msg length against mtu size as well.


> Regards,
> Arnaud
> 
>>       /* send a message to our remote processor */
>>       ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
>>       if (ret) {
> 

