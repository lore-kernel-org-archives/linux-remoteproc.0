Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3032641C6;
	Mon, 23 Feb 2026 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883052; cv=fail; b=Vj15wndGk1gcabkUf1lBIVeDEK9sT0AgS0876gqyxHWZmk4L+vMpAEvp6RAuXCZrX7H7r1GVLkfPu7jGiVKGEvLbTsnHTFE368ZjaoS8CuOnKFfA7Vea/3YfL1T2CR0EUZZbT3w6A2drL1GdOqt0Eht9vYeaPiJfYPF5CqHYSqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883052; c=relaxed/simple;
	bh=hxW0x6TgH+mb5P10CUvfDB4shmjU4bm9fquT/RVY5m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mCYxA1jxzAlNRjWRnZxz6ljf+OFO6aeUNY5k2nQ8EvaKkOIOPGHFkGa9DjtYUG9sAJZw1461HsdbHEtekpsmqeO8dNTmxZsw7JJzSK1/RBEcjP//9nj/pRb7KS185GrwBMgH3q7AOV5jnTg4bPyMovFAdwJATUK/9TK1QnYIOgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yvMsReZ2; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yvMsReZ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuKoZfCq/sOjZR5yfxCO6Bsdd6iVstIloSoDMCt24zHBy2mrW7fh7f4YJ0BWvDBtgFNHrN01ZCiZR3UBBJp8p02Wdd6B7yKtAWCmV1aiQINBTEXfCCkYKYoGcl9MBsJ9vO/xge4jm3KSYD81z12JmdCu2FqtWWSW4EmGcifQYxt4L9Ppid0x45r1jimxp5YjVc1vUSbpx8zt5ZOnB+oXVKTuOWpmgE1vHnPn0FGNunx5vHZIx/BcAY54/DZscGCimhy2ULP5mPZPl/vtn76oULE+UwLhywqFHlV/7c8EqOGHpkV6ahpI8vQZrHpyikIteKaf75McWEoah6bAMGhSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txLwO/9VK1H1qymPoHM/aq0CcvaZXlc4Gl/ZTSik4vg=;
 b=kROWB2SKwnXM9bSzdpN/RFyzOd2sR+mQ8bZv4WEGSBVMCBXBxKxbNC3iXaiDrg5trY/MmH2O0jr15WNKYVO7LZH9zmrX3fgdlfH0dW70dfHdn8BRhw+VTCbhw2fdiIE/iBm4mFwkKdAau6fJx7e4rBBLQBG9mCAgLY6MH6MpCqyHJe2YQjKs0uwS9MOJEYVyId+4ek5pxtuHpbE0M8mD4YVVwi7s7NYRbvjfitW/1WpbNNacflUStkz2PtxN4+kDRWlKOLnlCJsjK38Nn/RW+9u187wCZnMcgyjBnw+oVjnLq7xY7Xnxy2EKDKl3qZ57R6AImYrSb+9ajgfXw9v+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txLwO/9VK1H1qymPoHM/aq0CcvaZXlc4Gl/ZTSik4vg=;
 b=yvMsReZ2VW3UXNpmor2G/ZMr6W/SbDyx9dxxH56wHHkGSkFirWYoYFxdP5m6y9VfMK2l4et+0bFKThR+Icnjqbu+memWuBE0qyB5KhwJ6hZo3XEpggZ7HRPFlaIUjA/cQdZYbUjChwo5Ni9f3lTPH1MLxVKlB5NVyDzk4S4pko8=
Received: from BYAPR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:c0::15)
 by DS2PR12MB9616.namprd12.prod.outlook.com (2603:10b6:8:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:43:58 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::8d) by BYAPR05CA0002.outlook.office365.com
 (2603:10b6:a03:c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 21:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 21:43:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 23 Feb
 2026 15:43:57 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Feb
 2026 15:43:56 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 15:43:56 -0600
Message-ID: <fcbdd56d-7631-4ab1-adbf-48fd49c9a8cb@amd.com>
Date: Mon, 23 Feb 2026 15:43:56 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 1/2] remoteproc: core: full attach detach during
 recovery
