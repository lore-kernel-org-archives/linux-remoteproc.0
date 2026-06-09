Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924C47ECF2;
	Tue,  9 Jun 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022823; cv=fail; b=VN0u/dsBWClr7OOWN9UNhYZhrQYqbDXGpxQX0twu5SjahcGH7MRcxlNPtSDlWet5VzqikjoupcywNKCvA2HoFITXuRnWEdC5yxuf3oyU1MNrsBCesOy3AVljV6OUJeK4PEn7s7gnxSd1Cy5YdHpcKntWnWiZOENsuPcCcLfKfnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022823; c=relaxed/simple;
	bh=e9MYs2iKeo00jfeu8OzGSu9CUQmxkFTfs3TtFgpW0P0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=hUQJ2i5z37NZoChGCktcWr2bx2KcN79HOf83jLEoauFpc2ht8nn7M5jP4PaOhnA+Oi70rJVvckXmMlwQX4nT9NmAh9rszhy+TvN5OLuid1Puv9df4lNFkazRmjvUxekIw1CCee8BlgFmQVLEgbmVxlf2XdzMOS6V8HlR86Lbp0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ryF0m6jj; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ryF0m6jj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHweqjZrrG3r2CykuX+f1ACn8bkXvEmSmAKgd1jSrFn6cI/VZqXlSmOiq84nKwj9i4lCqs4zT0DKGo6ymkoxPLq3SHAHG6JnAl03WmmlxrVfsI73jpjHXYCYLeVVrknG0f2Jf8xJuA8ZstnnvvCvudJ/e0BWcZzCgcQv/2ag6YeRERI32t6HUCaBmiJ848HtkVJ3P8F3n3Jq7Fv6v1X+S/iQtckzsJ7ZOAYEOmPVaPuBzWhhoIQHaY0TSmZ88pQNizK2f8cXHilc/BkUGj0O89HSCZJ8YuSXdagPOc4SdCE1QS/pQrXmeMQanVpO7RAJT37BJen/kBwugQRj636HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfjU/7jaoPaOLjbkLXTTusBtr5zeo51CgNpGNGwXMPM=;
 b=Dbvpknxf5ru71r6unHWE6E+CMzBMBbkfPYKT82F3XnKeZTAhUw9l2FEIJ5nhaiCxNrkMZLb3jVAm0R6eRpSRm+tfYLyGCzjyJ4IE1NqGMoDmnPyH9/yzFofI723zuhIqdRfj85ZpmUHijK1J9RFWYQ0nSAzeNT33iA9QZkW+NdEfgmxdKqwxOY64Zfm5n4gaJRMWe/mlt9CtYGkt0+3W82PB5uNuHhn1HkCjzrDUGD/7kwkLLWfCqG6NiQ1W0BKomLoNDkcmMiEQU7FmdPDLvXbXXxwtZpD5fAWcKkhB/hiC283XQjlTQu+l3KrVf/pNgBV/u3ByNDDn2R2Fd8+yPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfjU/7jaoPaOLjbkLXTTusBtr5zeo51CgNpGNGwXMPM=;
 b=ryF0m6jjFuTsIZpuBNXDRsq/Hn9dBJ+f1pbWxe5OYYEUH9pTQUP4t45ehj9iVRKsnvsKBdIafqB0xecwx3TtcTPCTnj/s1kilcRR+KDCfFR12ftHDCxF4npruNQ0cYb5PGOsyKKeNffQbe9LNT/qit4jLGf50ahlJV3YgCADL8Q=
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 16:33:31 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::52) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 16:33:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 16:33:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 11:33:30 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 9 Jun 2026 11:33:30 -0500
Message-ID: <f8541769-3525-4430-8d3d-76f05d7385b5@amd.com>
Date: Tue, 9 Jun 2026 11:33:30 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Shah, Tanmay" <tanmays@amd.com>
Subject: Re: [PATCH v3 4/4] samples: rpmsg: add MTU size info
Reply-To: <tanmay.shah@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <andersson@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-5-tanmay.shah@amd.com>
 <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
 <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com> <aig7QKcSIL1aVihQ@p14s>
