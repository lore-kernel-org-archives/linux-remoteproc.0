Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C831E825;
	Mon, 27 Apr 2026 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315886; cv=fail; b=qvVDjETUJFvGgx3wDni5RBYSlMzTvRfQpOL3j63MeZIAiMG/62xH3u/QmGbtgYHsbnhjJh6neNfgeQzISU57DGpXJHjmsBTPB9etq6h/4V2O/+gB6sJUNT0f1tzPJEtD55J7rCw3095DeQbtPRHKZg/LamnpGB2LRTBuaLsxdlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315886; c=relaxed/simple;
	bh=7I+yur4PtLttS2kSgfXYEUQ+RWpakv0xbyQZ4YPeRZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FwFSLl7FV8UjQmJGmdcQrUScHItVXForb37PP/vK5n3vuqINOQ0HPW0cIwCdoNHCp2nPCzL6G4o7bB3/hh75nkHCA/mL4BBOyq6i3JgAqpKjMXwt5lrIF0Xls7kpBWW4MOMWGciII+uayKZzYyAp30PRy/cpURI+LW9MzMVajxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I4PgW2Cp; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I4PgW2Cp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ecim7HMpu6re722q0ykIN2NLSnHzX5y9m1cQZJzCc8HuDoABrQKhncTB3GoSysy5pS3uDnht7iPDbdeH2f6yPSTQRWT2k3h89gW9EjzbUpGGUnqiv8uXbJ7XrD1nG8pBassqdUeNlT3jh7Bf3Hj46mHob1NbSxm0IIWzrGTywl7dKbxkfot8J4fkshyik4HlnIgRQhylwCxSqkowqi5joMoyiAGONw3fbxJRcu2e2y/bJdfC567cn6R9xZAgrP+Dj9ccbaJtP+w7JWBeclcN9cnzLJsqlz4kISMaOxQnNgMDAXFw2CCLf93UOZ7KqX+LzerHzfW/ghnWdMwKQLeCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6sfoFAvfWB9EagW7iFTogcH7jnzQzJq4Ms7jXRzikU=;
 b=Qras3xA4Kg87AHjKTD+lxxamnry7XQqFm7uK0ZCOAnSdxltrRARSK4+KQz8WWRfdCqW+gDguJ2bdAYpfVQyJ/Yjbx1brgXB17RIc4plejY0t7PAHXsN6RYepDU21f2v7Pi1HstDU+kP3yxQmKhyLvkWU+Rg+qkG0j4EqrQDjyWjV248DGJolwIwV+HM8ZM5faMC5NImAe5eQ7jlPI4gTnMn/k42pNoknaqp5SMk7JlTn45ENkVMyw74Z+CRBysON53hX1y4tEplJi86CQ/QoWmNiydmixUDa1GetjJENIR+Tfwuz9GIUYUYl7alZ6n9xaOX9hb+lRXZRkHkIuls9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6sfoFAvfWB9EagW7iFTogcH7jnzQzJq4Ms7jXRzikU=;
 b=I4PgW2CpaQjACI4DXJm4tgusPmGdg0JOtsKvjeHv9RDKjcM8ikMrmbMtkfd58nI5tEa6lPcuz5DomAlOOSqyq6mOwsWuKBQMdYTndUpzxrVMnowleBr+X0HYEkqyygs6VV+9Qjesn3CdcSq6sI+RT2Et8cYOxoDttG8pgT1Xinc=
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 18:51:15 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::19) by BY5PR04CA0017.outlook.office365.com
 (2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 18:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 18:51:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 13:51:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 13:51:13 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 13:51:13 -0500
Message-ID: <00a41c39-81b1-4f7b-8681-8bf0dd59918a@amd.com>
Date: Mon, 27 Apr 2026 13:51:12 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: check remote node state
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: "Padhi, Beleswar" <b-padhi@ti.com>, <michal.simek@amd.com>,
	<andersson@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260425030231.3145225-1-tanmay.shah@amd.com>
 <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
 <5aabddce-eeee-43de-be30-115bc58040dc@amd.com> <ae-iTAk0KvtPvMSB@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ae-iTAk0KvtPvMSB@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: aaabb21d-aa2c-4b4d-f676-08dea48df5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MYW6edxpTKXfdY61fgP7hXW5RZOgA0f2g2/IQtwDJwGB5od/QiayHHYXoMWRLtutGO0Y6R09Ay0I7Q+IoxDmfQzaTQ9EaduiVgW9kgZjdI2ACyMlMkQ32i+yjOk/zmlT7ncDbQJclKFp1AJgq+mennxDTZG7ES+OTueMtZibBOSBprCW/1j5qXHqVf93PuvC4MzKN498ozWsNV7wAUz7hnmR0nmmks3ypTxiwdEQhfWb7+dbgs0s8tK6FXZLLXCQC9Fcm0xGgkQGb0I8hh3OD+kjak1VS39ruTwHIn4YmJo7S/3+oM7FyeM6FskQYyvwm+4Eap6oiVLbUbvdNFGyMEOAW9akKfeAhXmrNV5ZUgqVBEflCcgGSobuudsW5/Qf3nNLejrmVt5Eih1ggveVSj7Y5n1c5xrZQhAZYM2BX6KsdwXO45L/NMZLnCIh2EnxftcGLTZtvYA96yV1lyw3L/JTVB5eaiizsLF9X2SBvAsTVnCqTf5e0Cu2hvdQwseDH7OP7F+tHQ5B052eK7MraOENFapjwKJTYTTeM3J+x/uHVCYkDQpGadfx+qb2sZpkoQDgUxwyXf47MQ7PBCM0x5Fj1JT1481LhepAkZ71n7wcdpTENIGstDHxPUrhRADgrTVLyin+tAMYuQ/pvpJMdUsxYOIifiDFWDbG67OMnijDp0fVRqL9HdKzsL+vFj8pwHbI9d307JhAq+pzpcCnUV8vAMTzLGRTNkeF0MoGfK2PC18JgG8Y07BomQg2S90lkOotcPSgJP3/+RZRGlTDlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ETLYBRP0JU0yVNi460uLgnpYE52F4K5wd8w8ktzW6cvdxGHHA3d9HIzsxS5IgpkdaqZt17FWogfAT2TTw5Cg3HZjwjOiXy+dxRzRLmydkQUzeF17AxVHaWPT1ddyt9K9FBXWu3HRCTnwUJhoDMU7yWWpO/JRwIgPbDV4UbKkNt4A7pT3DdBPYwerXoeY9vBoIXQJWT3vgjfvGNacTa/wD6Ei/zl5vvfK8cOM0dFLS33K31vU5tsFDyOWWKfVI9KjP3ZW4j0DJzAMHOE/wp18mJUJr6/P3/G4x6Q8aZnWUL9Hq7r6x0a0FU323xTcKgCuKOXbk5aqUShhMfroIec1dsQnZ0elvkJtY5z9SaqDGA/Pf9B6MeZaQ0D68C0urmA8p639fFkRlb6q9ZVA4Djxb7quR/4m1CY0by/XA28+mQKAZZN7jyd9ofAkoupDrM6s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 18:51:15.0252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaabb21d-aa2c-4b4d-f676-08dea48df5a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956



On 4/27/2026 12:52 PM, Mathieu Poirier wrote:
> Good morning
> 
> On Mon, Apr 27, 2026 at 11:15:29AM -0500, Shah, Tanmay wrote:
>> Hello Beleswar,
>>
>> Thanks for reviews. Please find my answer below:
>>
>> On 4/24/2026 10:51 PM, Padhi, Beleswar wrote:
>>> Hi Tanmay,
>>>
>>> In $subject-line, s/remote node/remoteproc
>>>
>>
>> Ack. 'node' is platform management firmware term, which might not be
>> right here. subject line already contains remoteproc so no need to have
>> it again. Instead, will replace 'node' with 'core'. new subject:
>>
>> remoteproc: xlnx: check remote core state.
>>
> 
> Much better.
>  
>>> On 4/25/2026 8:32 AM, Tanmay Shah wrote:
>>>> The remote state is set to RPROC_DETACHED if the resource table is found
>>>> in the memory. However, this can be wrong if the remote is not started,
>>>> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
>>>> to the firmware to request the state of the RPU node. If the RPU is
>>>> actually out of reset and running, only then move the remote state to
>>>> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
>>>
>>>
>>> This is a good additional check. However, one thing to note is

[...]

>>>> +
>>>> +        /*
>>>> +         * If RPU state is power on and out of reset i.e. running, then
>>>> +         * assign RPROC_DETACHED state. If the RPU is not out of reset
>>>> +         * then do not attempt to attach to the remote processor.
>>>> +         */
>>>> +        if (status == PM_NODE_RUNNING) {
>>>> +            if (zynqmp_r5_get_rsc_table_va(r5_core))
>>>> +                dev_dbg(r5_core->dev, "rsc tbl not found\n");
>>>
>>>
>>> Do you still want to set state = RPROC_DETACHED if resource table is not
>>> found in the
>>> memory?
>>>
>>
>> Yes. Not all the firmware that is running on remote core is expected to
>> have the resource table. The firmware might not use RPMsg at all, and in
>> that case resource table becomes irrelevant. However, we still need to
>> make sure that running core is not reported as offline.
> 
> Please add the above explanation to the inlined comment.  Otherwise I'm good
> with this patch but I'll need an RB from Michael before moving forward.  
> 

Ack.

> Do you see this as a bug fix?  Is there a point adding this patch to the stable
> kernels?
> 

That's a good point. I should add Fixes tag as well, for the commit that
introduced attach-detach feature.

I will do that in v2.

Thanks,
Tanmay

>>
>> Thanks.
>>
>>> Thanks,
>>> Beleswar
>>>
>>>> +            r5_core->rproc->state = RPROC_DETACHED;
>>>> +        }
>>>>       }
>>>>         return 0;
>>>> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/
>>>> firmware/xlnx-zynqmp.h
>>>> index d70dcd462b44..7e27b0f7bf7e 100644
>>>> --- a/include/linux/firmware/xlnx-zynqmp.h
>>>> +++ b/include/linux/firmware/xlnx-zynqmp.h
>>>> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>>>>       GEM_CONFIG_FIXED = 2,
>>>>   };
>>>>   +/**
>>>> + * enum pm_node_status - Device node status provided by xilpm fw
>>>> + * @PM_NODE_UNUSED: Device is not used
>>>> + * @PM_NODE_RUNNING: Device is power-on and out of reset
>>>> + * @PM_NODE_HALT: Device is power-on but in the reset state
>>>> + */
>>>> +enum pm_node_status {
>>>> +    PM_NODE_UNUSED = 0,
>>>> +    PM_NODE_RUNNING = 1,
>>>> +    PM_NODE_HALT = 12,
>>>> +};
>>>> +
>>>>   /**
>>>>    * struct zynqmp_pm_query_data - PM query data
>>>>    * @qid:    query ID
>>>> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum
>>>> rpu_oper_mode rpu_mode);
>>>>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>>>>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>>>>                     u32 *const requirements, u32 *const usage);
>>>> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
>>>> +                  u32 *const requirements, u32 *const usage);
>>>>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config,
>>>> u32 value);
>>>>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>>>>                    u32 value);
>>>> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const
>>>> u32 node, u32 *const status,
>>>>       return -ENODEV;
>>>>   }
>>>>   +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32
>>>> *const status,
>>>> +                        u32 *const requirements,
>>>> +                        u32 *const usage)
>>>> +{
>>>> +    return -ENODEV;
>>>> +}
>>>> +
>>>>   static inline int zynqmp_pm_set_sd_config(u32 node,
>>>>                         enum pm_sd_config_type config,
>>>>                         u32 value)
>>>>
>>>> base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2
>>

