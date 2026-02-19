Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532F2D1916;
	Thu, 19 Feb 2026 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487506; cv=fail; b=noJsxtpPTNxZDV1Ikc/AKehLliAedKFipOGLXPlnXlHo1ZWBFifV4KOtxQm3jF2k4q18FiUG8SgyQIm+Nc6qqQWbjX0ama4MCBxn47BO+QeMSZ6R19Kyr/ACip5T9+cHRtZS2phGJz787tghp5fOp1mcOi6MK94WC63XWtQA2qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487506; c=relaxed/simple;
	bh=BmS4FNww/jm9Z5g34wkJglVC0h2CQdanYS6qCtTzgAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o+uGkOGayAJq+dp132or1TrKE9//Aq/Jd32phGuuj6KudUylQ2KjEEVZoCvmXEvP7Y0/f5NwzambAyM3Iq/dxsrMvGN802oQSGdrV0gHmw4YqFoJyZjYXWSkFEMevZQGH0KzglPaF80PWNtmzOHflQLm/o393bQzRDP4wsJHsZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hKZfpUMl; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hKZfpUMl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ+1qh5YjlGjd8mOz7ULC45zCihj7emQppybuyl1dv9j7+tHEN6xYCw4P5le2iAcVUHyIDOT+ZQDZNEg/T4GHb0U/YSgVok4jY5/1NVpPpZB8kjN+Xv4gbrl0M0LxEFiBdWVnc2ceJkvSK2Coa2S7RzMnc2iCqDtY/DEFeXelTsgYbKwEv9rnrj4VggaYqe8nvimgvHCAXHSMs1bePtZ7bAskYkXS0xxy6sFpXs5Nq74gLzpVAgs+Mk4lIBRrsUUPWrcU5KgP+30e/tOtgjB4TknemCcVMww8o3hPoGwAaI2ybo2TztU0VBnnEP9AORtpNlJ7aiepmVbDwqTuo7x6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky8Ca+nZaqHt/yBIku833g6W9mruJMgIWKcDQ8slxPY=;
 b=ZQndicser67LTuH6Wrt16Cuh7SddItTzJr0H6DFYDrDE3t0djpJVesxOS559/17IXDVUGS0ssMXJ7Ctds8x4eoNzX08Ndi6gvN3iOHvPrkY55lWvLZ+wQOATxL3ncgq8KZjY76T8rimSwBAi/acGEuKu+uGakaip5HjykWTaF2SrOdXSOHmxjtq0jEd1nwZWvyVULzHVEY7iYnqlUANxHaNVsIi1/8+rFMWwUlqs/q4tTGCAC1XlvcmMRhEoUqnwYoe9EILhugs/VCphip3nVLA3QUM8umgtnsH2I1s64fFQNbzbrReeEcOCQTP6vt8MafBrfv14K9GUbzN/MpbY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky8Ca+nZaqHt/yBIku833g6W9mruJMgIWKcDQ8slxPY=;
 b=hKZfpUMlJKpuZanFuZNTZ4cmBwjBymDxQnzFZff36Yd2e0FEWgauV7btAqPq6AXwYIgoob7G1Ps9HuTa4GX8wRdGMWUWSDT8C/xGb+UPMLFI1GbFuC+EBDt8mBWnGyK47mCqVitogAWJI/S2eqvAxp8h7WZsRZTJ/gM8BW3/pWlbJ0u0WlLNlGw0A31R4Cep+E/wS1g93F/1vgUIeDNkt4EGVg9H+xWbrFLDFqbE3NGWJIclBugin17hxshu/h6Dzfcw7nCd7LenNqIQnjRjNUv3XuDomHboZtF/KHgoRiqXuWSHc8bju5tbKn3XBP/zLAnQJxzDy0+gie3sgq7Jxg==
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by PA1PR10MB9179.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 07:51:38 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::1b) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Thu,
 19 Feb 2026 07:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 07:51:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 08:53:34 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 08:51:36 +0100
