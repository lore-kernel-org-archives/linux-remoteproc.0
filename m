Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF623EA93;
	Thu, 16 Oct 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631158; cv=fail; b=jp/o2jomIVOJg+rOzZoUXNTv5Iki7YGsYPmhwJm/6ZmAhUjRuNVTZP5CoiOGHb4YqMVYrQqYr5tOxZP/6FXGUlg8jiaeyXwgXn5K7zLgTwab5g/MeigNwlRK//3whlqq/JYmH6N/uoWe0Q8W2lh9Qfvu8CLbe47a1DCsUb+V/Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631158; c=relaxed/simple;
	bh=ZNwEWJ338bbtPGoCd9qSGbkavMsjpUKze9pQ4qwFbC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LRZy3Px+3UeyhwpHDUxKg6o3V2RYTR+W/xNkxKM96iZF+B0JCrr+1CV9mGac9B97E29WalD/dixZ59/JLJhwAWjy4Gy0nPiS54qs+dR23Z1bUaw/0+Az8mXIMrNNQBN05ozPMPr20cHqUFSkujBvgmW3jvwYFazSti6Rwpx8JEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fzoAgBdc; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fzoAgBdc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEfGQPTwJHIta4NQ1WNhMQFfJ+7Z0pg/PgkgKclr4xhpXyO+WwcwlUAeWgc/y3EVHfsYc9ytkNTk5/ejWcfZdQdNOjUOLCj2+gOhVir4FqxkgPNwPurFX8I+VT8OGOcASCIOg62FbTBBBwjQeelJiDEcgLZY1PbGyYr9O5sSZxuC/eA1QXP0Pv5IZlQKynI2Bw35eoanXTgPMuf5LGDlT0hUFpfetw2gTzsdYqHzKor/z87Xh3hAIxRv1+XOwEfA0YVPFx3jik8kwu6RUiIr0nNK9syuHGfywVw29VF0QQpwujcvasqsmm4jK87wsmtV8FIZN+XGDexXLk7orgjOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb8c0yKwSpc4zoPzkklBNqXYCEMtUbIRaQdP1RjwTOg=;
 b=YUcvohIgL98n/++LlfAiJYAP2rvOpAFmhv4qnrps6JskOaEq+O8PtuAH4zQDYoKZsDK+kCzzZqB/eyaaYBWqh7OHqYa+qZq64RgSeW8Co1SOtZJYFnawaTJ0QpAUDe7kxlikyYQ32KIKN/LZsUACTlTB3Mh4zU198KtsFadvsgpiR6MQIDzT6rtF5e9MjcGL2T733cbJn/2gpMOao4FLWO6PDKztv/54WtBOORiaugeUcO09YFVaFAv2jYIZKrEwSJtCSYbSmTQuqPd4lWObCcqmxFbU1B719t7X3RBVvD/CV5Y0eXB48Tz+ByOkqjMJtAW+NTW+5Cy4bPA8In1sMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb8c0yKwSpc4zoPzkklBNqXYCEMtUbIRaQdP1RjwTOg=;
 b=fzoAgBdcCEldX21wR+J2fETO1Ac2DWf1ZM7Nkvj1pag8M9+MOFb+r7Slwj0bLWTVF76G50XuzkF/xbba84VK4/Xn0rBvttb7G2+aNZY3SWXfDtcP5Uu5A64bMaOMwSghiZh5EUzqSf5hbXcXjTIEodOeHS4DL4epPJsbe1IGu8E=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 16:12:34 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::2f) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.4 via Frontend Transport; Thu,
 16 Oct 2025 16:12:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 16:12:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 16 Oct
 2025 09:12:32 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Oct
 2025 11:12:32 -0500
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 09:12:32 -0700
Message-ID: <9e22a020-937b-4965-b7f8-140853ad7d37@amd.com>
Date: Thu, 16 Oct 2025 11:12:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [RFC PATCH] remoteproc: core: full attach detach during recovery
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251002153343.766352-1-tanmay.shah@amd.com>
 <aPELVfhkk0qDXqa9@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aPELVfhkk0qDXqa9@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 26012312-6e46-43aa-e4e3-08de0cced077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXl1TEhMSy9qWDA0YlpoY0VWWkVCaXk5eDllN0t4NmxGSk9pRGdFSThYL3BO?=
 =?utf-8?B?MWNnbDZTMkN4TnVBTElzVk85NnZrN245TndGY0p3eklqZTlSRUZaYzlIc1FI?=
 =?utf-8?B?SkR2OVQrWjJGb2wyVmRuWEw5a0hmcWZybUZFdjZoVGZXUGdJbENkdVY1VmVR?=
 =?utf-8?B?dW1meVBzYjFOY01qaytSWGRDd3JzU2x0eC9sRWxVZHR2WndYRDE1REw1bmFl?=
 =?utf-8?B?bVZ0NFBQdC9CQjRmVzdrMEdKR0VqZHJ0a2ZBRU95aGZZMFlxajR0QzFzbTc1?=
 =?utf-8?B?bnVuL2ovL0xrZlZ4ak5ZSjRGMm9VNWdBMjk0RTE5MDZscERPZTVPRFpONkhS?=
 =?utf-8?B?MS82S0FORGc5UzljVjZaWHl6cVRzcGFHUWU1c2lOS1pEaklPb1lKMDgzL3Bp?=
 =?utf-8?B?U3R5bU1FeWw2UHR6RGhrK0VmWkFaNTFjYTJCVmN4QVFDdDMyd1ZtMzBiVTZK?=
 =?utf-8?B?UVpYM1dBQWVIVWxYMHJSRDNBbnAwdVZkaEN3VFAxd0l4ZDJJTnBwNm9NcGZz?=
 =?utf-8?B?ci8rcG1LTFM3Z1ZNSGdwTXR1YWtxUmRMdmNaNU9rSTZrWk54YysxbHFsVklv?=
 =?utf-8?B?WjMvSGRBeUh0WFlYQjgwWFN4ZnRycHdEQWNZZ0owVlVPbzljRFFNZmNwdHlH?=
 =?utf-8?B?RWZnL3d6Z3dvK1FUTHBzNldkVndDWW5KWWlmdXA2U25PdWVLNm1uai83N3cv?=
 =?utf-8?B?WndZbXJwQUVWWmZKcVNBNVhWVG5GQmIzNk9oc1l1TWIxM0szbFcvZmJ2Zzc2?=
 =?utf-8?B?OHZPem1FL3RMZjJCdER2aERvQ3BLRG54ZmxBMmdjR2U5NmkzcGtib3RDY1l5?=
 =?utf-8?B?Y0pNNGNSY0JCajUzSCtnSkNaVnlLZjYyYVFwRlZybzhvTURXM0tyLzdVaEg0?=
 =?utf-8?B?UXhhZGN6ZzlYZ0NOYTFJUVJLbUh5cHpOSmI4ZkRDUUZQZHgvY24rbiticTlH?=
 =?utf-8?B?YjIvQW02NTh1c1R6RTB2TDVUUmhFc3F1bjNIdGlxTjZkbWxONEVzKzM3RVkx?=
 =?utf-8?B?OFBCaldyTmlCTzgrMkh4R1ZXUEY2NlZSem5sbS9WczIza1VZTTFEa0RTbEk1?=
 =?utf-8?B?cE5kZ0wrSlF2Sy9XKzNaR2dHUk1aVWg3RXkxclFxQU8yNmRXN1M5K0J5WFZt?=
 =?utf-8?B?VXBVQmxoL2d1cndSU0ZTRXB2ZUlWcHJMMjhtU3RpSDBkRVUreEJHSTluNHVB?=
 =?utf-8?B?N2NpM1RlME0xdDEzbTFneWY1dkFLQ0djTTBxNS9JcUs4RDhnUEs3VWR2RjVj?=
 =?utf-8?B?ZTRqVG5KN252cEpFdzMzK0dqRUZzcm1oZnVRWkhPNXowRzFrQlovdTBDYU0w?=
 =?utf-8?B?STRpZmJHQ0t5NTRlWVBBMnRXbGJrL1VtRVAvdlFoSHJoU0NDMzNTY0xQdTRp?=
 =?utf-8?B?YlNwVm1LVW1ieVZhTVNlbWJZZ0tYeWxDQzBabXFUK0p2ZHFpaTYwWWFITFVQ?=
 =?utf-8?B?TDN1SDNxZWlaV2M4citRM2cxUE1mN3VDakx5cXJzaUp2OGg4cjF3RnNUSVpB?=
 =?utf-8?B?alUvOS80bDJ6Ykg2dFdjdTFYSEtmL1cwdEZMclBUMG96UHYwcEdxaDlZSllO?=
 =?utf-8?B?M3p2aUI3YTF2KzFJeTAyakwwZEFUdWxsUVBXU3dJKzRQSnJ6d2E4OXhwbFVv?=
 =?utf-8?B?RDJxN0gwdk1kVWtJZWk4aEdMV1lEVHRrWlJJaHN1YjU5T0RsSWRIa3NIRVdN?=
 =?utf-8?B?aDFNMDBWV0IvNnhVeERBc1kydUt6LzJzZTFBVjI5S2V6NVFubXVZazRRclR6?=
 =?utf-8?B?QW1SY0xkQ29EU21aMG92Qzc2Y2IxVVVGcm12d3hXQTc3eG5KUnJSaGZKdUhx?=
 =?utf-8?B?WkVCcEpNUS9qS3U3UGtXUmRadzc4UmtsZGFiZ2NnMDZ2dXBVS3RFRjV2aXNn?=
 =?utf-8?B?eG5ySlFMZnNnUWtOVnlQek5nRVcrNWhJM0ZFb1ZJT29sNEdCdUFoSE11YXdq?=
 =?utf-8?B?bkRnN0JvOXg4KzVneE1BZTdTL3dUL2NNaXArMDYwb204QmJRdEJtK3ZUZVRH?=
 =?utf-8?B?QStxZ2hOb3hZb2lZbG9LTDVvWHRHS0tzNFlzMFVIVXQ4S3l5M2pqWGVJVHlH?=
 =?utf-8?B?RFc5b2xNNjRyeFgwaWNYTjlpZ3BucWJldUNOU2FwRHdkOS9zYndCcnk5MnVC?=
 =?utf-8?Q?jIZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:12:33.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26012312-6e46-43aa-e4e3-08de0cced077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841


