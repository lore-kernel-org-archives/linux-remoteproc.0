Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9136C0B4;
	Tue,  3 Feb 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104566; cv=fail; b=jLGt4KN/geDLl0EoywtGkMSObzaeowdjEv7I6PUvZQv0fPAOBuhgS6toojSoxR4pj2Y6FrzljGkVSF/KfcHpnzisM+9PIDTvlOIE4YBIu4PVPxiErjKEl0EtlVJZKdES0sheYgRUn2fltRafoyEjM0tLEjFhe6GDA5/wUmXjQpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104566; c=relaxed/simple;
	bh=OImMbgeIvSag5UN0cE35PJ4tfhCoQ+/6gywfD1jNo/E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Zg/lrFOZ5vcRP56JOsotsJ71D+jt2+SWTst0LX+FaCCcZEi7/1bliBsFhECF+TPleFC277f2MSpoZHM1KmavojLI04TNSXZ/W44tep3I15IfO/+6KhTDXMNseZTHwHRxc6kvBo9mQToHqtJ+9Fldyi7six+hBCbVDVCGVlSRklM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A34NOF/3; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="A34NOF/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSyUvZsirIOJ0wQXCEih3QILpvMV3cMYBpG7Xh4H+fi9euDhiQWEFbKbkaCfmlYkNfe0vEp5WxkBooBWu4Lp0QgC8+rqrsBmFQnWkyVJ7jbeoZVTE20IT5Ufcs5nrQ69ahiymN8z3dOiMUzGOhTet0E2mF1lTfQ4H1Qb1cBeonZ7M77PrE33ID+89v0hIeALLvgZH55TscoxSkgKRC1ZVoC2uM/WGArUq1xby7VMAFZ0rpmmIWcaazeN5AOpKKnG1TRtYyZ8hP2rybF3X4wlxVxYTNmOoRzAgPqnQnPlQsCII3mhA4ql5iWAdE/PW/EHpxVyX2HQS+l7FEZW/4i8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjwvWtHAFtaI/Xpqg9QGqz2wBbxFJWLTn36wZzoBzdA=;
 b=gtaT29TYRu+zhvm+fdKitrVVKcGrxrS5ltIueaHegVPAWdHAxbZMrZX5A6OhZiXhZREn97osAtLFF722P7pzxH9NGKEfeGZb71TjrqiROFQMF+RZnk2Sv7gxS5c+CUZiiFTnruBrLQTivTVoQpPXDTKnr/YoW7ZBOCCedv/i6fVcMd8sg7FATs8Htxe36LxM1Rp0JJANm5BttZ8wDByeUz3zl7kZAu/nZX1DPMihVUXJuha1iYvHmOAnlPoxSEIDO3TTeoJSBLKkEY4F56uPTWNLMxC2KFFUW0jt4wHQBlPexdnlk9/1TrBDR4XSn4S2uey97N+UI1UmWezMYrOkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjwvWtHAFtaI/Xpqg9QGqz2wBbxFJWLTn36wZzoBzdA=;
 b=A34NOF/3cxBNUT83bRFp6DGRoxbXZFH5UZN5B9QwWTnkQK2cecN0w4b9spjYsbgthn26oon7oIiGe65AH1BoezLXk9ZIYL402JkZYzjSlknGy7jl0MI17wFir7HryViTQN+R/KJ4vN62YpNExYSzPvUaGG7rgCKGvcROGbiJ7R2jJokriCufoCDa4ASltpWzT5bxYJ+A8prVUZNqloYBqBocy7jbGi9HbPC3KWAWBIQQbWFXjjSUySzgyDjIaD7Ppa/CC4wqAC+1h3DlqQGXuT/6IaHRXnygV3WK/1KWCxOAE4eM6acVmpletswFQLjABYaIUPG+2/aA89KhvgFd+Q==
