Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD314367295;
	Thu, 15 Oct 2026 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078300; cv=fail; b=BuufHSc+0MZD15Fg8YKKpN6rmpHtHTWJBlnTdzUVZEN+QLBdxnN4mLLA81dSmqfJIVYnQOqwInFx2RMoo682BApUptjE6by39cfY7zwiZXQK8oTVoEb/KXsiaTQMemFnlcnb9PcMPTd5Zr9vhNWe8ZY+at+Ljmfgj342HsI1mnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078300; c=relaxed/simple;
	bh=FIlQdFFR5WsMvG1RMqwCa614z5U0UOhqcFJfk2oUt+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SX44FhMr+IYmbqBnztZIiJhj8wIBC0qfB/5cMNd00SLCDLeExPbcyki71g/f9LPGMVyJovYUMW1IGYgkvUqRV2+mVpFq+w/VhCcE9TMyLQLGAMN7xA5hAwSbsDNXZ8sCdvypkf8fTqGSsogrJm1sFCZiiDP4RlA57PMdQXwRdF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wzAAn5rL; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wzAAn5rL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSsMyjH8O+gFEeCE8BesdMmUmAKtVqlGyJu1PDyfVv60Hg2fyOw2hU/ZyAp5ytazNCWc4XihF8F2AMm3UzE7ZSzN2sk3CKPzpfWMm1kLjxrKqBKhQ7LjpNIianGYQgM+wnju9GsHEAMDVHDm6gWkvGboLgC76vU6Ow7x9FsY+v6PovlmrCk3+AfNnvJgR/BAV5ogE4gXxV7rByFfUGJgWQKsYcxNx06/6qrt0opnc81vTwAhMayizQNF+UrrdC2VD/ja8IZv2urkrkx2bhYmtKxiqz9oxd2jFUawRSl5oz2Phtme71cgtwNwueCpGLgY2207KSR/ntAQ6bG2c30njQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1krrUAZwt+7VVMHUNs7D/N28ZRN8NYC+XdbJ7kJ0OGg=;
 b=VQhNyo3yGm7ZrP+m/GS3doXuqj7M/GoJbXo3vVx2SqSlTBW4M8P90OB663So4csk5ZuGuaFBB0WkBgcPCPuy6xJqIt8KIaEwcjoyepzR2CaasHsZ4iM63BCbI1c3cSRx5IKP5YI6g6eI5aEztcj2JKtJ/p2GEdXLupDC9GAA3KmGM0EFT9WEVwD6avJCWX6vFDQFtNQvRIpdqm5vDxzSNnmElq8xJDg4qC9grKsEQHRzNldFWO6lqe18tOd24AIJruEJ86xRAkp8Y1eHkTZfqrm68Y9oM5btCXm0padN9004Hj1KOjstfOglUzL0DjaHCzGhHMbjLXA7yiEMZLMrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1krrUAZwt+7VVMHUNs7D/N28ZRN8NYC+XdbJ7kJ0OGg=;
 b=wzAAn5rLT2T+Y8nwovcy6kuRx2Rao/iJdzM89ykYUNxg69QBbkbvFC5X0q/QsjvjakPqVJaP8aO8WdLyayMigoD+vnosSqqquc+4kk8N3UFjGqHQEBtUERDrMelAJQL5ZRYgSUPMn7a/XQULr9qm67+hjjMapu6aQnW7JvR2AHo=
