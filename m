Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3513FADFA;
	Fri,  1 May 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777652150; cv=fail; b=QSXifFvcq8CasTDljrOxfxmISR4eT9CjnrtVD8WLNtv62f4n7vmErVpORz1txu3ty9vEfQe2OJkei8EtV5ApT9hmcfH4SB4P9qgJpnfF/BaBO92/ynuQITQ1izNdruNcdtu2T0sUco8A5xCskgFe6epqS+gfwZYnpq9AIty07mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777652150; c=relaxed/simple;
	bh=3onUDjyrOotlAlwV/v4aU+8YK2cMzGeq+4zW2Sqpr5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jY7FrKmwoG7vLnZsJGq7clOIrvvd2kSe3tt0ZCdb66FvbqmQFXp7hcaAD6Qlk+KvuJtYeBC5TYlyxX6kuDAL5gEQdVL3Mb5IEEnbcM0wXs8GdMKoqXH6K1l+qbXrevxBFtTIix1PZhCO7LLW1OxbbM+owKivodTXUBl5ppxAUrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gkvpWLPO; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gkvpWLPO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ycc6RykrDFCgMJHzbSxJXUPBvUdtA+VTUCWhBgysPgoycFXiS9H2Tz4GHiMioQP4zND3yoyB61c7Xl1KdGtnqCsHGMzxpsy7mRcH2I0cTkgvnGsCTMmd4CUN349LL9A7JMHZTOIPy3RyQXttM4n3NJbxGd5U1inc7plWx2H1SvqePbZyNt/xIuCwHqQa/mjjqIB4ZVdPMxRA7RoGJZskbO09UXob+oq9rAnvhUhd90Tw549YAoeVeCdiFUXuqbr5FPjk49U/QSoDWrGoTilaITbVFBWr6/A+4MvCL+uBdt+T8Q+qpzREQYqRipv1mr3N12Z07m2iqjMcvB2/rFpoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBvpWBk7CMO/WrcxFWTVmdE0LJevmr46Qg0RrG1Rz6U=;
 b=xRPuo49BBAWums+QgHxYaDogdUE5HV8aBC4G8gQqrem9pvmbAqwV3p4D+/oAo29cIZmZCklNVCnYZ7JqRK79GE6/0Ivz6JcoaaYnhGEYouvDsWePRyTOfoWg4f7wrurvwWaEEm5cGDVrC9j8hdywRJq9FVFYY8+ynNP0QLMLiV3+v56xi4qyxi5k24aYAmISssgynyehMJr4c5bJEgPRHT2afvKTugoD+DKUygSJxPyi/ZM3uNDVEszCqeaCyKlnqAkbW7MyN772+QT2gsZx6v76RYYK6lXekujvdgL5aeOD2A9w02RNn7XYJj//MnXB1pVKCuG0gckhwzeIgVSFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBvpWBk7CMO/WrcxFWTVmdE0LJevmr46Qg0RrG1Rz6U=;
 b=gkvpWLPOIyJswp78NQj326YgXwreU+yslREXKIY+mM3b+LrARRmWkEnstMqyX88WosqY9D//i76xcVeMT8CdZAgCj4DM7jAxe1umx6Bsy5rTRxHYL+6LahsUfVPfIXx1ryG97vD/L4rn4utJFh9YDtxDUpRFXZeEq+iI5wCHfHc=
