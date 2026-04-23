Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0636CE1C;
	Thu, 23 Apr 2026 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957253; cv=fail; b=GMYnTwSy08rOBNU5u8PsdG7hr+E+8R1mFSpVEHeu7Tzb2HfeGqNLTmcxjvx/4/abF9ajsNNi+bd1++HrTK+iKmEH5V3+TinZun4ZR9prjM5j+0/KF9iklmE5xdJ38w1DAjubC3bmJYMmqqrpFHnxChfuoFPlrKlqa40aTXIEB4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957253; c=relaxed/simple;
	bh=ih3P4KaYqTPdP4o9VDmQWwxOx/yIAJhAGNCED3V8s4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=btHdl40IgMb+Tqt1WBA/lPVJgoWwq0f7F5B7+3/M6m85gAXzKRWlfp0LMJU6vPm+sq3hiQKEJ20bmkEqE9eVzUF9gKU+X+W20OvoTuPvKSC0KR2STC4BPE/ssTYuWGnZMaV1LzmZxt1uTnH0eUhjxK1grv4Ii7nOpwAG5kzT6Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xMou1nw+; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xMou1nw+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDrKiR7bc/ycEnAalcVZy8kGBoCc8738x4SdNFzq54d6xA5K7/aKofFzqK5MZLH9Fv3NhHvUPbnbvJRAQ9oedZPoKxIJEyWkCsdE3qM0DjB/O5pMDPBnA+OeS9aoBOzNVryteqIvyBkF5Hu9KU2K3vN10okqPRmxGrWHBvJ0M0ARerEbHOY4EZ/PrGXqkM8cTJlNJXmDqcB4rfWxocTv6NcjKo25ZZ/yF7v4Qd2EEL6LqUX1XM03vS9Uk7uBu/KxYMtMgU30MQMJNktz7iiW/+WDw2f6BJaTpyqnbvGduVytST611PKKNoM+Rp52aYtAMSCcgJhF3o1Gd0DkuY2mQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgFqisJbK5plmu2+sNt5gCHpwGinZ9d1f4q96wF/4UY=;
 b=vFdcEBIftnFHoZ+BvfZvSi5usMbkLxdx67Y96Lr3kcMDloUPKY0uxk+LFi3zYWG4UpUti1YwDEMJoSEjsUvwV+RDUxGTb+khbAWfHaSc4Ru9wC+VNuNLpysCsdHg63pxgU2mot+B4MGUHyuge7Um9K6LEtRnguRg7Ik1YY1gy7AdxhE+Y7r/vTge78GBXII7y3QU+wYs+5YUNgIfdZEPN6ZG+shAOFSXWfQ55kbDsQLj9Zf8nQl0p+Mj51iFkDOrsJReEIQ2tzYfhMu2LTHWDsWRnSnoe1BaxoBfXEw7k3Yt+U8EPN8bDBFOxLjA782XqRYnHeBxBAZ0yApgjabmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgFqisJbK5plmu2+sNt5gCHpwGinZ9d1f4q96wF/4UY=;
 b=xMou1nw+91FmhpUseoVbqO1tbf0eHOvH2YWiywytoJJURSpVe5mK+4RwDg8qnYt2zzjStE8hb2tjlxyMkHohg4UGGDC/s+MhwolmoNEKta8PLiKH43dTc1oh4hyYSSK0rER6IIb2eMeZx7FpG4/r8j4H+oFcgsmJcxYGl8z74tk=
