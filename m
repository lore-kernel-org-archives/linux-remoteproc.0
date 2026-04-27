Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79536348883;
	Mon, 27 Apr 2026 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306541; cv=fail; b=VUTgt5hPf+osrjrm56X9h1kvlLQQ3cXRtMS0s5CygmacsT4w++97a+CI7Nuhy+MvDqqK7bqVlkqvXi8gpm5PO/SQ8NfiSS4bkKDUSM3J+sQyqGWtNvqILFCUBj8dqFOZJUERJkS5WQ27/vflfjWwlRBtuF1FVOqdWm4RPgIgqbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306541; c=relaxed/simple;
	bh=aJ7TGCD1flx7G4iOPAqdQhh3R2kLw8HQ7T5BrndEHEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Iu3mkW/Z7IpNbYm/nGrY/NyYGZOMCOBS+j0Y70iu9hCDvVoOT/PYbShyeu3oeC3miPAkcmLBkLopCoT95zQgKt/HFBtrfIjBvEQBMh/c8Q9QRhvySifhbryBJgc1VrHY793cdEOqOTwvhlZP9LQASFhdiP9JKqFXUm+AaA0DUYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ZuJSvae; arc=fail smtp.client-ip=52.101.46.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ZuJSvae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC7qdbPmV9Sm9ZquGZ3T7Z5z5M2LXE1EPFhGP0D0KMj372CTINxm4VdT8q0319BmBc3F7nUsIZX5evYjo5VaWCR61ZrfWvblLOW1HlRw9Rl+8gq17p6aDfvpaBPqEMDM1Iu1307/4hY80O5TNbUUpanC+qxO2Lb8hsttMNT7LJvf+7nVfAqkPiJsXKQ01Z1Fh8DLsDnPyz7Zh3WQD5mvWoGPG+K/DfRtOI+KA+OYsxnucKu8Y15fu8mWx24piV1RtwwH+U00w6ajifhscXQsZneq5ml6+HRyGZzI5RoEUYgBtGCiQQlrZojIaY97hTjDTm1UfVsOkgjHb+G523A+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CrMUmnqpA6qYd53knC2tE/ROKR1g8jDKutC6tbCbew=;
 b=ZXDHMTn19OZuZQG+30KXRn26RjRAXyTUUPJTDCT7+ZgOR63FGGLPQY4h62zFyCxMQElu46Xr9tQq2P208G0ir5/G6mtGEHP7eDNNoZ2WHKrnjPUjp1xbW9ZHYwgAX1wd9FdHg8SZdr4+x1GIjKkUDr1IWWYVt+lXXD+D7Ofg2nM9vSnipnAYNSe6sEGHTquf0VU3cWdXURI/wybvbjRf/UC1KekWm4wPXxDyEi9PD3hLD5AMl6JGpbNibizT4h2zcBDf1JpgCqOLlX3xa/NkDAraGPA7fz0Wv3+Hu37TiY9gADSSnehXO5VjD8zwWGzm/SxG7kgR6gfpBEA/BLatUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CrMUmnqpA6qYd53knC2tE/ROKR1g8jDKutC6tbCbew=;
 b=3ZuJSvaeZjwS03S8gza3FtnP7koO0qksBpAaAK8pYH6jahVkPL+cfWubxFWML4d3N03SBYRBW5CqctOalRQXHMPaaic9Q5e4FKS0phqV8Gn6bZKs4Ybpv4Ig3Un5jCk44BqHaCdgwp8R4+PhNzDWeCgw/TmY99y3oKgYs7cMhjU=
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by IA1PR12MB6577.namprd12.prod.outlook.com (2603:10b6:208:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 16:15:31 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::99) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 16:15:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 11:15:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 11:15:30 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 11:15:29 -0500
Message-ID: <5aabddce-eeee-43de-be30-115bc58040dc@amd.com>
Date: Mon, 27 Apr 2026 11:15:29 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: check remote node state
To: "Padhi, Beleswar" <b-padhi@ti.com>, Tanmay Shah <tanmay.shah@amd.com>,
	<michal.simek@amd.com>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260425030231.3145225-1-tanmay.shah@amd.com>
 <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA1PR12MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e03a47-fef6-4512-f052-08dea478342c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZYnbxdS7LOLlN70KNpW8XzBU89w4js0uuibLi4jhc8lBVmi8qzM+NBdLZVJlf2kEEBQBaIgpPXPMEXqSQwpk6eiat3161cJVMx6Ho6FL17mm75tfk0rQMZfbJJZUqSfOB8KrmYJxiM7a/A01PQVOrEFMvmyI9mzwSTcUtUamycf2H/s9qRx0zA3gSrGo3GTSUeraw07D1j5j5jjg9VbNymaYZJ8ibyWxa4hVAdUo1aFM/79gok3fNl5sGq8NeVAoZGWDXo8DQC14LLKXDGucOYhv4b0rrp8BjR86//FhbXTeotHcTzNL76n3kmD8aCgyQDpvIrd5EzyKkXcUbJUM80yf8ZuBc9iuutagf9FQu/Wh4iYTWpgyS8SGQkgWP3giO4/1l7sI5BZ+CiORf4N4jDTVOMbUELaIRPvEMtqrx3XBzaQ7sNY9nBt9Yv3dk46zEnDelTExLXhjVf6URYpwFDZxVd8wO+G7lOnA0FcC8AYBlfuCOKGAuqPEXi3XbHGZD0eyHsMBaErBfQ65AELdwKXH/kYDZx+uX3wRMn2m8LTTCou9dtwowgVC3Bmn+Lci24ruaDwZ8nZnTKle7AIKy5WYFnBg8xm1UPj/6o23pxQXcNADLyqLzhycMC/pbPQRQ7vcOybsM8m7y+ACPtpJWyz3U5q00ntOwf9XVK83YL8RsmHAHFyMqgRObKdscCgV67rzzmazCQMu3NUJWAi3alcOQAymti2BWIwtjn3D4m0WU9JkBQmz2kcH7iCXYM0szBRpLuhBcqP0FEwOFy+N5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FNyJXdLTcItQ+YiwoRao8mfxXH1cphA7zNKeI4JGNe0fdcOxgyQzvpyxeJMm8MLW6MCAtjpG2h6Eda/wf6zZC/qrPmmASFh3+qVYCMOcVuIlG8dwFNSo+OoOoj8u2ES7SkRCm3zHQTDfZUD45L1XJCWMOQ5fvc2LrLJaOjNwBE6tShQHLgFJKokCOYmjNraIGk4GHDAr7f7VYmOEVZ+Uxv5S8gytME0sQgFnBG7Z7dre7IZ0QrIFKUmc8Xdriravwnc4w2TClpqL8TrQq4aKWgNHr/kEAQFj2XiR8puk1YhWICewDwtIf3Xdt6H42kNFSy1Zg6SlSTR2y6oy0yz6VkzbTl3uG95jjPrjUdCViPom/wKNZ4KmsK1O+D+Reavoavlj1Srj0yeTnTnnnwi5Ezx3y0MZYi2EEF+bIoYO8jROXuPimBAlvWvZm2RTEqSp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:15:31.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e03a47-fef6-4512-f052-08dea478342c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6577

