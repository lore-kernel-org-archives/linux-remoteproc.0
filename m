Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB684D90CE;
	Fri, 16 Oct 2026 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159943; cv=fail; b=bmzD6W0lEyGa/HFCcGDgjlJSIuAqtrGJ88QNZbyNOcaJpntJ3+qy9Dfiys+ZF2/PuIhmKxkBINGFxcthUachMr+FI4qFl+2UWc4QCIwFoeC60BM6EEl/z/bxSr3/iq89eQMxMNmo/kHUKdgks4WLJGq/A4WUWADOMJ3w4iKmc3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159943; c=relaxed/simple;
	bh=t6ztNUedVZWP8wvVNhBzRBjLnsuwW9+SqLZBJWDU6lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Iw+/bLm5sAvT7i1QS9xopLmACGny/SB73HLogK0y3RocJiZAHAaU4BKWevAJKov8dbPaL/M3CK5NeLrQJPCKTg0vb+U788ab2cVluOmd//8pyFx9ujYd5ELv8UyLEyGwRnh0QYp5HKqAgjfAR6wVoE29+Kios3nju1Fgk5kHrkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LeJQmFPx; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LeJQmFPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBpd03fSVhEofHNGICaRGJqit/oL0yNpEfMrvMx4F3f3k0JaG6gLj5hz8P14bE98stLPsLrWDpXfxMkEVrUvturwF5EgfK7RD0qmjlFL+49CZQJIUPxFvrdd88/WRuptQUqxlWRhpp2uUfDpjxgrCmr1RXTMmLKRgVuTGH0t3iHWtLCs5QU1LUn5Q/MLHFZ4vAV9eo56sDc+AYcch44IdCbXwUAAMpGyTJShgs+h+oa2GExyrtvgam+KM1S1sghRnqi8I7xHPa+QMFsz03aqH+7tpuw5LoLp7nEjrlsLaKEf9J9QDpFyYqdS8Q0O0dB0m42uDmJTLzWfsPjy2S6kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mi1hfsS+U4PF7+bQSAL/vrygZAW6B+VNoCGU9SbXW4=;
 b=cuobKhMx4By0qXxvyl68AP44Hr/W5m4DlAj7xFzGyUmif3aS9hJcY9ccMiD9nOsLagAHtD8Qm6jCrzAHz7+rwKTLVo0WZ+UvUG6Qpii8vpN0ZzzyrF+bADv6e+KdRYxfx31anWHES0wrKe60L2vdp6tbiv7tknI20li/dmFaQJe0Vf9QUSLktE1yXHEb8d75a7A11dRkXhEFl6tf5bjH7jwpcf6aPaWgdDQEu2wcdV3HRseABRgh50/wppoSUwdgPn/Rxx4a2yJD4Z9k7yy6bZ7nMKwLBNZwQn4Q9j7FqdU4g6BfqfHTpC+jLyOGxGjpVBBr+YtTiNVidBWo2MTn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mi1hfsS+U4PF7+bQSAL/vrygZAW6B+VNoCGU9SbXW4=;
 b=LeJQmFPx18Or8HdE0MfZJezUsVoY8CJV/c7uk7uMyq9DIZDwz9ik5l/6AuHEk82i9M2R7o1NGiXyWOyBgOQi34o8oPheGuysPz3E0Zp7ulPi8Wp7RCTHTy7kA2WXSGnyOJ3YuRwkkDbi5m3Dess0nc9I5GZ8UPjbUu12brLHqDs=
