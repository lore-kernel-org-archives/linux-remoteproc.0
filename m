Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A5D37B006;
	Fri, 20 Mar 2026 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000708; cv=fail; b=dBmYCCGtSA6lzdsf5VDbtEqv0yzrnfJdxUwJHFbS0cB0Xp1nycpb1UTV8NCidXlucbqf18XfsgPnwNC2SHez1NdebZhXNqpAS+qBnSL1Rb0ouKEs79WPvOFU1jwLt4p8BrPkheQ/B9qDPL2uSHFBzfzTKzGP2x63B4FGZBSbUxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000708; c=relaxed/simple;
	bh=atDjxSKVhH7oDKzduQpAK648nvyOfDD9EZGyNpdjTIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qm2UnRuzKspwrchVyvVbYY/itNp6ZPTa0uZ8std6iRuCY+Vc8Q3FujGJmCvmYyqZXhWpN5QX9SgG+cN4d4LFB9OV/VkeVV8EqZULUzF2d8S0yHfKcl6/BC+FmKX0wscrYAEuSdtq933io6Q/pvyi28KVSpYlnfAVz+Us14gCKfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OejwxGQZ; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OejwxGQZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvdlmVWEnaDd/9uU/geVulVuM/BkRHd6Cn6zC39LpymsIc/Wl85ZWGmac/05kzHp6bJWoaWzOHWwwVgOJ6nJH/YRCAtFUXRXpk4iunKRpbLW014nCVmmLjhfshNojW3OpacXUbutNjBLNd2ERaxO4b5hfOv86Q9OwlO4+pSMFRZUA06cuejPn3ztQCFSfjzJxJpBU2IWjQ1uRBQBnJcfFn52e4z5iLCUD2mIKtyuxgOdw26vfuhkNswSo3Zaig3OhXAsFKGccXegMVZwaMryE2tTJHLUvlo0VfIeaCr4sJYUrAfddBRQk7myN2nqAF/lwc/g8ZpZQwi46y8YHxW1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6f8KIaTB3VIRYAauVWqQbIbdfBj7xAZYF8Z0O/Xw64=;
 b=eXGETTRkzsvYwESPO4b0ZpWRAM7HF/hWtbQL6TyN9W9F9Uj+WQJ9o1sBA+0AayAOJcAnNaOBddqC8867flbR+BC/MUVhH1g3YLwwbi5frw+sdVGL1+3ftbUusYHcE1okhNayQYA/mmSbPGbEVgeLyCQl9rtKtfdly1bWErA285Dw3IMsSrLaGN/ZhaqFvixjQCRRQacCHzsieun10KFG8qaRRabDlvzOdEKtk9GuczPQdwSZnspvTwcv+pT0wGk6WxmrmJ3alpBKze89R5bEaFEMPgvOR9Mm1hUDSzharFrb4ucaumhVIbGpO7gKOfL2pULgt/qUwlqoeHgdcd1eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6f8KIaTB3VIRYAauVWqQbIbdfBj7xAZYF8Z0O/Xw64=;
 b=OejwxGQZ+qviuiCYiUl21BkcgI5Wfi23UZJwgDTepjWJL0g7rYXkqGS3ykR48hst2nLArU+Tujt7ii6RDPFtWBkdnKivC9WK77EiAxWNav0AwYgs5a3HbDIYfQNZvuuDCXLzbdc+uv0DUDUtYk4dEd9bV79raORmKHEPrKOfELmAmpHu06RY7ke54eoOrAa73k5FMAqoMt4FmPwi6eYpPCoiYN0lurY7SXKGlGnrYPkML7wUa3RnXXuHII8UBzoNsqDOBzfGVzULd2E14ptikQYbzKxhViOLQtGiwTV+DSudvKcM7Pr5pNe2GW0ngFbdSQOUNPGfXaxwJVwi/Ib6Pg==