To: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-2-tanmay.shah@amd.com>
 <tggyglgkgwj4skvyyeg74gdhlzmw45pmpakvrnghp5jsv6ujtp@z32a7g2s6sle>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <tggyglgkgwj4skvyyeg74gdhlzmw45pmpakvrnghp5jsv6ujtp@z32a7g2s6sle>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|DS2PR12MB9616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8498482e-e64e-4ad5-c3d7-08de7324a657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXpzNkVvRGlTUnlTQmx0OGp5bUJoNWtFNTVCcXNLMHdiNTZOelFKZVdWNGtG?=
 =?utf-8?B?OUxtaXZsTU1DTllOYytXeWNNS3pQM2ptWkFDbmxJL1RsL0loTXA3aHU4QnlD?=
 =?utf-8?B?ZTdtaFZwWDA1REJPZkVUOExOdy9SdTFOcjkySkdZOTZlNGNiYVAvY0kxVTA4?=
 =?utf-8?B?bUpXRzRVanNWYUFVT3BoQlpxM2ZtTEVsdERFeGNOcXhEQmoxUmlGY1k0UHV5?=
 =?utf-8?B?QW9XSlc4V3h0NWlKanU1NTdvM3FudHk1Y0VyMkhVeTdycDJQYmxoblRjUzdh?=
 =?utf-8?B?eXpYbGM1aTluc2tSeG1ueXh6ZW5ZNTZTMmVSUU1RL0NjamhMVjQ2YURNemdk?=
 =?utf-8?B?Ty9yNGwxVGFnektwYTlzd1AwUUs2RUZtRUh1dFQydnIvWDRscnEyMXRqd1J6?=
 =?utf-8?B?d3RNM0lQQ3ptVys3ekFaM1F6RzJaSWpnbDVVY2cyQlgyMkxjZ1FLQWxMdndZ?=
 =?utf-8?B?UExhNjNQOUlFaXVXaDZIeUlFNlZWNm9qS2cwVStWY1ZzKyt4eEEzTnZ2NGJk?=
 =?utf-8?B?cGhvWlFQejA2M3IrWmZyQ3U5cDI5cEplQmtLN0RnTUY4L2ZxL1ZhWHlwUlFI?=
 =?utf-8?B?VlhoZWtkQ1A5OGVTQmtEUUpsR0d1dS82SHFUMXJuZVFEcCs2aE5lUmVoTThD?=
 =?utf-8?B?SWJZNTdCay9TMWFySTN3ei9lSTNQb0tFcEczMnhJUTF2VDBKZms4NUVlWEY1?=
 =?utf-8?B?RWJYQUJsOHRwcE1EdGpyOWw3KzNoUFRrcGRTWmxQcTlpcW9aNFlWZ2xQUEVa?=
 =?utf-8?B?bXJzOCtmTDdtMm9sTXFZekNiZWQ2Umw5blB4R3BrckwrZ2IvekFqOGJxK2cw?=
 =?utf-8?B?dlFLUDJhbE5xOEVBQjlwLzB5WHdZeDdMK1UzS3NIc2xUdFQxdXdVK3NFQ2V6?=
 =?utf-8?B?NnFTNUJZS0NkekhmMDhxYVhXbkhaZ3pPS0ZTY1JDTzBsTy91L3RCSnhiSVgr?=
 =?utf-8?B?U0U5QlF2Vmo4Y2c1VDBmdVJxRWRQVW5qYkVvYmhOUWFLVExCc3RJZUlITWtF?=
 =?utf-8?B?VVVIYVRtaGU5T0NEU1NOaXRjN2xERUVkaVZLT01oM2hweUswNDFMNmRnZmpT?=
 =?utf-8?B?M01lQ1Y5Y0RyYkk4b3RnQ2JCcXU4NlpqREI2d0ZYcFhHU21NRHVNeVZNUjcy?=
 =?utf-8?B?cWN5UXkyN1NHRGNQRHV2ZVpZNk5sVWhFL094M0tnWlM1cnBNTkVnNUdrMkRJ?=
 =?utf-8?B?TGRtVndJcDl4dkF2UEdpK1ZhWlJKbDJDSG14aGdYOC9PMEV1T0JDelN6cWRK?=
 =?utf-8?B?REZtTWd6RG9aZERVQjV1c1J0R0d6cFFZRjJTdHpSdWJtanFCWUF4M0lBVHRE?=
 =?utf-8?B?eS9OUlNRakhiLzRBTHZFanBMeFJHN2V0SXhVUjh1TjdyV3l1ZUdER2NPZldK?=
 =?utf-8?B?cTlLNEo5aEcvUnlKNVYwMkNPTVBLUkNaNlQxRFVWNTRXUi93UmUxblZ6U3pG?=
 =?utf-8?B?Y2UzMnBMZmQ3ZE5zVkl4eVpVdGdEazdyaTVXT3d4YVQ3VFBQam85aXJuc0ZZ?=
 =?utf-8?B?YVJ3WEJxRjdYRG9DM3ZBeW4rRkZzZlhIb2o1RzNiK2JVbVVrYi9yZ2gzMVpr?=
 =?utf-8?B?ODk2RUpmMWcwSXllckdKK1NKaldvaUd0dURCckZBNTVjdjU0RVlPeWM2cmV6?=
 =?utf-8?B?VmhTL1lLUDZOMHNwK3drSUtqMWdORDFieUZJMm5ZYkhQaVYrb0VuY3kyL3Fl?=
 =?utf-8?B?MWpWbnhUZUViaS9hWFZ2bDJQd1ZTYXB1alJXZjgvRWZsT3J2ME1ZYlFqcSts?=
 =?utf-8?B?c05DNE9DYllIT2JrblkrRTRqWExvdmlnbDJKRmJxeFQ1Ny9iWlJqT1I1SW1L?=
 =?utf-8?B?U1hPV1J4TUpjeWJmdmlJbWFzdlgyYVJQei9KM1Vta1JpSVR6Wk9qRCtRcWUv?=
 =?utf-8?B?eS9mQW1RQWE1WmVzTmswYzVwbm1aZHJEK3BMS2t1VGxaTUYyMk80YkRVNHJu?=
 =?utf-8?B?Q3lmYUtkNUlBclovS281U2hzTi9OWmZTQjBRT0JRc1RaMnpEcVZYY0NnOWFx?=
 =?utf-8?B?azFhQzlhdU1Lb3cxNUQrdU1qTzdxODJpWXhCaDk4N3FCbW9CcFJKdlhrM2x5?=
 =?utf-8?B?eHhERUI3VU1ZWk1KanVFTkJjcmxuenlmZC85WWxTNXd0bUlpYVd3RE5pNFVt?=
 =?utf-8?B?QTd5azVEMG8rTTY5clB0RGNocyt0YzJmd240VjBvQ0QxOVZoOTZFTWVLRmNy?=
 =?utf-8?B?VkFEN0FJTnllQnNsRGVJbEtKVzhpZ3JFY3dXa1JQUVo5dXlMMTA5VHE3NzI2?=
 =?utf-8?B?U0Rybm9SY2JrS2tFU21jb0J5QVJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	49yi1fuHjOnnDpqr5cpjGdoVMKW9dRTnXa4uYvkj2a5XsqD4Kl5G/Tr8HsYjJjAV1zwGU0NcXQEiVdlrgPSWeVztsf+Zi33A/H94W5KmaekRsMY1Vehab1KZMm1Da9ZA7lIfRhI7d946sQfHxABf/EAjHDXkdPRe6/FXmYkHMzEa9vuvzkV1ejI+sb0wyvk4DnYp++3mAW3ffEcOBeQU/3w2NxhhPerO35nakJhIQYwmJObUUTkUO7ntp4d6e7PwOilVOJTFoW2v+sv0PUb1zxfhIvF2ir9CpNhOeAk/FBeACsn8YWosCvJl14KJAoFdMUOsINKajVJKCPry88BQpu+AQrMTRmjIBdxtil806tUxZGVsGzdpMzbSOpeLkoF6mENX88yd1B8T5m2TdUtWwAzIDBrgECBwZSlVGT6vFaQ3yv1WdVyncut48mFZczA0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:43:57.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8498482e-e64e-4ad5-c3d7-08de7324a657
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9616