Received: from DU7P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::21)
 by AM0PR10MB3140.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 07:42:37 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::47) by DU7P251CA0008.outlook.office365.com
 (2603:10a6:10:551::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 07:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 07:42:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 08:44:22 +0100
Received: from [10.252.26.182] (10.252.26.182) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 08:42:35 +0100
Message-ID: <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
Date: Tue, 3 Feb 2026 08:42:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<op-tee@lists.trustedfirmware.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
Content-Language: en-US
In-Reply-To: <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AM0PR10MB3140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe294ef-2333-4df3-8e7c-08de62f7ccf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlovdUp4aVdVOUQ1YmpzZHBBWnJFdlVUOEgwSHVocTRtMnNIWDV4S1YzK0tF?=
 =?utf-8?B?N081UUI0NGpqL1BBSXZYL01JRStwdFM5cWJVSC9DQ05IeDFncDRsQUplR0c0?=
 =?utf-8?B?ZCsyT1g5QWVsZGdRODR5N24wM3hvQmhDNENCbFNWVS9zSkdzT1NHSlZjZnN0?=
 =?utf-8?B?YUJWK3ViOXBvZGJESjdWSnM0ajlVRGZ3cFRTRUNvdXJ0ajV0dWNTRUd5bEFJ?=
 =?utf-8?B?cUJNZVErTm5Rb0t0aGpGODZSQjJBYmJxSk9MVHFXVWg2ZVBpOW9PYkNGbDBR?=
 =?utf-8?B?T3N5Uzc1a0ZpSWJkeUVFaFVhZExxZ3d1VDVrbUZFU3hZYjRCTzRzdDZSeTA5?=
 =?utf-8?B?eitFM3JIQ0dUeEJqcXBJSXF6SDhhS0lSa1BHRS9wb0tHdS84RHlPM2VTR3I2?=
 =?utf-8?B?NjdQdXZhd2R5cHRJZkJXNTlYbEQ5Zm5LaXNuMm1WK2xHNGwzdkJsU0lGbFkz?=
 =?utf-8?B?RjVnQWh3UGRVSU9BZlhZU0thblo0anJ6Z0xsZDhPWkNYMkRBcGtZQnl0cVkv?=
 =?utf-8?B?M0R5VnpEK1NYSXpMZDYrWVhra1BTelAvQ2dKSzlvM053N1lIOExLWit3TGNY?=
 =?utf-8?B?U3l5OXdrczNoNTNkQVJGSndQUnhsbmxXQ2tkd2hMZHJvMytSa3hOcUJML3l6?=
 =?utf-8?B?dDh0SG1TVjh4MS9xZnY1aUIzQTdKWUZDWVhlQlFOSnRjdWdnV1J2djZBZnZj?=
 =?utf-8?B?YlVPSUxCSHd2ZXY5WHhrQ1FndW12aUYvUXlPS0FzUWJnMkJuNHRRRFRXMGtX?=
 =?utf-8?B?VmplR2JlU016ajFSNTlHeml6QnJwWncwVVl1ZGlWRDBLd1kzQS9rWUlEZk5V?=
 =?utf-8?B?U3d4RGxSTU1INktUczlyVVN6VzlrdzFMSUpjM1FaNEJzT2pIZVlWVkpmVXpv?=
 =?utf-8?B?dXJ3cjd3M0RENFYvS3JSREI2bFAwcGZkZ2owa0tTZnk2ZEZ6dlVFTjlEZ1BU?=
 =?utf-8?B?Y1paWEpxMGlkTDR6aXJwOVV1alYrV2hJMnpGOUMweGsyalB6Vmw1NU9lQUth?=
 =?utf-8?B?WEFYUm9vakZSK3ZZMTR3eUtsWHRISXVQMTlRbThDelVmU2xIc3JLdFpDTjhN?=
 =?utf-8?B?WXpvTWsya2pKbnVxMmFJS0RwemVFVzZVRjk5QlRiTit0cGVzNFNqVzY2OHlL?=
 =?utf-8?B?cWl2dnZ2cXVlQ3dYZEZIcmdJVWdKZlh0U1hlM1ptWWh2cGYwYWlYL2J1Q3NP?=
 =?utf-8?B?Qm5GZURWelRuTHpEdU1RUmExOG0yeG9nek45dVNHQUxFWkVpNlhiTFVXMlNZ?=
 =?utf-8?B?bWo1NUZRdlR3ZzNtd1d1Y2hEMGo4MlNCY0ord3J4SmpKcktwdDRxQk1NbEtO?=
 =?utf-8?B?R0owbFlGZUxaNm5vYlAyVmpxdUJwU3pYQkNxWEVIckJUNGRQWnQyNDBDRjlL?=
 =?utf-8?B?akIyMnRrQnNrY0NGNHpPTFExc0g5RFljekhHdE5Jb1BkVWZyTnlFTVA4Kys3?=
 =?utf-8?B?RWIvUDVkdUZRMUd6Q0VRZlF4dWtWUFZ5dnd5M1luWE9qOTh2VVlIWHFpbUIz?=
 =?utf-8?B?N1IxZWlybTlzaEdkWXFJT0ZKZGNhM0FYNjh6TWxBTm0zejZCYkFMa01ZMUU3?=
 =?utf-8?B?dlBROEIvZ3FHMnlGU1VCL1hSNXd3MjdlU2RPdjdCZ2JVUWlZdi9VZCtLcEpz?=
 =?utf-8?B?SnVZOGwwMHBuUHBUMUJINzZQaU1aYXIwSkQ3eUplenBKZ2dSUWVVd2lkZXRV?=
 =?utf-8?B?Yy9yMFhkL3AzRGRNL2lTSFRRc2YxVFZXcUMvMWJTL2xDWHRmQ0Riam1TT0tp?=
 =?utf-8?B?dnNwNnZKcUg0enZqd1BkWHBJQldMZ3ZLMFhDZi9RaUVqWFY3ZThoMWdxZ3k4?=
 =?utf-8?B?SVJVZEZLd0F1U0R3clhGUmk1V0I4TjdNUHNlc1N3c21UVUFRMWY0enNmL21E?=
 =?utf-8?B?aGllQ3VZTldhRkNBZWVjQkhtOFVqMDBKRmVSMTBhSWFLZjZ1bHdzams1Q2Zt?=
 =?utf-8?B?Z3E2ZXd3dTdtZXpRb21qSkI0V1prU0hnb1JhbUJZc0RNZUl4UmJYQmJ2cDFi?=
 =?utf-8?B?YmFsVmpnSGRLbDBoYjJhTVhzaHlXbEE4MzJyTlRIYVVnbHdJWGs1bWkyNmZZ?=
 =?utf-8?B?MWNGOEloMEZLVjJGb2dpVnd0blh2VloyeFViTkpQc1I0K1ZXK0VJaEx3bDB3?=
 =?utf-8?B?US9ib1dCa3gwWWxSck1WY3R3SHhnTmVXZVpxaEdkLzB4NE45NDd1M0cwU0Ft?=
 =?utf-8?Q?aBLzhkOYIv9QmaKYw9Lt908=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	16a9bVpkzU7nUJWL2LepSini/6xwA2OdpnKgIKL6IYQ2n6sfp9vSWGnBqCxw8+zjkb5X3XnZCWwsDHf5M3G4vQdbJRtzs8Qwg9z+JREUwo2X0XXJug2rMDxbEg5KidwQCiP8xxVOOPpJd5wSHDjNYSNf+Ucceexi0p/wCC00wG0UgaWjv2wyQ5rntoJl5NmfKiseYY1t3ScNG+F4ILSuTRxhZGfTf5itUbAuq5F40ZvFntwcIJcgjipsAHngsXXVbM+q48FDG7qL4lga8+/Ylc7J8p3v5XLRZFGP543P6ZVmOg8tqJYlnLP/ymdvc6oUxJ6BSJzQ/V7tW8ha4rg2mYQnAAVr9crjzXdmFwPxGsLFR/adySnEJhxKLs+KEo9QPclC+5jJT0D3g5bgFNdI/1xO3ROwVcYdNUMkmE/siuSRjBU7dF9UN7mt6w8/rpfB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 07:42:36.7104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe294ef-2333-4df3-8e7c-08de62f7ccf5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3140


Hello Rob, Sumit,

Just a gentle reminder. Could you please provide your advice or a 
conclusion on the direction we should take for the DT declaration? I 
need your input to be able to move forward.

Thanks and regards,
Arnaud

On 1/13/26 10:20, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 1/5/26 08:37, Sumit Garg wrote:
>> On Fri, Jan 02, 2026 at 04:17:27PM -0600, Rob Herring wrote:
>>> On Tue, Dec 30, 2025 at 5:10 AM Sumit Garg <sumit.garg@kernel.org> 
>>> wrote:
>>>>
>>>> On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
>>>>> On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
>>>>>> Add a device tree binding for the TEE-based remote processor control
>>>>>> service implemented as an OP-TEE Trusted Application identified by
>>>>>> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
>>>>>>
>>>>>> The TEE service node is a child of the "linaro,optee-tz" firmware 
>>>>>> node and
>>>>>> acts as a container for remoteproc devices that are controlled via 
>>>>>> TEE.
>>>>>
>>>>> Is this generic for any remoteproc device or just ST's remoteproc. 
>>>>> Looks
>>>>> like the latter to me.
>>>>
>>>> That's true, the DT description of the remoteproc subnode is very
>>>> specific to the vendor which in this case is ST.
>>>>
>>>>>
>>>>>> In addition, the "linaro,optee-tz" binding is updated to specify the
>>>>>> '#address-cells' and '#size-cells' values used for child TEE service
>>>>>> nodes.
>>>>>
>>>>> I'm pretty sure I already rejected per service/app child nodes for
>>>>> OP-TEE when its binding was submitted.
>>>>
>>>> That was the reason to have discoverable TEE bus in first place and I
>>>> have been motivating people to dynamically discover firmware properties
>>>> rather than hardcoding in the DT.
>>>>
>>>>> If we do need something in DT
>>>>> to define some resources, then can't we have some sort of
>>>>> standard/common communications channel? I don't care to see some 
>>>>> sort of
>>>>> free-for-all where we have every vendor doing their own thing. OP-TEE
>>>>> needs to standarize this.
>>>>
>>>> I suppose this requires a wider scope work as you can see the DT 
>>>> resource
>>>> dependence from here [1]. By standardize communication channel, do you
>>>> mean to say if adding an alternative backend to fwnode for TEE in
>>>> parallel to DT, ACPI or swnode is the way to go for discovering fw
>>>> properties?
>>>
>>> No, not at all.
>>>
>>>> Or do you have any other suggestion here?
>>>
>>> What I mean is why doesn't the TEE define the communication channel
>>> (mailbox+shmem and notification interrupt) rather than each TEE app?
>>
>> The synchronous communication channel is already there for each TEE app
>> based on (invoke commands + TEE shared memory). OP-TEE does support
>> notification interrupts too but those haven't been exposed to TEE client
>> drivers yet. I suppose this remoteproc use-case can be a good example to
>> expose that as a generic TEE notification interface too.
> 
> In the STM32MP series, the mailboxes and shared RAM are used for RPMsg 
> communication between Linux and the remote processor. My concern is that 
> using notification in OP-TEE could impact performance by introducing 
> latency. Additionally, this might require a DMA allocator in OP-TEE to 
> manage the shared memory. One RPMsg virtio requires the declaration of 
> at least three carveouts. Managing these as memory regions in OP-TEE 
> would be complex (due to limited number of memory area declaration on 
> STM32MP2).
>>
>>>
>>> More generally, is having TEE apps depending on random DT resources
>>> really a box we want to open? Is the next thing going to be a TEE
>>> clock/reset/gpio/power provider? Where do we draw the line?
>>
>> This is really a hard line to draw since silicon/OEM vendors based on 
>> their
>> hardware security architecture partition various resources among TEE and
>> the Linux world. And one general principle we try to follow for the TEE
>> is to keep it's Trusted Computing Base (TCB) to a minimal too.
>>
>> IMHO, if the threat model is well understood then we should allow for
>> this hetrogenous partitioning of system resources.
> 
> Here are some additional resources we need to manage the remote 
> processor, which seem complex to handle without Device Tree (DT):
> 
> - Clocks: On STM32MP, we manage clocks through the OP-TEE SCMI service
>    [1]. The SCMI OP-TEE clock/reset service already exists and should be
>    reused.
> - Power domains
> - Remoteproc Watchdog interrupt: Cannot be caught by OP-TEE on
>    stm32mp15.
> - Graceful shutdown of the remote processor: This involves sending a
>    mailbox notification to request shutdown and waiting up to 500 ms for
>    the remoteproc to deinitialize its resources. Waiting this long in the
>    secure context seems inefficient.
> - compatibility with some coming IPC mechanisms: Such as rpmsg_I2C or
>    virtio-msg might require remoteproc subnode descriptions in the
>    future.
> 
> If the proposed topology does not gain consensus, what about an 
> alternative approach that manages the remoteproc TEE similarly to SCMI, 
> by introducing a remoteproc-backend with the proc ID as a parameter?
> 
> 
> &firmware {
>      optee: optee {
>          compatible = "linaro,optee-tz";
>          method = "smc";
>          sproc: sproc {
>              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>              #address-cells = <1>;
>          #size-cells = <0>;
>          };
>      };
> };
> 
> rproc1: m33@0 {
>    [...]
> 
>    remoteproc-backend = < &sproc 0>
> };
> 
> 
> rproc2: m0@0 {
>    [...]
> 
>    remoteproc-backend = < &sproc 1>
> };
> 
> 
> [1]https://elixir.bootlin.com/linux/v6.18.4/source/drivers/clk/clk-scmi.c
> 
> Thanks,
> Arnaud
> 
>>
>> -Sumit
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