Content-Language: en-US
In-Reply-To: <aig7QKcSIL1aVihQ@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fda431-c701-4baa-9599-08dec644d788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|11063799006|4143699003|56012099006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Xd9JuXEl6TL7BYOhyLPvayM4OX7ThXq6pODsRiWNjlzBxxUuVVJpmY0myr7F81Xj+0m8bGEd3mSeosaUklT5q+NyrDh5CIDJLJTF9lnreUofAdUK2oyWRrkce3BWcvnv9eWeRpTszntagOResnFcy3O80qbknQmZsWFuUKa3CifCK68VCMPLWpRbpy+i9PulEK3iT/fPD8OG7AtwnUbLFwIDk60tVQJXfzPOb5bHjo5hgRha9X9DRRltRZjqteSvRp8ogXBkQiuX0Prr7mXQD7vCEMVp7OQWFMuypw57zk0p5u/bO/fYY/4wTokv9stCRZds/qtUgy5ItflYQxl98RYFPFWx630ce8CIPzFGtCQm004Sl+CSn81oDPKwz50TFu0LbWcqbg52epg5A0RdOzFf/Lud0g2KxsP5QqdFcBIpxBgNioSaHqQfuVjdD1UfAoHmh5S1Rk0soUxEm7Q99BvYavoP9FkMUKq7Rv5cmFecSmcY52mXY9BasY9WCK+nFZPfr8DgHxYelNyEczZldzUawZHKanVNQAbbJYEMCpVZVUoXITEOp7n6sAOy7WA3IMiZPczpFWsrd7tgUfZ7EgRW7hd3dlYUANA5eSIdkOxpqxeJSdtGIG1f5tfjEcOCiHKE4lRbOjdRvVpn3/iR9T9sVuFKMDQ+B6amCPpmw1UDN9xiQrMcPCz4NY+97EPp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(4143699003)(56012099006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hW30te3Z1FT1keBGYpfuKSTTne6SDLjIr5oAgTM0ycnFgNw49w6wVnOS9HClKPY0c172NEShGcHR24pqr1zO0nPcZ9WtHuV7hP5wdopu5nT+QVG5OwmZe/laOnhMABEWQkmbGsj2q5fFIZQGIdxHvAI17DD2erN+YcqxJ1k+I8h1nt1Wl1CaGUqgOm3xeKb/ZQ5BRIKO5nt0VLVnJMUmqPrSbPIE1R1iTEbvG9qnIaWTl8sQAg9lvmUn9lFr1eaWLC4CkEkMWy+HJmCxhZvmi9MHm8WvrKmrqG+464djRKqsAzyGWCs/5QTPVqQ4zv0L9pRC02tcnQxPyvii2xIIO5d3BQBwTh9rXILiXRGpmPnwo0gwkFqIvh6LAwOH9B7SQDad8bDsAMLXiKSutD4Z+Csof01OsBLMMWzKn7BAtc0hoMY3wVbAyGz+upv1G7lW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:33:30.8224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fda431-c701-4baa-9599-08dec644d788
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542



On 6/9/2026 11:11 AM, Mathieu Poirier wrote:
> On Thu, Jun 04, 2026 at 05:28:13PM -0500, Shah, Tanmay wrote:
>>
>>
>> On 6/2/2026 3:34 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 5/29/26 18:43, Tanmay Shah wrote:
>>>> RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
>>>> Add log to the sample driver that prints current MTU size of the rpmsg
>>>> buffer.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>    - Check for error when retrieving MTU size
>>>>    - %s/mtu/MTU/
>>>>
>>>>   samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/
>>>> rpmsg_client_sample.c
>>>> index ae5081662283..55afa53189af 100644
>>>> --- a/samples/rpmsg/rpmsg_client_sample.c
>>>> +++ b/samples/rpmsg/rpmsg_client_sample.c
>>>> @@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device
>>>> *rpdev)
>>>>   {
>>>>       int ret;
>>>>       struct instance_data *idata;
>>>> +    ssize_t mtu;
>>>>         dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
>>>>                       rpdev->src, rpdev->dst);
>>>> @@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device
>>>> *rpdev)
>>>>         dev_set_drvdata(&rpdev->dev, idata);
>>>>   +    mtu = rpmsg_get_mtu(rpdev->ept);
>>>> +    if (mtu < 0) {
>>>> +        dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
>>>> +        return mtu;
>>>> +    }
>>>> +
>>>> +    dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
>>>> +
>>>
>>> Do you really need this commit? rpmsg_send should return an error if the
>>> buffer size is insufficient [1].
>>>
>>> [1] https://elixir.bootlin.com/linux/v7.0.10/source/drivers/rpmsg/
>>> virtio_rpmsg_bus.c#L517
>>>
>>
>> Here, I just want to demonstrate rpmsg_get_mtu() API. Now we can have a
>> configurable size of the RPMsg buffer. So rpmsg_get_mtu() API can be
>> used to check correct buffer length before even using rpmsg_send() API.
>>
>> I think I should check msg length against mtu size as well.
> 
> Do you plan on sending a new revision of this set or should I move forward with
> this one?
> 

Hi,

I plan to send a new revision, but would like your input on the idea of
this patch. I would like to use rpmsg_get_mtu() size API in the sample
demo to print tx buffer size. This is because buffer size can change now
from one firmware to another firmware.

May be we can print it only once during the driver probe. Open to any
idea that show use of rpmsg_get_mtu().

Thanks,
Tanmay

>>
>>
>>> Regards,
>>> Arnaud
>>>
>>>>       /* send a message to our remote processor */
>>>>       ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
>>>>       if (ret) {
>>>
>>