Received: from DU2PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:3b::27)
 by PAWPR10MB7675.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Fri, 20 Mar
 2026 09:58:19 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::c5) by DU2PR04CA0022.outlook.office365.com
 (2603:10a6:10:3b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 09:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:58:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 11:00:55 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 10:58:17 +0100
Message-ID: <df0a0d1c-5cc2-4ec6-99d3-30b8f9ac593a@foss.st.com>
Date: Fri, 20 Mar 2026 10:58:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 2/6] dt-bindings: remoteproc: Add STM32 TEE-controlled
 rproc binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
 <20260319-glistening-ultramarine-ibis-1eb3d6@quoll>
 <420953af-6a12-4277-8c31-062db01f78cc@foss.st.com>
 <0068d43a-e875-4f4e-aff6-3e8330e66c82@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <0068d43a-e875-4f4e-aff6-3e8330e66c82@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|PAWPR10MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e1aca9-5303-4ff9-0678-08de866736bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	I18KFJ5HdPw/cywMGwjEGNSVvK4KVIdI8ZF0dObBibscNKDIU+4ZkqFXC7mNUaweJeByGIvligXv52ZAnKq9B6cy1RFhVp4zw5SQ3VnHZwcJaqLJJV0audhJZOukAOYoVZ17kT8QQSJKebL2tCdLjts1bf7W7NtiBaEq77BsLyaTdSwbW530ZXvrNvAvVxN9mUkwV727mKBS7RtWIYfiNYCvZ9Z5Uld+nlVIEyImI5uNFHX0jDAmdtWv+tVf+EFoZ3syZr+4sASNaksMxMtK2SIH/hbzm1ScjRPxvlmoJHzhs1ysu4apcAWK18IYyE8ikL0pBCpI6hOd8WpOOtM09Yt+NYPpQO1oiEjE7ImHxiTIQQC7ekxy6e64nqY2F+FIPonTanOt3ovrtwyg1J1dcnuWb+b3K0hZEP4n0AlDsrZr1L9QTcRV5oIyNBK/EzwvzzpT6H4aTkdwLUEmuBknCVB213IRTH8vSZTvkLyIj7GAPiWKVvFGkAUEJtKHEylz7IxT3cYiUkjJ651WreGjUJgw+GVVotSeAyk92O+EmJ/WiO0nKsB47pz2ioKLfjkZTfpTBhDH3M3vZ4VUQuWuDRGtLNcKgYO6+Dwf+r1LyMigQ2WnTuH3PgxGODdBGJWE6/c7XTZzE0q1OoyKtTeBvdKdqI9awXopmeD6hYqox0F21dR9rIvA3zcMEZaPXPTgLtSbM/sR3L6ABsa4UsiD3BDPn/CKpH6QHyaVfPFrGHQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zDaOSdoe0ff4mUTHRLkP8ZrsqSFwHCaspMRFRUGHdoN0Br9uP3RYqwNVThx9gqXO+gPHxXxhZhfncR0en29ElzJ578HHzbEoxQOKyvZY0KKFxypYIBDjuMs6SDPl/VIpQTGrkUreEmhUT1LGBhJqsm5x+vDrnLX9jpdud+BlP209NrdfcxAsBAR8BT603Ybnzv/NX0vqRUZ5xivMDMHxVpiOb784yoNtaJ96mR/WEfe4RPaLhojc99Fl5zf3KVbdzEeERFaCk+aL8LgFUbkhjGjWuQmub6XbhexrxuxmxRWX0nZ0BNvPqEcJNFqYLgzTKsQlvMqO9ksxM3Ctc9MyhIxJ2ScqO5aUGo+PoZTU6m2wPY3f1b7oYje3qmYfAkXx8Ms0lSB9PiGfiQ7jwEH7CfS5HfNEWLNenlt/Wdb2wR/GBXW4RpCfLRQBUa6TalGe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:58:19.0181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e1aca9-5303-4ff9-0678-08de866736bc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7675