Received: from BYAPR07CA0040.namprd07.prod.outlook.com (2603:10b6:a03:60::17)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 15:14:03 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::e) by BYAPR07CA0040.outlook.office365.com
 (2603:10b6:a03:60::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 15:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 15:14:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 10:14:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 10:14:01 -0500
Received: from [10.254.48.177] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 23 Apr 2026 10:14:00 -0500
Message-ID: <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
Date: Thu, 23 Apr 2026 10:14:00 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
To: Krzysztof Kozlowski <krzk@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee1687-b144-4ae4-a7d9-08dea14af413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7lghVvaHYMdOEYWb7PYKTBH30wM7ytp+cv2/dIThlMlOlOLF69Pm82O9ERdT+6lw/WUqM0nfLFSvAa95ur+wBuVnWnp2vg3JCqwcOQL9tin8rfYX6Nu4huMCwIsWaySuTxYWl5nB/PTYTDUUlFVnQoVee9CAmbmL8InTxpP9oA/pDB1qp7sfuHTqIofJYsMAgvdBRLK3S/WGj/bvJCMGtfGtRKbrAA36QdLKWOZg+B2k6a/9auH4r5sMHH/VVyx7h9+Zb3pCLCQ2+Jje1kLKHHWS8t66/5f7LjxqHUnGdbD4PUuRFg6gs4RtuCEgy5AtzxYUFCsq6Rp/ejEYUIRLU+oQ/4c+xyCCSZTYjGExRvk/4cmezhQfapVQsMrhjT2m4QMwB0M7rPgGh8fIv+S/JHitYU6DCtuyvpdtzAZq5lgR7F040fdzx3koWRP/fP8w+8UbfFPB5nkm+ppd/HCVhgSBA8EWHylmC9ocRbDeF+R3PsnTSpEG2Ud23qM7WRJlpcuFqRD+MIT7htfEv5FpwBLNCU5Y6XonxB/D2iG7QHOEC0EPAsFlXjwTJLNkx+zvMT1CVnPHde9WHGZZbYNi8Vjy/6OfAYKfaE4uXSC5jplZi8/rE0JU0C4OlTsI0leh+NHRZ6lrE/2d/EOh/v/zeWAK5ckRlyhm/c9l4dyyCeqw75fxNFhRm4cijGo/gkF6iPqvW7k1/rWKBCxGSlomFgQdvvIcsc2zBo+uhl7dI0DD/mwUJeHWuu1cbTPkbucUcitMV/wipjzUvclzgQAXFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6xnnNj5WlWrqH+wUDMWE24/HXLj2Vf8Cj7pg9/Gyojwh2wsNTXfjnn3oMpEYrgwk+94boyT+HgdRSkJOO5nFuyNg8yEeBsoa/tKLoqzQ0yQ2FDeneM5P8E0T0zm7E2WPdqJTzW9g7pCk5IDF/VMFAaIIdPtk0BSuUENAHOZC5bSLqBO3FwutVlseL+zCzetBTB+fHtGKU1IeowrIGUk8QfopOIX8g0afrnxZUEfpeEI/XZCUoXHB7o7I09mfcEB+aa4pPQghcmtJMnqBUxR6MUS8+eJW0Y2flJBlQ2sabRUXg6Lwpulaj4f+TTHdhYzQqFJjz6D2C0YYYSM8fZZz2wZPJ8qSFmrYsa4xPcuDxO2t4hi2FdXjNZBULdBv8CcRf+9lynRyKbMG+B3+OOykvf0YfR6LrqYlTAXngRNMNk+XNMdrGKXR5wDE2844XzxV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 15:14:02.6410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee1687-b144-4ae4-a7d9-08dea14af413
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Hello,

Thanks for reviews. Please see my comments below.

On 4/23/2026 4:09 AM, Krzysztof Kozlowski wrote:
> On Wed, Apr 22, 2026 at 01:25:57PM -0700, Tanmay Shah wrote:
>> Add auto-boot property to notify that remote processor is setup and
>> ready to boot. Linux can attempt to boot or attach to already running
>> remote processor. "firmware-name" property is used to mention default
>> firmware to boot when linux starts the remote processor.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> index ee63c03949c9..0d27260e3baa 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> @@ -135,6 +135,14 @@ patternProperties:
>>            - description: vring1
>>          additionalItems: true
>>  
>> +      auto-boot:
> 
> Last months, I have been asking AMD to follow writing-bindings doc or
> other DT guidelines way too many times.
> 
> Or you just sent us downstream... Do you see anywhere such property?
> What properties do you see? How are they named?
> 

I should have put note about this. Current auto-boot properties are
named like st,auto-boot fsl,auto-boot etc. but nothing vendor specific
there. Can we have a common auto-boot property? Similar to
firmware-name? If we agree to it then what's the correct location? New
file remoteproc.yaml is okay?

>> +        type: boolean
>> +        description: remote core is either already running or ready to boot
> 
> And why is this property of a board?
> 

Not sure what indicates it is? The property is under remoteproc child
device that is SOC level property. Remote core is on same SOC wher linux
core is running.

>> +
>> +      firmware-name:
>> +        maxItems: 1
>> +        description: default firmware to load
> 
> Can you load non-default firmware later? IOW, why adding description
> here, what is special?
> 

The rootfs contains other firmware demos, and it is possible to stop the
default firmware, load other fw elf and re-run the remote core.
I don't have strong preference on the description part, I will remove it
if redundant.

> Best regards,
> Krzysztof
> 