Hello,

Please find my comments below:

On 10/16/25 10:12 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Thu, Oct 02, 2025 at 08:33:46AM -0700, Tanmay Shah wrote:
>> Current recovery operation does only virtio device reset, but do not
>> free and re-allocate all the resources. As third-party is booting the
>> remote processor during attach-detach, it is better to free and
>> re-allocate resoruces as resource table state might be unknown to linux
>> when remote processor boots and reports crash.
> 
> 1) When referring to "third-party", should I assume boot loader?

Here, "third-party" could be a bootloader or another core in a 
heterogeneous system. In my-case it is a platform management controller.


> 2) Function rproc_attach_recovery() calls __rproc_detach(), which in turn calls
> rproc_reset_rsc_table_on_detach().  That function deals explicitly with the
> resource table.

As per my understanding, rproc_reset_rsc_table_on_detach() will setup 
clean resource table, that sets vring addresses to 0xffffffff. Please 
let me know if this understanding is not correct.

If we do not, call rproc_attach(), then correct vring addresses are not 
setup in the resource table for next attach to work. Because, 
rproc_handle_resources() and rproc_alloc_registered_carveouts() are not 
called as part __rproc_attach().

> 3) The code in this patch mixes __rproc_detach() with rproc_attach(), something
> that is likely not a good idea.  We either do __rproc_detach/__rproc_attach or
> rproc_detach/rproc_attach but I'd like to avoid the mix-and-match to keep the
> amount of possible states to a minimum.
> 