On 3/19/26 11:41, Krzysztof Kozlowski wrote:
> On 19/03/2026 11:31, Arnaud POULIQUEN wrote:
>> Hello Krzysztof,
>>
>>
>> On 3/19/26 09:06, Krzysztof Kozlowski wrote:
>>> On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
>>>> Add a Device Tree binding for the STM32 remote processor controlled
>>>> via a Trusted Application running in OP-TEE.
>>>> This binding describes the interface and properties required for STM32MP
>>>> remoteproc instances managed by the TEE rproc service, including a
>>>> linkage to the TEE backend through the property "rproc-tee-phandle".
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> V21 updates:
>>>> - the m4 node is no more declared as a child of the optee-rproc node
>>>> - "rproc-tee-phandle" property is introduced to reference the optee-rproc
>>>> ---
>>>>    .../remoteproc/st,stm32-rproc-tee.yaml        | 108 ++++++++++++++++++
>>>>    1 file changed, 108 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
>>>> new file mode 100644
>>>> index 000000000000..ca4dd1c8e7b0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
>>>> @@ -0,0 +1,108 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc-tee.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: STMicroelectronics STM32 remote processor controlled via TEE
>>>> +
>>>> +maintainers:
>>>> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> +
>>>> +description: |
>>>> +  STM32MP remote processor controlled by a Trusted Application
>>>> +  running in OP-TEE. This node is a child of the TEE remoteproc service
>>>> +  (UUID 80a4c275-0a47-4905-8285-1486a9771a08) and exposes a remoteproc
>>>> +  instance managed by the Linux remoteproc core via the TEE rproc service.
>>>> +
>>>> +  Firmware loading, authentication and remote processor start/stop are managed
>>>> +  by the TEE application. The STM32-specific driver handles platform resources
>>>> +  such as the mailboxes and reserved-memory.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: st,stm32mp1-m4-tee
>>>
>>> Drop "tee", it suggests that compatible is tied to implementation of FW
>>> you put there.
>>
>> The "st,stm32mp1-m4" compatible string already exists in
> 
> Then probably this binding needs changes, because in general you should
> not have two compatibles for the same hardware. Maybe that's special
> case, but then needs explanations in commit msg why is that.
> 
>> drivers/remoteproc/stm32_rproc.c, and "st,stm32mp1-m4-tee" compatible is
>> upstreamed in OP-TEE.
> 
> That is not our problem and strong no-go. Other projects are supposed to
> participate in upstream bindings review and take the bindings once they
> are reviewed and accepted here. If they take without review, it's their
> problem.
> 
> Imagine that: some whatever project takes whatever crap (not saying
> Optee is like that, just imagine for sake of discussion) and then you
> send bindings to upstream and claim "that project took it, so you must
> do as well". Great loophole to squeeze poor stuff to the kernel, so any
> such argument is for me a warning sign.
> 
> 
>>
>> Notice that I have also the stm32mp2 SoC to upstream expecting to have
>> similar compatible:
>> - st,stm32mp1-m33
>> - st,stm32mp2-m33-tee
>>
>> Depending on the compatible string, the hardware behavior changes.
>> With the "xxxx-tee" compatible, OP-TEE also manages the isolation of
>> remote processor resources (memory, clock reset, peripherals).
>> Without the "xxxx-tee" compatible, OP-TEE have to ensure that the Linux
>> has the good access right to manage the remote processor.
> 
> Still the same device, no?
> 
> You can have a property defining how Linux should access such device,
> e.g. because FW does this and that.
> 
>>
>> For instance if st,stm32mp1-m4-tee is set instead of st,stm32mp1-m4, on
>> linux side
>> - only memory regions used for IPC should be declared
>> - memory regions containing the remote firmware must not be declared as
>> not accessible by the Linux ( managed by OP-TEE).
>> - resets must not be declared ( managed by OP-TEE)
>>
>> You probably don't remember, as it was a long time ago, but we already
>> discussed this point with Rob[1].
>> [1] https://lkml.org/lkml/2024/1/18/100
>>
>> Do it still reasonable to you and Rob or should we find an alternative?
> 
> Get ack from Rob then.

A previous acknowledgment from Rob was given here: 
https://lkml.org/lkml/2024/2/22/1264.

What frustrates me is that, if the compatible usage is no longer 
accepted, I have lost time basing all my other versions on this 
assumption. But that’s part of the game, and this series is already a 
concatenation of redesigns resulting in version V21.

My expectation is simply that you and Rob provide me with a clear 
direction to move forward.

The compatible string is one topic; I also need an acknowledgment or 
rejection of the concept of using a phandle to link the remoteproc 
driver with the TEE service.

Thanks and regards,
Arnaud

> 
> 
> Best regards,
> Krzysztof