Hello Beleswar,

Thanks for reviews. Please find my answer below:

On 4/24/2026 10:51 PM, Padhi, Beleswar wrote:
> Hi Tanmay,
> 
> In $subject-line, s/remote node/remoteproc
> 

Ack. 'node' is platform management firmware term, which might not be
right here. subject line already contains remoteproc so no need to have
it again. Instead, will replace 'node' with 'core'. new subject:

remoteproc: xlnx: check remote core state.

> On 4/25/2026 8:32 AM, Tanmay Shah wrote:
>> The remote state is set to RPROC_DETACHED if the resource table is found
>> in the memory. However, this can be wrong if the remote is not started,
>> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
>> to the firmware to request the state of the RPU node. If the RPU is
>> actually out of reset and running, only then move the remote state to
>> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> 
> 
> This is a good additional check. However, one thing to note is
> remoteproc core
> framework will load the firmware if the state is set to RPROC_OFFLINE. This
> will override the existing firmware in the memory, I hope that is not
> fatal for
> your usecase?
> 

That is expected. If remote core is 'offline' during driver probe then
any firmware already in the memory becomes irrelevant and new firmware
can be loaded.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++++++
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 37 ++++++++++++++++++-------
>>   include/linux/firmware/xlnx-zynqmp.h    | 21 ++++++++++++++
>>   3 files changed, 76 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
>> xilinx/zynqmp.c
>> index fbe8510f4927..af838b2dc327 100644
>> --- a/drivers/firmware/xilinx/zynqmp.c
>> +++ b/drivers/firmware/xilinx/zynqmp.c
>> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node,
>> u32 *const status,
>>   }
>>   EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
>>   +/**
>> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's
>> current power state
>> + * @node:        ID of the RPU component or sub-system in question
>> + * @status:        Current operating state of the requested RPU node.
>> + * @requirements:    Current requirements asserted on the RPU node.
>> + * @usage:        Usage information, used for RPU slave nodes only:
>> + *            PM_USAGE_NO_MASTER    - No master is currently using
>> + *                          the node
>> + *            PM_USAGE_CURRENT_MASTER    - Only requesting master is
>> + *                          currently using the node
>> + *            PM_USAGE_OTHER_MASTER    - Only other masters are
>> + *                          currently using the node
>> + *            PM_USAGE_BOTH_MASTERS    - Both the current and at least
>> + *                          one other master is currently
>> + *                          using the node
>> + *
>> + * Return:        Returns status, either success or error+reason
>> + */
>> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
>> +                  u32 *const requirements, u32 *const usage)
>> +{
>> +    if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
>> +        return -EOPNOTSUPP;
>> +
>> +    return zynqmp_pm_get_node_status(node, status, requirements, usage);
>> +}
>> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
>> +
>>   /**
>>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or
>> subsystem to
>>    *             be powered down forcefully
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/
>> remoteproc/xlnx_r5_remoteproc.c
>> index 50a9974f3202..e2f25d94177d 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core
>> *zynqmp_r5_add_rproc_core(struct device *cdev)
>>           goto free_rproc;
>>       }
>>   -    /*
>> -     * If firmware is already available in the memory then move rproc
>> state
>> -     * to DETACHED. Firmware can be preloaded via debugger or by any
>> other
>> -     * agent (processors) in the system.
>> -     * If firmware isn't available in the memory and resource table
>> isn't
>> -     * found, then rproc state remains OFFLINE.
>> -     */
>> -    if (!zynqmp_r5_get_rsc_table_va(r5_core))
>> -        r5_rproc->state = RPROC_DETACHED;
>> -
>>       r5_core->rproc = r5_rproc;
>>       return r5_core;
>>   @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct
>> zynqmp_r5_cluster *cluster,
>>   {
>>       struct device *dev = cluster->dev;
>>       struct zynqmp_r5_core *r5_core;
>> +    u32 req, usage, status;
>>       int ret = -EINVAL, i;
>>         r5_core = cluster->r5_cores[0];
>> @@ -1255,6 +1246,32 @@ static int zynqmp_r5_core_init(struct
>> zynqmp_r5_cluster *cluster,
>>           ret = zynqmp_r5_get_sram_banks(r5_core);
>>           if (ret)
>>               return ret;
>> +
>> +        /*
>> +         * It is possible that firmware is loaded into the memory, but
>> +         * RPU (remote) is not running. In such case, RPU state will be
>> +         * moved to RPROC_DETACHED wrongfully. To avoid it first make
>> +         * sure RPU is power-on and out of reset before parsing for the
>> +         * resource table.
>> +         */
>> +        ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
>> +                            &status, &req, &usage);
>> +        if (ret) {
>> +            dev_warn(r5_core->dev,
>> +                 "failed to get rpu node status, err %d\n", ret);
>> +            continue;
>> +        }
>> +
>> +        /*
>> +         * If RPU state is power on and out of reset i.e. running, then
>> +         * assign RPROC_DETACHED state. If the RPU is not out of reset
>> +         * then do not attempt to attach to the remote processor.
>> +         */
>> +        if (status == PM_NODE_RUNNING) {
>> +            if (zynqmp_r5_get_rsc_table_va(r5_core))
>> +                dev_dbg(r5_core->dev, "rsc tbl not found\n");
> 
> 
> Do you still want to set state = RPROC_DETACHED if resource table is not
> found in the
> memory?
> 

Yes. Not all the firmware that is running on remote core is expected to
have the resource table. The firmware might not use RPMsg at all, and in
that case resource table becomes irrelevant. However, we still need to
make sure that running core is not reported as offline.

Thanks.

> Thanks,
> Beleswar
> 
>> +            r5_core->rproc->state = RPROC_DETACHED;
>> +        }
>>       }
>>         return 0;
>> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/
>> firmware/xlnx-zynqmp.h
>> index d70dcd462b44..7e27b0f7bf7e 100644
>> --- a/include/linux/firmware/xlnx-zynqmp.h
>> +++ b/include/linux/firmware/xlnx-zynqmp.h
>> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>>       GEM_CONFIG_FIXED = 2,
>>   };
>>   +/**
>> + * enum pm_node_status - Device node status provided by xilpm fw
>> + * @PM_NODE_UNUSED: Device is not used
>> + * @PM_NODE_RUNNING: Device is power-on and out of reset
>> + * @PM_NODE_HALT: Device is power-on but in the reset state
>> + */
>> +enum pm_node_status {
>> +    PM_NODE_UNUSED = 0,
>> +    PM_NODE_RUNNING = 1,
>> +    PM_NODE_HALT = 12,
>> +};
>> +
>>   /**
>>    * struct zynqmp_pm_query_data - PM query data
>>    * @qid:    query ID
>> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum
>> rpu_oper_mode rpu_mode);
>>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>>                     u32 *const requirements, u32 *const usage);
>> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
>> +                  u32 *const requirements, u32 *const usage);
>>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config,
>> u32 value);
>>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>>                    u32 value);
>> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const
>> u32 node, u32 *const status,
>>       return -ENODEV;
>>   }
>>   +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32
>> *const status,
>> +                        u32 *const requirements,
>> +                        u32 *const usage)
>> +{
>> +    return -ENODEV;
>> +}
>> +
>>   static inline int zynqmp_pm_set_sd_config(u32 node,
>>                         enum pm_sd_config_type config,
>>                         u32 value)
>>
>> base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2