I agree to this. I can find a way to call rproc_detach() and 
rproc_attach() sequentially, instead of __rproc_detach() and 
rproc_attach() calls. I might have to remove 
rproc_trigger_attach_recovery completely, but that is implementation 
details. We can work it out later, once we agree to the current problem 
& solution.

> If I understand correctly, the main motivation for this patch is the management
> of the resource table.  But as noted in (2), this should be taken care of.  Am I
> missing some information?
> 

The main motivation is to make the attach operation works during 
attach_recovery(). The __rproc_detach() works as expected, but attach 
doesn't work. After recovery, I am not able to strat RPMsg communication.

Please let me know if I am missing something.

Thanks,
Tanmay

> Thanks,
> Mathieu
> 
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Note: RFC patch for design discussion. Please do not merge.
>>
>>   drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 825672100528..4971508bc5b2 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1786,7 +1786,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return __rproc_attach(rproc);
>> +	/* clean up all acquired resources */
>> +	rproc_resource_cleanup(rproc);
>> +
>> +	/* release HW resources if needed */
>> +	rproc_unprepare_device(rproc);
>> +
>> +	rproc_disable_iommu(rproc);
>> +
>> +	/* Free the copy of the resource table */
>> +	kfree(rproc->cached_table);
>> +	rproc->cached_table = NULL;
>> +	rproc->table_ptr = NULL;
>> +
>> +	return rproc_attach(rproc);
>>   }
>>   
>>   static int rproc_boot_recovery(struct rproc *rproc)
>>
>> base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
>> -- 
>> 2.34.1
>>