Hello,

Thank you for the reviews. My response below:

On 2/23/2026 1:27 PM, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 10:50:05AM -0800, Tanmay Shah wrote:
>> Current attach on recovery mechanism loads the clean resource table
>> during recovery, but doesn't re-allocate the resources. RPMsg
>> communication will fail after recovery due to this. Fix this
>> incorrect behavior by doing the full detach and attach of remote
>> processor during the recovery. This will load the clean resource table
>> and re-allocate all the resources, which will set up correct vring
>> information in the resource table.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v3:
>>  - both rproc_attach_recovery() and
>>    rproc_boot_recovery() are called the same way.
>>  - remove unrelated changes
>>
>> Changes in v2:
>>  - use rproc_boot instead of rproc_attach
>>  - move debug message early in the function
>>
>>  drivers/remoteproc/remoteproc_core.c | 33 +++++++++++-----------------
>>  1 file changed, 13 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index aada2780b343..790ad7c6d12e 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>>  {
>>  	int ret;
>>  
>> -	ret = __rproc_detach(rproc);
>> +	ret = rproc_detach(rproc);
>>  	if (ret)
>>  		return ret;
>>  
>> -	return __rproc_attach(rproc);
>> +	return rproc_boot(rproc);
>>  }
>>  
>>  static int rproc_boot_recovery(struct rproc *rproc)
>> @@ -1790,10 +1790,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  	struct device *dev = &rproc->dev;
>>  	int ret;
>>  
>> -	ret = rproc_stop(rproc, true);
>> +	ret = mutex_lock_interruptible(&rproc->lock);
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = rproc_stop(rproc, true);
>> +	if (ret)
>> +		goto unlock_mutex;
>> +
>>  	/* generate coredump */
>>  	rproc->ops->coredump(rproc);
>>  
>> @@ -1801,7 +1805,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>  	if (ret < 0) {
>>  		dev_err(dev, "request_firmware failed: %d\n", ret);
>> -		return ret;
>> +		goto unlock_mutex;
>>  	}
>>  
>>  	/* boot the remote processor up again */
>> @@ -1809,6 +1813,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  
>>  	release_firmware(firmware_p);
>>  
>> +unlock_mutex:
>> +	mutex_unlock(&rproc->lock);
>>  	return ret;
>>  }
>>  
>> @@ -1827,26 +1833,13 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  int rproc_trigger_recovery(struct rproc *rproc)
>>  {
>>  	struct device *dev = &rproc->dev;
>> -	int ret;
>> -
>> -	ret = mutex_lock_interruptible(&rproc->lock);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* State could have changed before we got the mutex */
>> -	if (rproc->state != RPROC_CRASHED)
>> -		goto unlock_mutex;
>>  
>>  	dev_err(dev, "recovering %s\n", rproc->name);
>>  
>>  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>> -		ret = rproc_attach_recovery(rproc);
>> +		return rproc_attach_recovery(rproc);
> 
> rproc_trigger_recovery() can be called either from scheduled work or
> directly from the debugfs/sysfs interface, it doesn't seem safe to me to
> call rproc_attach_recovery() without ensuring mutual exclusion between
> multiple parallel callers.
> 

I think mutual exclusion is still maintained.

> In fact, I can see the relationship between the commit message and the
> changes in rproc_attach_recovery() and rproc_detach(), but I'm not sure
> why you need to change rproc_boot_recovery() and
> rproc_trigger_recovery(). Perhaps you're just missing some explanation
> in the commit message?
> 

Here, I am refactoring how lock is used and that is why I have to modify
rproc_trigger_recovery() and rproc_boot_recovery().

Before:

rproc_trigger_recovery() -> lock() -> __rproc_detach() /
rproc_boot_recovery() -> unlock()

Now, __rproc_detach is replaced with rproc_detach(), which already has
mutual exclusion implemented within the call.

After:

1) for attach recovery
rproc_trigger_recovery() -> rproc_attach_recovery() -> rproc_detach() ->
lock() -> ... -> unlock() -> rproc_boot() -> lock() ... -> unlock()

2) To call rproc_attach_recovery() and rproc_boot_recovery() in the same
manner, I modified rproc_boot_recovery() and introduced mutual exclusion
around it.

If you prefer, I can add commit message explaining this change. This is
only refactoring of the code and no new feature though.
Let me know if something is still missing in the implementation or in
the above explanation.

Thank You,
Tanmay

> Regards,
> Bjorn
> 
>>  	else
>> -		ret = rproc_boot_recovery(rproc);
>> -
>> -unlock_mutex:
>> -	mutex_unlock(&rproc->lock);
>> -	return ret;
>> +		return rproc_boot_recovery(rproc);
>>  }
>>  
>>  /**
>> @@ -2057,7 +2050,7 @@ int rproc_detach(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> -	if (rproc->state != RPROC_ATTACHED) {
>> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>>  		ret = -EINVAL;
>>  		goto out;
>>  	}
>> -- 
>> 2.34.1
>>

