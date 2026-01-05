Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9D22068F;
	Mon,  5 Jan 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767592620; cv=fail; b=sTYaVU5m6qPBmf9OjEj4IzOVxD5R5KZzPPXpeGLGjHlS0OQOt+PmxfquyNi4FX0ZBTa2hxdKJbdFnTg5JPxn9tcpdC/dq6vlSkZRHUxpfsCxUE/9jfDv3QqZJgNvWKyLX343JeAM48q1SiePdqLs9o4fIX17xv8Q5NvTZFNFAXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767592620; c=relaxed/simple;
	bh=m7FEty3yQ+aczUlI6VNU2Q1Y/pLmGSTIczrJQ4NU/jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aAvxaKYQxATUwYU0Mb7gmXuZ1QOXzfbI8mLfvawVvI7iPxdVUwfVcuTQl8v6FxNCMpPNMKOR+7j5oNcx00ePalq3SBgk3r9y/2R9Q0TeUiY/Uj/7UmYZY8/P0eorYdJo7FtA/IDzg9orCb6uFUQCrILCRCPa78KfcPEhFeyO6Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QEybuKm5; arc=fail smtp.client-ip=40.107.200.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QEybuKm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoGe74BUjN5q+8szxObuFTKZsJ/xW+9l1QE/mKIKSteWvDpj1SIa8FNfsqmEOvIwnNe3nD4PcAKPeK/am5VDnomX4VDn6fgnZ4tnMUt3rbLdTwykdRNDeSDY0hnF7a6vor6hAB343LLPdwTx57MW37barS8/DQlRrLlo77WPSkQHQAZVeH+6grZJrD80i/fETf97wGgzKcALiMBTQlEEtyw56/LiMj8yxn0c71Oc7VLNERvI7R66WsR1tEypKN9w9Ct3ctuU86yZJK9TPj6IJ+kUUPWAerxvn8spiGHjUPBgFcs47aQrpSBDg5mvKquMGFiDVLkb6i51UiXjxSMnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUUSyHEFYrwMlRpW4rGNy+nlElrxdQJdIpRlp5HRuQ0=;
 b=L0Lohooubm3dF3H/cY4B8LNlTN9V4gokI/dtiikijLwFfhNQGjx445qOdZnPsYPLkjyToJfDyBaND8z6/DCV0+wy7L6TzoHDYw7jEnR73/md7KnWT3twjFMe7vpiQDuFXZ4U9WnwzQXwOeA+V1DfukbCOn0Q2XxMnuAwDHsM1YFrMgRXojimFgQx7j7ATLg4B5IGcXF+eAkIw7PMRneE/mOQd1T/ZXc+kFM7JBeUf++yo7EnrD6abUzaBpxLoLhJYHvZw9i8raj7T9IjFDjB83dJaQ3Qsbl7qsNJoziEbG9rbbbLk/204rnt4ZIguFijnd7I2B6DELyJ3wZiG9bVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUUSyHEFYrwMlRpW4rGNy+nlElrxdQJdIpRlp5HRuQ0=;
 b=QEybuKm5o4rvF1QoK0JLhkUH6ZL0cpuy1MA37kg8/0fwm4F8e7CtAV82fGggUKaeWmCFXca+qtEm3WD2vrDMUBMe0/zSG4NGyU7SmXgb62LWESBeuL6DxmzgRVG6LzvB/i4aQ88wG58Irinv7+3btQ0vhAcrf6J0F4H03Bavk/8=
