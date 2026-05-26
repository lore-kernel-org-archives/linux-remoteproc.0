Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E3538CFE7;
	Tue, 26 May 2026 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812829; cv=fail; b=POnpVLA4vlXl+9VEz0sOaWI9MGK1s8K9nANbWIUTtOWgeFKaOIN1uyt4FJu95itnEWGRgw38JxjtRUse0aL+75pAbRF9bmsgYErfFTCO7oVN5yaciyfgSUwqX9cs6Kv5rbTuORey4z8hjEM1a5MB/0aK36KSTOUbrNoMvnD9SNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812829; c=relaxed/simple;
	bh=C9D/T9mUAIhL/TndfaI5/2SHq/vZZZlQjvnVG9kQxvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ubcxTd6kIr7nhUAn8dy8qr2ma2cM6NidvRUiCn7FFybf1gqNG1xfGL/IZdh45EEVOQldsf51Hb0wxaYdu5O2dTuwWh6snjn/CQQpIJmZEfxqBPz5TrgFPow8k3LZLxcxKDQHsPYzEE2ngUpKGyHnCMUk8E3k+jtgJOfpJq0hUwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IMxoq8Md; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IMxoq8Md"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyuj5ammKjhfFAHccQ0zYfh1FhSUbjizmjpeSRQ0pojUvVlq3fuGAvC+INQcPKmovwQZ4ceHXSsLewSwBYzT7QfoD4CLiZDAbsFGBrN9luiZRnZN44+1DS0CXw8Bf8c/FikVp2NFSI155GsA0pJSKwfsPc5vSiTSeBs2+F+DcpXv4bQJMxPNt+EDWc2BoA5cN0gXaLcWN9bIQWMy5qxyOKIzXMkvksgjTyTaH9qB/qxJLwecdm1fIenYsQ8MS7CRV7ds+G3Mh7juplyS7mg9DksK6HvfcGkQISxqKEe0gBDEaB4yWw7yNszA8sU/tpzdYhfwZ3uNXimeXlEbLKcMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNH8mNCvT7Y84f1KPvVx2XqYYHFbe+NoCD6Ic0qm/HI=;
 b=cAM1MK1YFc2MMoCkZ8FN7LOxpKEdwD37kSbjOl54/0h0LsWMy2Lr98Zo2iN+GoNsV5MEUvxhXKyg8AJ+I4+5vYqx7yFkdcnzBaeynTuYfW5Set1AISZ66yiKfM8XIdyjj+O3S61QOMZ2eZuIfghkyZcN3H0M5mALXPsHJSawZIt2uowOnLxfM91PVx8e3QhnKWS/zQkd8oiWjWP2zzU57YPZSrmOPQNURIRgLR0/XBnM5/Bqic4Xz4+qTyLBiKRBxZlMeE3ChaQ6qsI5exvu1h4tO00iZ2mx8dxsF5T3f5ONCtTHVbhnmcRlUZyDLgFLd8BWO7AexvPvuGoOIkq0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNH8mNCvT7Y84f1KPvVx2XqYYHFbe+NoCD6Ic0qm/HI=;
 b=IMxoq8MdZEbWlLMBJ9/4K6gADq4vWYxOvsxm7+mT3Z9R1HOxS7tge69UAejmzRXGsgkNp9mHjX3YtOD1EqRb58e8w9evZYS7MLH+cpiSAJjKj7tm0mBHaweRl39yMaWC9edTPSTHo+pP8rDUOZ/7Sgich40bV410czumKh3bNAs=