Message-ID: <7639bae5-045f-4d56-8bcb-cddcb4e3d87f@foss.st.com>
Date: Thu, 19 Feb 2026 08:51:35 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Sumit Garg <sumit.garg@kernel.org>, <op-tee@lists.trustedfirmware.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Jens Wiklander
	<jens.wiklander@linaro.org>, <linux-arm-kernel@lists.infradead.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
 <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
 <aYrMp9wqk91-tQXn@sumit-xelite>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aYrMp9wqk91-tQXn@sumit-xelite>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|PA1PR10MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3e4717-495e-40c7-954f-08de6f8bb634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0wza1JaVEdTQlJFejlqK3hmN1RlS1VzTS9Fb2JudnNaQVBaem0wSWkvdy91?=
 =?utf-8?B?K0pTejV0OVY1RTJXYVpVQ3RxVUdkTU90S0JtcVMrWnFaeXY1NWlWRVNZUTVv?=
 =?utf-8?B?M1RVZXNZZUJlODJ4WDRCeEVlYXpXbktTU3JVSVBrTVd4MWd0TlJPdFZ0Q2xJ?=
 =?utf-8?B?TmdWejc5djFIeVpGdm9nQ3ZlN2xpWVdzaDY4UVdjRVgwQ0FZc0pOMmRWb0d1?=
 =?utf-8?B?Q2hIZW5oSitxblJrSmIwSnJibGllcWpDbUxBU01UWDZTSTBKVHJXTEZSWmVk?=
 =?utf-8?B?T2lTSnllZVlxVUJoMlYwZEE5OFNaM0xBMFFDZDBPZ0syb21wd1crTlh6RXBw?=
 =?utf-8?B?Z3F6NWxjQnNqWWgrME1OTW52ajkxd2NYeW85MWIranJCSjVOamR2S2E3d0hO?=
 =?utf-8?B?dkExRjVsREIra28zYzlDcy9hZWNJb2pqWldnUDY3cXlWOWsvWDVqRW1rdmJG?=
 =?utf-8?B?cjRFa1BTL0Z2Z2U2NVZwT1pBQzR2TzY4cG0yRWpZN0J4cWpUWDZpaVRuY1JT?=
 =?utf-8?B?MVV6Z0Y1WXdwdUFkbmRVYmd5TWtIazJpdmc4WkxhaWwxbC9TMGVzbnhnMktO?=
 =?utf-8?B?c2ppczk0bTczVklXK0dCU3dYbkRoTXhaTlhWV1RDUlZzT0RhS3BLbHZpYk93?=
 =?utf-8?B?ZDNuS0pBM0FTRjBvcFVWSGdqVXY3MnE4M2pSNnJkSWtuNkRlV0UzMGJyRnA4?=
 =?utf-8?B?ajJZRW9SVUxxdXZBdkEvWS9wWXdjOEtYZzhsd0V3eGJ2emxnb1dqTEo5ckE2?=
 =?utf-8?B?MHpNaDV3RkxwL0ZORUVKbkQ4TG9nbDN2ZFR3eXdyQnVqQ2hCOFdNL2RBUWJU?=
 =?utf-8?B?SVp0Q3lLNE9qc1ZpdXRLZFZNSUdsWUpUQ2hYaFFIOE85dEVLbU5qU3JLU3VJ?=
 =?utf-8?B?dmdQV2xKbGlxcE5WZ25FMWNmZ0F1TlNpb1JhL09JOENaaWI5Sm42TWxKZ0lS?=
 =?utf-8?B?WTVYOC8vRXlLa2JreGwzdHpsWkJ5U3JXK2Z4MlNVR0F1aUtVMG1Gclc0Zk5y?=
 =?utf-8?B?NW95ZDBWTkZ1R3J5K3NJaW9URFh2VllsaHp0ditId2JrWGw1YXZiRmh6bTBx?=
 =?utf-8?B?cENJZW1zN25XTDVIbC9LZ3AraGN0NmRGVFZrVVQ5blBaOUJIQ3BIWnl2c0NW?=
 =?utf-8?B?dFc0RFBaSnI0emVGYUROK0FrcVNkc3ord1VqZ0YzcnBmK1o3QVY5R1diY1pn?=
 =?utf-8?B?M0IwQlE1WmhzOHF4L2VOSDBSWGFzMmhWcFREb3Zsb1VpVHlFRmZOUEkvbm02?=
 =?utf-8?B?dGI2eEhHME1xS2VCUmZUVjZzMXN4MFNxeW5IczJ5bVR0MHp5TkZvbmNROE9U?=
 =?utf-8?B?eXE3ajl0Q2ZUOEl3c2drcFpkT2krMW44MG0zQU05WHo4UkQrUkFMWWNuS21z?=
 =?utf-8?B?N0t6R2JIMHpPdmdUcHIvdVFTd2xvc3M0K2JpUCtObTRnSlRabGxBdXJ2cWVz?=
 =?utf-8?B?Z1djUzVaRk9CVHd5aVZRNERuOTQ0QkxmN2dMNE83RUZIOG1vTXE3V0V3dElM?=
 =?utf-8?B?dTB6QjFIcTQ1NkVuczQ2QjlGMHZNaFUxMTVBMjFsT0VhVWEwdFlJM3JBTktj?=
 =?utf-8?B?c3FNYjFNRU9HdXZMRXNFU3J1cjF1QjJVUElVSEU4bTl3U25hcUs5cmFHZzFF?=
 =?utf-8?B?MmwzY0thWm5iSDVuTms2SEdBWlhYdkdGakpTSHRsYi8rQUtuMVMxalpZTVRR?=
 =?utf-8?B?TEk5OHNpdlliaHBxMFl6USs0a3JrQkpsU3ZWSExyRnYvMDdETFFTNHVGOUZ6?=
 =?utf-8?B?MUdiSklWcFZaN3JrdWxhWkV0anlqV3ZBWk9aL0d0VGRIMVBxZUhXSXdmUGlJ?=
 =?utf-8?B?ZkluV1dreDBiK29ZNzNKdzJCbVFrSTNuUFpHRjJPdWM2anpvRXkvVXR5Uzd6?=
 =?utf-8?B?cytuWmhQTzJNc2puSy8rdFR1YWY0SXJ1bzZxREpuNnNJZG11YzVLNUVhOVg1?=
 =?utf-8?B?dGtCU3kwbHFzUGxNY3BoeEYyS2JJYnJuYU1NTlFhRzBSNXFhYktXWnV6Yndy?=
 =?utf-8?B?VDVmVmtkU2RmRmw5RlV6aVFqS1NkWHhsUFV6clFmZVpPcGRUcEtBaVN2YUU0?=
 =?utf-8?B?MmN4RHFEdGE5NWxRUU8zY1g5Q3ZHZ3lOYXlSdjNPUGlaMHhtb3RvUUtNTlRC?=
 =?utf-8?B?RW1xQXZGOEJUNGUrSEEvTzBDVFErL1VDT2QyeEE1VkhnR3BSRFNMNk9xYXpr?=
 =?utf-8?B?NFE2RHVHc0JtRmtndERrMGpKNTBqR3lKR1BuT0hGRGhuSUIyUFVucmlFQTl2?=
 =?utf-8?B?R216dU1sWm5wZ2h1Rzg0amtqcm1BPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/qHmgWioz0gPklVYeoUlobyvOV4KTKN9jl68PoyGuuX0r7m3SUDhkwagoNGPUEqEIwjyQnZi3rI6UkLVIT2dODrREof+5cxee0qvXuX+CGU8mD4oeq+oBpwH3fU4w0KEoaOJqctCT3n2oHzP3xkci+jjSsWO7reBfCWmNCsQqHmdgOCfi7lJAKPTRDbYiFCzPBz1qirRTWYCd3IT43P+eLFn6ZHdKuMNVp29HmO/wrqSKl0mUPPC3SycAbS0QmCwAG8wEPyxoRG1Pn5CaImUgs+V+mcmpmD02HcOMjzUUSlB4t/CINpmYGe+ItLeSjLAGoIKzIiY+or808W11xFxT2kj0j1ydW6dU5n1l4j+HhDeQFve+yL1XW+iAwvjVRCHh8j/g0GRNmKspBixXfbBvchy6C5bUax2ymJ9/s0RTnnkETWr2QRXOBNWUgcKZmON
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:51:38.0087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e4717-495e-40c7-954f-08de6f8bb634
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9179