Received: from PH8PR21CA0022.namprd21.prod.outlook.com (2603:10b6:510:2ce::7)
 by SJ0PR10MB4750.namprd10.prod.outlook.com (2603:10b6:a03:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:56:55 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::35) by PH8PR21CA0022.outlook.office365.com
 (2603:10b6:510:2ce::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Mon, 5
 Jan 2026 05:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 05:56:54 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 23:56:50 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 23:56:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 23:56:50 -0600
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6055uise739065;
	Sun, 4 Jan 2026 23:56:45 -0600
Message-ID: <3ac93229-3c37-4800-8e56-cbab13d4299d@ti.com>
Date: Mon, 5 Jan 2026 11:26:43 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core on
 TI K3 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20251231165102.950644-1-b-padhi@ti.com>
 <20251231165102.950644-2-b-padhi@ti.com>
 <20260102-shrewd-unnatural-lynx-b7d214@quoll>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260102-shrewd-unnatural-lynx-b7d214@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ0PR10MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f71464-4fbf-418a-fe77-08de4c1f3a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzJrUjZoYnkrMk96bnlkT3dGa1k4cHhDVElkakdmNGR0bmdKQllzN1VDaXU4?=
 =?utf-8?B?QzBOMkhYRWVwb05aNmFYcWdSK0lWNEdFdDk2Y3lmWXRjaksxVXBZbldsdTdY?=
 =?utf-8?B?NHVhcUtRbjk5bUJiNzcvWURxY1BkQ2hodFczL3k1V2huc2xYZnV2eWxhbmp4?=
 =?utf-8?B?V2hCSEtQclhydGJUWTVxUXZNN0p6Z0lBbXBobWZGeWtuYmJaZUpPM0ZFL3d3?=
 =?utf-8?B?dXp2UW1OdUJSYnZuMkttT0YxZ1dXcUo4YUtTa05sOG0vdnB0aFZkNkxxb2Mx?=
 =?utf-8?B?WEtVeTd2b3JJZ1lWbTZZY25wak90cGphbzZZUzR2b3FHbmRRM1pkVkgzcjZG?=
 =?utf-8?B?YXY4S05PNnJIbFZaYWxtNXFRcnREQWtNNE5Nd1REREFObWI1ZjVuRVU3OWla?=
 =?utf-8?B?YzFWY3U0NjNoMGhpby90VlVxc0VpMzMvY29pTk1XTEZZdGVoTTY2b1N5WHpq?=
 =?utf-8?B?WEx1NVIxaFNEN295dEo1RUg2aSttUDY1SlgwTEo0WW1lb3ZVUk10THhuQUUw?=
 =?utf-8?B?VjhDYUJhYUpRMHZsK0ZzME9MUFNRMnMydmxscEp2RFppTEpCcVgvSXBySHVu?=
 =?utf-8?B?bFZZUVlubFVKenROa2JoQUpnNlpQZU5KdkJMK3VYb2Y4dzhycStaOURQR2s2?=
 =?utf-8?B?WFlRY0RUUHNoWmF6Q1hGNkRoSS9zcmpKMTJPWUZRd2JKVWxPVVB1WFo4aVlv?=
 =?utf-8?B?SjU1UWFrYXJEcDU3dTlFVE43cHlYT3d6eFZqUmhaVlI5S284Vm1rSlordGxZ?=
 =?utf-8?B?bVNEZlljWkxhWU92V2taaGxyejBJRXhQcTJKZ1QvajZoYzVjd0VUYzBRZ0VC?=
 =?utf-8?B?M3ZsVU8xc01VR1RhSHN4ZkFEdkdPZmVueW43OE1XQ3JPTzFyZ1h1MmNQZnR1?=
 =?utf-8?B?WGRja3E4QWV0RUZzUWRqUTFmS1YxNmhuRXJOQVF0TmJQYzZndHNJTythdG12?=
 =?utf-8?B?dkEyOHNnWWtKdUhsTXhLT0lXR3RleEFhMDM0bUp1UzZaVHovUng5dHpsbmxj?=
 =?utf-8?B?M1R4aFFtSHY0clN0TlJHTUtrNDZmTHZiRjF5VVNuM2VjUmRLdkRSVFFMRk9p?=
 =?utf-8?B?TXMrOWVpSE5BTUNiVmZkQnBQOFhhUDF3amwrWUR1YU8rekNxMC9iL0pweXc0?=
 =?utf-8?B?citLL01yV25zdVFPUUsxeHRVVnpxM0t6MUlTcjJ1VTlBYmhSUWIxMHB4ZlFm?=
 =?utf-8?B?Vmx2VjBCRm5VUlY3UzN6NzZXeWFMYVZncDBqcTBSSnhsYkJLN0RLL1hzV3NM?=
 =?utf-8?B?S3ozN3hCVzE4Z005L1N1NTFkTlgvcnA5VVp1RFVOMm9YOFZUMm9vY1JWaGtH?=
 =?utf-8?B?MWkzaWJXSHpSbkViZkFMQVIxM0I4cXYvcVZNMzlNclRnRE5sQTVmUWJHTWkw?=
 =?utf-8?B?YWJPcWYrUFNGalpMTVArUmtVREtuNUYvd0E3dlMvT1dCeUdtWUMzbFRQSk93?=
 =?utf-8?B?SzFKTExSYXNBTnhoTzc3bkdLUEpRdUtlKzlZd2ZxdjgxNFBOV09kK2pIaDln?=
 =?utf-8?B?REExVFFuTDVHdjdWOThSZktQckZOdk0rSC9Nb2FicXRZcHNMbWVHZCtWdWdm?=
 =?utf-8?B?dDUyTEllSkJUd21XMHJpRGFHNTJaTlVmNHNNb1JmQXdzWGNaa2M0djVzTXVn?=
 =?utf-8?B?eDcvdEJFbXM0M2hLYUdWVkJySWloemY5cE5JQzZmWFVtaWc0dkpNamI5b2dE?=
 =?utf-8?B?ZkdWRkQrMkRZM0RIMU5aMWRVQytEclZ2WmJEcHgrVTdaMFV0dlUwalNyOGRG?=
 =?utf-8?B?cDYxQ2VNSFk4dVQrK2RUK1k1MVkxU1BUSVhiTVRyWlJyTkd1S3RUM0U0OWpG?=
 =?utf-8?B?VTE4S25LaWh3bjdQai84OVlZWlFjU3Y1b0xPS1NJa3BxMVY0MWRxWkVmSnF3?=
 =?utf-8?B?bFJ6U3h5OHNja0I1SWhrQWMxZk4wVFRKUFdpckZDRXg3Z3pYTGxSRC93TCtp?=
 =?utf-8?B?MTBXdDJFMzErMXN1ajkzNkFGL1R0dURESmtHMGt0Y2pXZXI4VGFMby9hYlQx?=
 =?utf-8?B?V3RNV3dSQlBaTVZwS1kzZThQQys1Q25jY2xmQ0c4ZU9JMzN4RThSaTQvd2Ns?=
 =?utf-8?B?V2g1eXppOEc2YysrejB1VUd6ZmtmUFYwd2NPUkNlY25ubmJucG02WGI0bVZw?=
 =?utf-8?Q?StoI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 05:56:54.3563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f71464-4fbf-418a-fe77-08de4c1f3a9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4750


On 1/2/2026 6:00 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 10:21:00PM +0530, Beleswar Padhi wrote:
>> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
>> core in the Wakeup Voltage Domain which could be used to run secure
>> services like Authentication. Add the device tree bindings document for
>> this HSM M4F core.
>>
>> The added example illustrates the DT node for the HSM core present on K3
>> J722S SoC.
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>> new file mode 100644
>> index 0000000000000..f61e4046843af
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
> Filename must match the compatible. Are you sure you are following
> internal TI guidelines? Did you read them?


Will address all comments in v2. Most of these issues exist with other
upstreamed TI dt-bindings as well, will send out a separate cleanup
series for those too.

>
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/ti,k3-hsm-rproc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI K3 HSM M4F processor subsystems
>> +
>> +maintainers:
>> +  - Beleswar Padhi <b-padhi@ti.com>
>> +
>> +description: |
>> +  Some K3 family SoCs have a HSM (High Security Module) M4F core in the
>> +  Wakeup Voltage Domain which could be used to run secure services like
>> +  Authentication. Some of those are J721S2, J784S4, J722S, AM62X.
>> +
>> +$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,hsm-m4fss
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
> Why do you need these two properties?


Not needed. Got carried with from existing bindings.

Thanks,
Beleswar

>
>> +
>> +  reg:
> reg is always the second property. Please read DTS coding style.
>
>> +    items:
>> +      - description: SRAM0_0 internal memory region
>> +      - description: SRAM0_1 internal memory region
>> +      - description: SRAM1 internal memory region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: sram0_0
>> +      - const: sram0_1
>> +      - const: sram1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +    description: Name of firmware to load for the HSM core
> Drop description. Can it be anything else than name of the firmware to
> load?
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - resets
>> +  - firmware-name
>> +  - ti,sci
>> +  - ti,sci-dev-id
>> +  - ti,sci-proc-ids
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        remoteproc@43c00000 {
>> +            compatible = "ti,hsm-m4fss";
>> +            reg = <0x00 0x43c00000 0x00 0x20000>,
>> +                  <0x00 0x43c20000 0x00 0x10000>,
>> +                  <0x00 0x43c30000 0x00 0x10000>;
>> +            reg-names = "sram0_0", "sram0_1", "sram1";
>> +            resets = <&k3_reset 225 1>;
>> +            firmware-name = "hsm.bin";
> Make the binding complete. All properties must be listed.
>
>> +            ti,sci = <&sms>;
>> +            ti,sci-dev-id = <225>;
>> +            ti,sci-proc-ids = <0x80 0xff>;
>> +         };
> Messed indentation.
>
>> +    };
>> -- 
>> 2.34.1
>>