Received: from BYAPR21CA0007.namprd21.prod.outlook.com (2603:10b6:a03:114::17)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 16:27:03 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::7f) by BYAPR21CA0007.outlook.office365.com
 (2603:10b6:a03:114::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.3 via Frontend Transport; Tue, 26
 May 2026 16:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 16:27:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 11:27:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 11:27:02 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 11:27:01 -0500
Message-ID: <55312255-df5a-4bbd-8088-857f73949098@amd.com>
Date: Tue, 26 May 2026 11:27:01 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: remove binding header dependency
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508174006.3783082-1-tanmay.shah@amd.com>
 <ahWy2AxRwWYwg9o1@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ahWy2AxRwWYwg9o1@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DS7PR12MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1318db-24b1-4919-4d85-08debb439ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|13003099007|18002099003|22082099003|56012099006|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	R1syoC37+rUpogqQM4w16miVm09HGb56g4ZseAuB3MFFm1jUcONt6TjFS4i+4OXIUprafAd4uZLkdHTFj8ORUO+aXxjxZWT03xPB4jb0W8Jmnt0c1uLA+ZId/+dWLvRHTqHZ3EIn8112i+uTcAuguewkoM1wwL66PfRFg0u9k6IIPCHRxHwo+GBEgVxvbh52y9Aip0SLyWhfGRHIQcn1CQe8MM0vnmRuF8I2/xUJFweWrDcEQtpycS05KFiOkTRqbzFnSP74Q6sP11OuZu3cs7GZJWWLfg+csON9eGIgMPr4CRtpcm02KQIS2MEmTtL62LX/fYYkkmy/tkjgvM2bOWX9uGGQPNlrvFG6b18Sb35NyGx0edegePNGVPqNncdyJiYKbWGE+c73ISWVNYPXWYQz66f3NlPeu6to60iw6onJraqZRHKUntZpb8m436FnAZn9qAFNgI59vwfeJK9qfLXwPJNU59QpNIl8Wjd0IorU6lr0tH7TYm8ydSjJ2n/7D54820Ht7TAOHb2eZP7WMM2iNu6Gxk5TiL0EPA4iwB2QBu8MdY/HaHxeyrdOrxinipFDAVZNRDyJEPl5WEEPgpuVNaQPHAUf9la5NnG0yNKjPts5VUo3yRDldNQKMcjhOpiaKOPJfsF/Ga7lpTjDkQuhM2GFf8T0ZXEurWlUobevYslEIB0yJBi1/Lyzov4VgU0n8sajZp5scY+v1ddEsOox7iqlIh5ER/h4FRQ9PlI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(18002099003)(22082099003)(56012099006)(4143699003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7x/Cz97vUGhgh9Jox+mTjVm9D2qDpaV10nQ+8GmdHHxq4k2w9ohritI4Dk2ojwujuzMtysNHYOpV4mZ/jBG609A6uzjQDs+mZsht2R8bNn2n85FijSRoVpd6V4ARZYHbZ16LaFIHznbn9llrQWXqZ/SLK/a83u+kK0S9MBrC+b8sgUw7n0n3mmvkS+mDQ6iwG/sOqsOqt1lSmnHKB3gl3tyIKQK4PagGZM5/nIr2XbrJAdwI5l+tXidDUMm9dPGjBqwkyW9TGuhBSf3VIdpRyYYO10zCuZ6ehLABJXp4jressvSxrpMTgYvEO/d0WPUMYz4ta0W5hYdLD8NO8SQW+lhKEsUQeLVfaamIL/M4fAJDztbVTTsyWvM9TnmWXSqmifn0D0aWjEtS6DncNwZEZ2psEdpL4CvIZzcp9AnwMVbiQV/qinA/H6DgV5FevxUq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:27:03.3357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1318db-24b1-4919-4d85-08debb439ec6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006



On 5/26/2026 9:48 AM, Mathieu Poirier wrote:
> On Fri, May 08, 2026 at 10:40:06AM -0700, Tanmay Shah wrote:
>> Bindings can be deprecated and driver should not include bindings
>> headers directly. Instead define needed constants in the driver.
>>
> 
> Is there an official directive about not including bindings in drivers?  To me
> it seems advantageous to have a focal point for the definition of constants,
> guaranteeing eveyone uses the same values.
>  

This is what I found from here:
https://docs.kernel.org/process/maintainer-soc.html

2.3.2. Driver Branch Dependencies

"Avoid defining custom macros in include/dt-bindings/ for hardware
constants that can be derived from a datasheet -- binding macros in
header files should only be used as a last resort if there is no natural
way to define a binding"

Also, bindings can be deprecated, so if the current binding gets
deprecated, the header file can be removed from the include/dt-bindings.

>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 45a62cb98072..f5b736fa3cb4 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -4,7 +4,6 @@
>>   *
>>   */
>>  
>> -#include <dt-bindings/power/xlnx-zynqmp-power.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/firmware/xlnx-zynqmp.h>
>>  #include <linux/kernel.h>
>> @@ -19,6 +18,11 @@
>>  
>>  #include "remoteproc_internal.h"
>>  
>> +#define		PD_R5_0_ATCM	15
>> +#define		PD_R5_0_BTCM	16
>> +#define		PD_R5_1_ATCM	17
>> +#define		PD_R5_1_BTCM	18
>> +
>>  /* IPI buffer MAX length */
>>  #define IPI_BUF_LEN_MAX	32U
>>  
>>
>> base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd
>> -- 
>> 2.34.1
>>