Received: from SJ0PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:33f::34)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 14:12:11 +0000
Received: from SJ1PEPF000037AD.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::6c) by SJ0PR05CA0059.outlook.office365.com
 (2603:10b6:a03:33f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:12:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AD.mail.protection.outlook.com (10.167.244.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:12:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 09:12:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 09:12:02 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 09:12:01 -0500
Message-ID: <d89b656d-44cf-440a-8e06-6e13cef2dbe9@amd.com>
Date: Fri, 16 Oct 2026 09:11:56 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Krzysztof Kozlowski <krzk@kernel.org>, <tanmay.shah@amd.com>, Ben Levinsky
	<blevinsk@amd.com>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"andersson@kernel.org" <andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Levinsky, Ben" <ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
 <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
 <0df4bfd4-2bcc-42fd-a22d-e704e4b41d5f@amd.com>
 <cbd2e370-c8f1-46c1-87a8-fa25fdf6ea97@kernel.org>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <cbd2e370-c8f1-46c1-87a8-fa25fdf6ea97@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AD:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 651e5591-824a-4352-b9a2-08df2b8f788c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|7416014|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ItGHoWxUUDcQogEKhW+2bu8A0AH756yWTaQTOv1S2JVhdnj6sptjz0m80pNAZT8vBaaLtzWxPbe+TtMhinQCv0CkYg0ot26PYk0xTXHgLkWklC0lZroPb5MUg6GbRNh+Aq4BKsOcPfid2xPgHgyS99mPqlFwonP0dN3BTRQS8NMO14p0SfD2E4YpeANaS0b3Rh+OVMtTxPi5jsKKdAFuWvWUi34MA6oCYauu0kNFPdSjfLjVKsDysXsvDm4NEvke1dzjngr/pOLul4J4Udv2byqv69NSTd5YV5+mdfD1y2Y86TleL4O/GJH+UjaTFiV50w8BkL8cJXGlPyjnc1Lvge/d2DUCPyejMkEumP1eu4XBlJzyQPiyupF2ecu9y9nQUzBbAKDIMAAaH56BZCgu3CI3iUM/Bs+zCbSgJjeVH/9MgKMvZs+BfX4/S8WXEHSi8Fdu+oWZP/a1NWp2SUe7eekwnjt8dKtQslmpe7SGwkmHsqJeK0tnmt0Cg0phkhXKaMYMdUN0LOc675IomHRGRifZIllBNJsprpYk2SMvpKBbBW6rTYmwjUqNEnY0gaCYH+6Pvu9GIE3AXc577iP4LabEeopxL1P9PEuLuuQJkJT6wgqaxpkzKNzjqypMUn3NX82+QVExFGPqhHos/zlM2uuC2e0tejWRLY6HH9opwLIVQ3VhBz8ANzyh2G9xqoC34SCfkIsDGo/mQ/Xp1kaVVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(7416014)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YlmFvzw8r5xOv/TI1xjna0QQzKUZgKTwVcrhYAJHHQVkArlMWj6tOMzDJ5B4ZfrqZ6DttA3M37uXuSLAQEAxmPUoAONO6KtZix1WvKFRLYo0dU8peTwvoXJQiAuUfmFSyoei707fNx+FUerNMtF0PEA7PuyBtAuRTtNLmjcCk+zXnJ64q4dbiXHtjv0h/j15zjFK+fyHAHu0kKXQOKdDryeq1pma1J438itLZpTtGLzjsBNk+vsFua2jrQuczUFCc1knfcHjmGh+CfxbLLji8LdzufzOq/uJ41675xBh7yj1p4+ppQS3R/9wnx4o2LFjua8nBdh1d1L2di5c+GW34FzAEM42/e2Fw9urApdf7xmV82A5m/qKwSqzACzCr9jVci4d4LILDgW5TJ//QcDNgwgBQnFR6LNvNhcjMmxWSLvFh1x/gv5b2Sq4M2eBkEZP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:12:11.1423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 651e5591-824a-4352-b9a2-08df2b8f788c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782



On 10/16/2026 8:59 AM, Krzysztof Kozlowski wrote:
> On 15/10/2026 17:31, Shah, Tanmay wrote:
>> We use 'amd' vendor prefix for all new drivers & bindings. Also, there
>> is dedicated IPI hardware which can be used as mailbox too, and we
>> should distinguish it with this PL mailbox. So I that is included in the
>> compatible string. (pl-mbox).
>>
>> If we are also to include SOC name as well (per compatible property
>> guideline), then we should include one of the SOC name as well:
>>
>> So, I think 'amd,zynqmp-pl-mbox-2.1' is good.
>>
>> Krzysztof, are you okay with above name? The 2.1 is FPGA IP design
>> version number and not the SOC version number. So in future let's say
>> that FPGA IP design is improved then the name (pl-mbox) will remain
>> same, but only version number will be updated i.e. (from 2.1 to 3.0). Is
>> it okay if we explicitly mention this in the binding description?
> 
> So you will release the same SoC with different versions of the block?
> 

Yes correct.

> Best regards,
> Krzysztof