Received: from BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::10)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 16:15:38 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::c) by BY1P220CA0015.outlook.office365.com
 (2603:10b6:a03:5c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 16:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 16:15:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 11:15:36 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 11:15:36 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 11:15:35 -0500
Message-ID: <b6aa8e42-632a-4dfe-9d03-5aee9ea25f11@amd.com>
Date: Fri, 1 May 2026 11:15:36 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
To: Conor Dooley <conor@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
 <20260501-strudel-sample-ded4d3ebf58b@spud>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260501-strudel-sample-ded4d3ebf58b@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4bdd26-05b1-45a5-64ec-08dea79ce1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1Hut0hvdc08CZHqlZFyjM+WtmmBTq/q10xEeMO2QkaeFA/SnIjWx2lWRNJXR572nY502lIdxRC67+MsYFC0ApwNDLxk2zklWyollUK6D0VqsqvBXvZEYrMODLXRiUMOEAHmTfhKCvPbfTdc0H5+bgl+m1uWBkirqc1pBXrrcp6zfwMFLs2BO6M0QLnP7O4pKwsbdEU9o4J0MrP/EKWcY5mB4zWZ/TgCxMf0Qcms1X1djVe3Jbz9Mrg+3AaEW9ROODk39H22WRbxJxHSx04RuZQ8zZJZIEaT+6Q9XB7Cr9xhz2N0Tqlcc+Hug/GvoBD/WO2JTYmrvEhRgVJYn8nMXla9iWsxbmqC/ZA6OhDR22sHTwTXVXPPIqQfYSWRdSN5Fn9sWgP0VhQ55plsXjA7l2HP1TqkRP0WjyA0G/8alW3AWfEp4RlgPJHrpAoMLJm7/6nWo2k5nH5+JZM27F9hrvGEHnD9LAnTzwQdhjvh20yQ3uaL9EGRpDHxcacGfOuBY7Ca7701SBtIwapDf9TPIkqDaR1n8cVOIAOmNz6YSwm9ALsoqooO0bs3RVoGndrmobByPv3mEgLYNg/eKMdcZ41OFjNAJkzNhVX7vINuRW00pxb6UNfApNmmXOS2lWz5+k1Gm8Nqk+tsac95/HQkshYRKRcSAIRc85Xcr1R0CoOVxJ5xLF57z2FMYZFGEnLY+lISZrOAkMEmJmVMMKmvZk2ha76ikUom5vuE7oKnSR3Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gw2UmdgFUGChMpD+cEnszDoLRnlIeEY5X5mK8FrCwaeO5NK0Q09CHkh67jNw2b8B7JGoFVfBOkJ8fsCP9FVfIoapggOwfLbPzUNzcbdFqP1Px7xCwyR7fKobQF2nWaxItC0zVq4BaOpHAW6IfQMJHTepAezHcjxzxU8zh2LwtlaQvKBaWxMh1qbuZA3WNkHs2vUnx3TkhcWSxgFG2RDZFf+Lb1YQMhrclzQUTBHVR0OkCKIp0W5tobenIQNh5UzGK5ozh90iHLlBNSwdJb7+nV94RnvqvwMsZkRurnInJPtybDEhGhvDX6ml+1TIkLdRINMbijwLiq7xR6sWXrQLYDZJpMvC+1vR8izXIzMJra/L4PV+YCc+Yor8n8PH/ZpsHik2oTafIe4pSlkCrzkxcMAv8ZxymvPc/P6Jr9veBoYw1BoFqwY+jfgg2Du1Q6O/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 16:15:38.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4bdd26-05b1-45a5-64ec-08dea79ce1fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

Hello,

On 5/1/2026 10:49 AM, Conor Dooley wrote:
> On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
>> The firmware-name property indicates which firmware to load on RPU
>> during the Linux boot time. It is possible to stop the RPU after boot
>> and load different firmware and start RPU.
> 
> The file supports 3 devices, do they all support loading firmware like
> this?
> 

Thank you for the reviews.
Yes, all the devices support loading the firmware like this.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> index ee63c03949c9..ae63c3e39ced 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>> @@ -135,6 +135,10 @@ patternProperties:
>>            - description: vring1
>>          additionalItems: true
>>  
>> +      firmware-name:
>> +        maxItems: 1
>> +        description: default firmware to load
>> +
>>      required:
>>        - compatible
>>        - reg
>> -- 
>> 2.34.1
>>