Received: from BN0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:e6::28)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:31:23 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::35) by BN0PR03CA0023.outlook.office365.com
 (2603:10b6:408:e6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 15:31:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:31:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 10:31:16 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 15 Oct 2026 10:31:16 -0500
Message-ID: <0df4bfd4-2bcc-42fd-a22d-e704e4b41d5f@amd.com>
Date: Thu, 15 Oct 2026 10:31:15 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Ben Levinsky <blevinsk@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"andersson@kernel.org" <andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Shah, Tanmay" <tanmay.shah@amd.com>,
	"Levinsky, Ben" <ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
 <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 0730cc81-9e32-4275-5122-08df2ad15ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|82310400026|1800799024|56012099006|4143699003|261009223027099003|11063799006|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	bcPbL/pNUViwvQNdFAphKSjlXiZw4fksEpIcZJJkljCBiMnOAhD13qoPtSNiJeKmOp5CiFSUuUtTkKEE0ljtvUy5KIkdbPqxWr+plFaOUnLqVZpNCYQ1qHjKc/WM5QkgrRq53cLqXhhQMfhkmI9ASQm9AHhA9UjS5jbEWOmCvFy3aaGnV370K8ezunXdhcvEKXWNRDZfPvLae73fnbSqBW8OBuxt8x68LqGaI7rygp40TNguvYb70SDd0dRaQCoqLU/9bWAKj9Uoh/y18SylRtwYwHCw/zu/JDJOXNtjqVIqkTaEcPH5l2mzLaCGYkHsGfhe9z/0NW4nMdVWm2R/W8U+TpYammZBVGNWBpnjAPhtlZOIX78Ww8HwSWRE2UUxANPqygybW/S2Ej1Qv6hZw8FcU7Yr0qu24TUeYs0lPqsmE0lsOaTJKrmBQGZtR/x53zAXYV6n52sKnzL7RvattidSnIKihrLGTB9HeMO7aFOl3yQNu4jw/9iO/+kJo3h3CKp+4FslsCul8vrHf1mz1CA1g3VDG32elvFy4wPCMxwoVhc2iRS3SdplN1fFeUReM3gWYXF8d8SYksLCbPRMR2Lh7ji/7s2XLhgW0YpgkNC+gOaw5d51nHXQML2VxZbjnA/6M9RtJ8M9SY3XNx5qQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(4143699003)(261009223027099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X55LbwWFDGbLbuBuMyp9bOSLqMyZKvfyeNTjat0MqygfykC5kUXDlIC6saDoE97jesRFQ5aB4MxpyT9CIv5owRK5hGDV8nUysfYvVBHIQNeS2BF3b8KaZ8k0iS0C07Ej7Hs4G4R+7muGCQsW7PbT5sS1+OPvMrc3mcOtXn5Qvz7ZvyCuo89bgECqcb1O7vRLbBE5jFFG1eU3IPQfYtsIcPmpnbTvuUVJOFkR8F1bxqisvlhNd5MJADnf34GrYCsGvT/Y457ycXY+G0V7IcwVeXOBj9dZY4knarQwtsXU7p1CnyJ0uW5laaDSUsNOu9OreUPI+CBynIbE3DALEJMCCR0y8A+VNayKSBcl9RvQfiwciGfgBwzJewXOawVEix52VzAbY7u/PkXLK6tLe0MGwVgbwRvQ16Eh2UuAwNTFdAKOrhaO8TVKFnsFbUjKkR3W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:31:23.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0730cc81-9e32-4275-5122-08df2ad15ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137



On 10/15/2026 9:29 AM, Ben Levinsky wrote:
> 
>>
>>
>> *From: *Krzysztof Kozlowski <krzk@kernel.org>
>> *Date: *Thursday, October 15, 2026 at 2:46 AM
>> *To: *Levinsky, Ben <ben.levinsky@amd.com>
>> *Cc: *jassisinghbrar@gmail.com <jassisinghbrar@gmail.com>; andersson@kernel.org 
>> <andersson@kernel.org>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.org>; 
>> robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; 
>> conor+dt@kernel.org <conor+dt@kernel.org>; Simek, Michal <michal.simek@amd.com>; 
>> linux-remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>; 
>> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm- 
>> kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux- 
>> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Shah, Tanmay 
>> <tanmay.shah@amd.com>
>> *Subject: *Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
>>
>> On Wed, Oct 14, 2026 at 02:34:23PM -0700, Ben Levinsky wrote:
>>  > Document the AMD programmable-logic Mailbox IP used for bidirectional
>>  > FIFO communication between two processor-facing interfaces.
>>  >
>>  > The same IP is used on ZynqMP, Versal, Versal NET and Versal Gen 2.
>>  > Name each SoC in its compatible, and use amd,zynqmp-pl-mbox-2.1 as the
>>  > fallback that drivers match.
>>  >
>>  > Define the transmit and receive channel indices together with the register
>>  > aperture, interrupt, and interface clock. Describe the FIFO depth chosen
>>  > when the IP is configured, so that the driver can size received messages
>>  > to it.
>>  >
>>  > Assisted-by: LLM sparse
>>
>> How sparse assists here? It's something new. Since when does it parse
>> yaml code?
> 
>   Hi Krzysztof,
> 
>   Thank you for the review.
> 
>   You are right, sparse was not used for this patch. It was only run on
>   the C patches of the series, and I applied the same trailer to the
>   whole series by mistake. In v2 the binding patches will name only the
>   model, and the tool list will match what was actually used on each
>   patch.
> 
>>
>>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>  > ---
>>  >  .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       | 74 +++++++++++++++++++
>>  >  1 file changed, 74 insertions(+)
>>  >  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml
>>  >
>>  > diff --git a/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml
>>  > new file mode 100644
>>  > index 000000000000..2cc0d106b888
>>  > --- /dev/null
>>  > +++ b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
>>  > @@ -0,0 +1,74 @@
>>  > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  > +%YAML 1.2
>>  > +---
>>  > +$id: http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml# 
>> <http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml#>
>>  > +$schema: http://devicetree.org/meta-schemas/core.yaml# <http:// 
>> devicetree.org/meta-schemas/core.yaml#>
>>  > +
>>  > +title: AMD Programmable Logic Mailbox IP
>>  > +
>>  > +maintainers:
>>  > +  - Ben Levinsky <ben.levinsky@amd.com>
>>  > +
>>  > +description: |
>>  > +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
>>  > +  between two processor-facing interfaces. Each interface writes messages to
>>  > +  a send FIFO and reads messages from a receive FIFO. The register aperture,
>>  > +  interrupt, and clock described by a node belong to one processor-facing
>>  > +  interface. Channel 0 represents transmit and channel 1 represents receive
>>  > +  for that interface.
>>  > +
>>  > +properties:
>>  > +  compatible:
>>  > +    oneOf:
>>  > +      - const: amd,zynqmp-pl-mbox-2.1
>>
>> What is 2.1? Your SoC has different versions?
> 
>   2.1 is the version of the Mailbox IP core in the Xilinx IP catalog
>   (Mailbox v2.1). It is not a SoC version. The IP is synthesized into the
>   programmable logic, so the same core is used on every SoC, and the SoC
>   names in the compatibles do not add information.
> 
>   In v2 I will use a single IP-versioned compatible, "xlnx,mailbox-2.1",
>   and drop the SoC-specific ones. This is also the compatible the Xilinx
>   device tree generator already emits for this IP.
> 

Hi here is the reasoning behind the name:

We use 'amd' vendor prefix for all new drivers & bindings. Also, there
is dedicated IPI hardware which can be used as mailbox too, and we
should distinguish it with this PL mailbox. So I that is included in the
compatible string. (pl-mbox).

If we are also to include SOC name as well (per compatible property
guideline), then we should include one of the SOC name as well:

So, I think 'amd,zynqmp-pl-mbox-2.1' is good.

Krzysztof, are you okay with above name? The 2.1 is FPGA IP design
version number and not the SOC version number. So in future let's say
that FPGA IP design is improved then the name (pl-mbox) will remain
same, but only version number will be updated i.e. (from 2.1 to 3.0). Is
it okay if we explicitly mention this in the binding description?

Thank You.

>>
>>  > +      - items:
>>  > +          - enum:
>>  > +              - amd,versal-pl-mbox-2.1
>>  > +              - amd,versal-net-pl-mbox-2.1
>>  > +              - amd,versal2-pl-mbox-2.1
>>  > +          - const: amd,zynqmp-pl-mbox-2.1
>>  > +
>>  > +  reg:
>>  > +    maxItems: 1
>>  > +
>>  > +  interrupts:
>>  > +    maxItems: 1
>>  > +
>>  > +  clocks:
>>  > +    maxItems: 1
>>  > +
>>  > +  amd,mbox-pl-fifo-len:
>>  > +    $ref: /schemas/types.yaml#/definitions/uint32
>>  > +    minimum: 16
>>  > +    maximum: 8192
>>  > +    default: 16
>>  > +    description:
>>  > +      Depth of the send and receive FIFOs in 32-bit words, as configured by
>>  > +      the C_MAILBOX_DEPTH parameter of the IP. Must match the configured
>>  > +      depth.
>>
>> So you have multiple mailboxes per one soc different in this?
> 
>   Yes. The FIFO depth is chosen per IP instance when the design is
>   synthesized, so one design can contain several mailboxes with different
>   depths. The depth cannot be read from the registers, so the driver
>   needs it from the device tree to size its receive buffer and to limit
>   transmit messages. In v2 I will rename the property to
>   "xlnx,mailbox-depth", after the IP parameter, and state this in its

Please use 'amd' as vendor prefix, also keep pl in the property name:
i.e. 'amd,pl-mailbox-depth'.

>   description.
> 
>   Thanks,
>   Ben
> 
>>
>> Best regards,
>> Krzysztof
>>
> 