Hello Rob,

Could you provide your feedback on my device tree (DT) proposal below 
before I begin implementation? Your input would be greatly appreciated.

Thanks and Regards,
Arnaud

On 2/10/26 07:13, Sumit Garg wrote:
> Hi Arnaud,
> 
> On Tue, Feb 03, 2026 at 08:42:34AM +0100, Arnaud POULIQUEN wrote:
>>
>> Hello Rob, Sumit,
>>
>> Just a gentle reminder. Could you please provide your advice or a conclusion
>> on the direction we should take for the DT declaration? I need your input to
>> be able to move forward.
>>
>> Thanks and regards,
>> Arnaud
>>
>> On 1/13/26 10:20, Arnaud POULIQUEN wrote:
>>> Hello,
>>>
>>> On 1/5/26 08:37, Sumit Garg wrote:
>>>> On Fri, Jan 02, 2026 at 04:17:27PM -0600, Rob Herring wrote:
>>>>> On Tue, Dec 30, 2025 at 5:10 AM Sumit Garg
>>>>> <sumit.garg@kernel.org> wrote:
>>>>>>
>>>>>> On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
>>>>>>> On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
>>>>>>>> Add a device tree binding for the TEE-based remote processor control
>>>>>>>> service implemented as an OP-TEE Trusted Application identified by
>>>>>>>> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
>>>>>>>>
>>>>>>>> The TEE service node is a child of the
>>>>>>>> "linaro,optee-tz" firmware node and
>>>>>>>> acts as a container for remoteproc devices that are
>>>>>>>> controlled via TEE.
>>>>>>>
>>>>>>> Is this generic for any remoteproc device or just ST's
>>>>>>> remoteproc. Looks
>>>>>>> like the latter to me.
>>>>>>
>>>>>> That's true, the DT description of the remoteproc subnode is very
>>>>>> specific to the vendor which in this case is ST.
>>>>>>
>>>>>>>
>>>>>>>> In addition, the "linaro,optee-tz" binding is updated to specify the
>>>>>>>> '#address-cells' and '#size-cells' values used for child TEE service
>>>>>>>> nodes.
>>>>>>>
>>>>>>> I'm pretty sure I already rejected per service/app child nodes for
>>>>>>> OP-TEE when its binding was submitted.
>>>>>>
>>>>>> That was the reason to have discoverable TEE bus in first place and I
>>>>>> have been motivating people to dynamically discover firmware properties
>>>>>> rather than hardcoding in the DT.
>>>>>>
>>>>>>> If we do need something in DT
>>>>>>> to define some resources, then can't we have some sort of
>>>>>>> standard/common communications channel? I don't care to
>>>>>>> see some sort of
>>>>>>> free-for-all where we have every vendor doing their own thing. OP-TEE
>>>>>>> needs to standarize this.
>>>>>>
>>>>>> I suppose this requires a wider scope work as you can see
>>>>>> the DT resource
>>>>>> dependence from here [1]. By standardize communication channel, do you
>>>>>> mean to say if adding an alternative backend to fwnode for TEE in
>>>>>> parallel to DT, ACPI or swnode is the way to go for discovering fw
>>>>>> properties?
>>>>>
>>>>> No, not at all.
>>>>>
>>>>>> Or do you have any other suggestion here?
>>>>>
>>>>> What I mean is why doesn't the TEE define the communication channel
>>>>> (mailbox+shmem and notification interrupt) rather than each TEE app?
>>>>
>>>> The synchronous communication channel is already there for each TEE app
>>>> based on (invoke commands + TEE shared memory). OP-TEE does support
>>>> notification interrupts too but those haven't been exposed to TEE client
>>>> drivers yet. I suppose this remoteproc use-case can be a good example to
>>>> expose that as a generic TEE notification interface too.
>>>
>>> In the STM32MP series, the mailboxes and shared RAM are used for RPMsg
>>> communication between Linux and the remote processor. My concern is that
>>> using notification in OP-TEE could impact performance by introducing
>>> latency. Additionally, this might require a DMA allocator in OP-TEE to
>>> manage the shared memory. One RPMsg virtio requires the declaration of
>>> at least three carveouts. Managing these as memory regions in OP-TEE
>>> would be complex (due to limited number of memory area declaration on
>>> STM32MP2).
>>>>
>>>>>
>>>>> More generally, is having TEE apps depending on random DT resources
>>>>> really a box we want to open? Is the next thing going to be a TEE
>>>>> clock/reset/gpio/power provider? Where do we draw the line?
>>>>
>>>> This is really a hard line to draw since silicon/OEM vendors based
>>>> on their
>>>> hardware security architecture partition various resources among TEE and
>>>> the Linux world. And one general principle we try to follow for the TEE
>>>> is to keep it's Trusted Computing Base (TCB) to a minimal too.
>>>>
>>>> IMHO, if the threat model is well understood then we should allow for
>>>> this hetrogenous partitioning of system resources.
>>>
>>> Here are some additional resources we need to manage the remote
>>> processor, which seem complex to handle without Device Tree (DT):
>>>
>>> - Clocks: On STM32MP, we manage clocks through the OP-TEE SCMI service
>>>     [1]. The SCMI OP-TEE clock/reset service already exists and should be
>>>     reused.
>>> - Power domains
>>> - Remoteproc Watchdog interrupt: Cannot be caught by OP-TEE on
>>>     stm32mp15.
>>> - Graceful shutdown of the remote processor: This involves sending a
>>>     mailbox notification to request shutdown and waiting up to 500 ms for
>>>     the remoteproc to deinitialize its resources. Waiting this long in the
>>>     secure context seems inefficient.
>>> - compatibility with some coming IPC mechanisms: Such as rpmsg_I2C or
>>>     virtio-msg might require remoteproc subnode descriptions in the
>>>     future.
>>>
>>> If the proposed topology does not gain consensus, what about an
>>> alternative approach that manages the remoteproc TEE similarly to SCMI,
>>> by introducing a remoteproc-backend with the proc ID as a parameter?
>>>
>>>
>>> &firmware {
>>>       optee: optee {
>>>           compatible = "linaro,optee-tz";
>>>           method = "smc";
>>>           sproc: sproc {
>>>               compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>>>               #address-cells = <1>;
>>>           #size-cells = <0>;
>>>           };
>>>       };
>>> };
>>>
>>> rproc1: m33@0 {
>>>     [...]
>>>
>>>     remoteproc-backend = < &sproc 0>
>>> };
>>>
>>>
>>> rproc2: m0@0 {
>>>     [...]
>>>
>>>     remoteproc-backend = < &sproc 1>
>>> };
> 
> Using a phandle like this makes it a bit more cleaner but I would defer
> to Rob since he has the final say here.
> 
> -Sumit
> 
>>>
>>>
>>> [1]https://elixir.bootlin.com/linux/v6.18.4/source/drivers/clk/clk-scmi.c
>>>
>>> Thanks,
>>> Arnaud
>>>
>>>>
>>>> -Sumit
>>>
>>> _______________________________________________
>>> Linux-stm32 mailing list
>>> Linux-stm32@st-md-mailman.stormreply.com
>>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>>

