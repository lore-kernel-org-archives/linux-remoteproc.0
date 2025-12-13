Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA61A2C25;
	Sat, 13 Dec 2025 05:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604571; cv=fail; b=HcLKbdt6cOKgVWvwIGMvQVh4v4guI3Rfat6lAmtSFZnOUG3YOel8uV2mnr2OUG6Qda9X06fgNxCoDsW4w8BB8v5Wy/iiwmf4FDQbcy5mJrd4nzuPdMoZpewszDmhdsfoPt/KMY9db6sYotrsGm5kA/PDNYwu/0PlKEwabJRdCbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604571; c=relaxed/simple;
	bh=Xi9m7Ki/gHCy6u6DZahEpRiYbZ75IpEkKPhwcg52mHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OOSwkhtyuYurUBNeHX4galoo9L+8eY7ja0KqyMd8r//8lFNx1Mxt/XsOoNht3D+cz2AyewNs0BXZtyEPMeCM0UGCWJbH7fGphc3FonMzlC755b40tTTJrOiOY0kSYbM+3CakJF07sXFYdSO0DNIDrrXbqxJVB+coFeIgQV40MeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5rLSPGOR; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5rLSPGOR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+tSo7a8PEyEnlpLWMeusH6REF3WN5SuxgClS67fsc1RH9Hrl8/tk+3YMmoWnj1pq1xakGLdBbbjtdjZN2Mzv60VSR0n/Hj87oWbZg0XgxOsyAL9f7ugkLtXNBqp/JFzDun6WOxmAcIRRJwRNDkQw17IpjLrMUvIDM+CUbYKR0GjHceYs2adTXogUhXqvUWiguuRQHvKO3dgBYLI+hF0lhunNRzvznTQURbAJb7yIPNcEdvpi7nmZ+756iRHBbOVQdX6jehUb5hXU3aBHSb3S8QJ3/3EtDGbsn6MEBAx0o7MyShlX283C6iFhLufuww1bagJ4Q79AIsmTxGf22LZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubVWnJAWFEpVJqVUd/lqngHglXBNr7VzgW6XQDeQRNc=;
 b=LkT8e5irvM/H9Y5E/hIOdg8To0/gnsIpmwkfVeN9WEsVSEGeEO4pvSJ5nB7II1syUFaDRc0Mttxv9jfiBDOGrcB0xiAamgnWrZiBvsD2MLoTlkpEboXVjEkTkuM3zpeDFUdrW5njgxL/NPCfb9+NqQ7AhXItNyvdDk3WQ62n2eEviHObGsFa/L0DResUB7+JbRW7HwyTKZWtd+Femc9IEfPtoByZ6m4QhTc9n4uYzddIedhxPKJw1iMbVS27Vr1b85eg7WrB3oFPNuEhf9qdngVjj+tCecsg+7YjaVzJka2C0aNPHmgZ1siKK3I6uAs6bSc7nGBXSlsZKUEM66B10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubVWnJAWFEpVJqVUd/lqngHglXBNr7VzgW6XQDeQRNc=;
 b=5rLSPGORkm4DtcvTtpumCCrts3AaAkse7q+ORF7pbuqs0b1Bb7ETGeUkDvufzJHXwfTBvSvr4ux1v8C5cwlhYjg9lr+Javf0n2NvAZMYC1av4LZwSoqSQ1v7BlI42OO0JYiEs3x+/+tvl7bj/GZyMsKJDv+ZZXsVOUlkvE034SM=
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Sat, 13 Dec
 2025 05:42:44 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f2) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Sat,
 13 Dec 2025 05:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sat, 13 Dec 2025 05:42:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 23:42:43 -0600
Received: from [172.31.132.204] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 21:42:42 -0800
Message-ID: <41cf749c-0f57-4470-adfc-147c79bbd795@amd.com>
Date: Fri, 12 Dec 2025 23:42:42 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: f50ac805-e095-4c13-1777-08de3a0a7069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTdnbFdRSUNybGRDUURSaFh2MGdKT3VrdkZEOUQrbkdjWmNSbmZMRnZnK2sr?=
 =?utf-8?B?TUNNc0ZKcm4zNzFISitWdktXZW5XeHJDbUtwakhOY0t2N05YSE5odGdyZUM5?=
 =?utf-8?B?V2N3S3ZWN0dOU0VldGtDcHREY2h3czZrSmFSZ1RacHJuT0VPR2haNE16RUMr?=
 =?utf-8?B?YThEVlVBYkU1Zmo5dzZPS05jVjg1MitrcFRBNGlmL1FVbENDVWhxNTBiYVhF?=
 =?utf-8?B?R0ZFdFZiM0pzOGtXZTVSd3U2Zm5FVFJyZ2tBblFYS3J4UVc5K0dDTURIUGt6?=
 =?utf-8?B?WVBnWFF4MllLbWRsZkdhYTc4UVdpNFZlNXNMZFpxVG1zSnR4d05GZXFKajNk?=
 =?utf-8?B?dy9zZVBFTnhzTXNFNjZYTmo0RklBdGxxZWM4SFhUdFVUMHVnbU9tb3IyMWV3?=
 =?utf-8?B?OWdtZmtqbDN6Q25iUVU2UVVYcHhtenFyeE82MnRMWmN2Q1VhZXBtR3RzMzgv?=
 =?utf-8?B?Zi8rNWt3RXBudUVtbHpFY0l0ZmIvNHJ1OVliNjBKM2paemxUdVJWaGxPZ2NF?=
 =?utf-8?B?OEg3b1VLa2p4YXZGYWFiVmR3c24zQnlwRkp6RVhzRnZsS2FJZXBWUExwZzR3?=
 =?utf-8?B?N1IrTFBab0VRcHBlMzlVRzErRUdRdVVkME5rUEVsMjVwZWdzMUNRcjVLVnNP?=
 =?utf-8?B?eWJUTFBWK0p3RzBWNmNlTTh5dTNvQkZoQ2R0T2hHTHlKYnUxQUhwUmVGeVg4?=
 =?utf-8?B?aVBmaFZySE5xbHYweWorcE9NM1NKRnhJaWNFaGF2a21YTDRZbzdLSTEvbGJh?=
 =?utf-8?B?czlmV1JqbHBBVUpKOFBpOWVGcFVycm5ncWg5M0Z0VVdUN3FKR3ArR0g5MXA2?=
 =?utf-8?B?WUFsYm1kV2Y3MVYvODhsMTF3UU9SQTBxdFVPc3pEb1ZhWkdLclI1SnRGWnFP?=
 =?utf-8?B?Q3pKajBOWFBabWI1ejV3VTlEcUQrSER4WHpHZjdpS0NrWFpTdUg1TlZnZlZ4?=
 =?utf-8?B?bis1dGIyMFpFajJOVXhhaHRRb1BMbkhDeHAxT1EzQUw4cTkzYjRjZjRScVA3?=
 =?utf-8?B?aitiY2tsVGw4Z3UyMFcwdmdKK0pOb3lKSDNoT3FQUWxrd1RuMDdYNDJGcVJO?=
 =?utf-8?B?dmY5bUx0cCtObnIzYmpDekVzM0JkaDZRWFpsdlo5YW1PVlNKQkpYbFlyMHNl?=
 =?utf-8?B?cHJDRTJOR0d3b2QwcnNDMnE3V0RpYmtCaUFzdis0QU0xQVlweW83QURXa2Fh?=
 =?utf-8?B?Z3lvOHJ2SXArOW9idmhQYUl5UFl6OXQwbXRaZWtza3FVaHNBZUpLTkwzeHNK?=
 =?utf-8?B?ZzFNT1RLbDRSdnVzMERsTXZQKzJ1WlZyZ1FiZktIczVuUWFoS0FpSEdPYXVa?=
 =?utf-8?B?REdSeFFjUDAwSjJsSjZKZDRtNmdZQlVid2p4TWo5RHhXOHc4bEFjVSt5YmtC?=
 =?utf-8?B?Z3NhZm1tVWU4S05hNUFJNC91VlY2UFN1a292a2wrTEFzZkh4UWdwMlBRWExy?=
 =?utf-8?B?NkUrcVBHendKM1MwVDFPSThuMkZMRGUxK1FtNkEwNXdEV1gyOFBWQjBVanVY?=
 =?utf-8?B?WGhWaHVrU085SGlzR1Y5L2gwVFNXWFpFUWJGK25jNTV0L3BLenZ4bThZY3Fn?=
 =?utf-8?B?VUF3THdtVkVTNkFycHNlSnN3cDI0d3BSOW1rNi81bjBDWFNmdXh5VmpPdjRv?=
 =?utf-8?B?aTNZN0I0Q082emtUb25tejA1WW1tb1RpdTA3eGROUjg2RzBPWmlETzRkZDgz?=
 =?utf-8?B?M1k3c0FRd1U1YndlOEprb29nSUlEbWFiWFlmbjF1MzI5K3RlV2NmVWM3Zlhi?=
 =?utf-8?B?RDQvK1BpRTVWVFVkYXFVbHVWN2lUNjE3QnV3ZHBrcFVSWll5WUlSWU5mT0hn?=
 =?utf-8?B?RElBRGQxQ2hCZFNEZHBJZUM2aytkSzEvQXhEVjFTR2xNMWdRZTNLYXZSRnNz?=
 =?utf-8?B?SFptVDBCS2VLMlQyZ21zOSt3NmRIVGRORTJ6TGVmSUhwcGNRSlRlbFBJVytU?=
 =?utf-8?B?Q29hZ0JDS2ZUMG9maWVvNDVoRlc1ZktIL3BjcUxjWXF4VUJyRmlwVlIyRFFL?=
 =?utf-8?B?dC9QeTEzZzFWMDJWV3pNNlY0dDY5OW5kYldGcnVEL2NOWDdsZ25Nd1YxQm14?=
 =?utf-8?Q?73ypFk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 05:42:44.1861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f50ac805-e095-4c13-1777-08de3a0a7069
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084


Hello, Please find my comment below:

On 11/21/25 8:21 AM, Valentina Fernandez wrote:
> Microchip family of RISC-V SoCs typically have one or more application
> clusters. These clusters can be configured to run in an Asymmetric
> Multi Processing (AMP) mode.
> 
> Add a dt-binding for these application clusters.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  .../microchip,ipc-sbi-remoteproc.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> new file mode 100644
> index 000000000000..348902f9a202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip IPC Remote Processor
> +
> +description:
> +  Microchip family of RISC-V SoCs typically have one or more
> +  clusters. These clusters can be configured to run in an Asymmetric
> +  Multi Processing (AMP) mode where clusters are split in independent
> +  software contexts.
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,ipc-sbi-remoteproc
> +
> +  mboxes:
> +    description:
> +      Microchip IPC mailbox specifier. To be used for communication with
> +      a remote cluster. The specifier format is as per the bindings,
> +      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +      List of phandles to the reserved memory regions associated wih the remoteproc
> +      device. This is variable and describes the memories shared with the remote cluster
> +      (e.g. firmware, resource table, rpmsg vrings, etc.)
> +    items:
> +      anyOf:
> +        - description: region used for the resource table when firmware is started by the bootloader
> +        - description: region used for the remote cluster firmware image section
> +        - description: virtio device (vdev) buffer
> +        - description: virtqueue for sending messages to the remote cluster (vring0)

This is in-accurate as per the implementation:
https://github.com/torvalds/linux/blob/a919610db43b34621d0c3b333e12db9002caf5da/drivers/rpmsg/virtio_rpmsg_bus.c#L878

Also the implementation can be changed. The description doesn't need to mention
if vring0 is used for rx or tx.

> +        - description: virtqueue for receiving messages from the remote cluster (vring1)

Same here.

> +
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      anyOf:
> +        - const: rsc-table
> +        - const: firmware
> +        - const: buffer
> +        - const: vring0
> +        - const: vring1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - memory-region
> +  - memory-region-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Early boot mode example - firmware started by bootloader
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc {
> +            compatible = "microchip,ipc-sbi-remoteproc";
> +            mboxes= <&ihc 8>;

In the driver, this "mboxes" id is used for powering on/off remote processor.

I think, "power-domains" is more suitable property over "mboxes" for this purpose.

It is possible to only load, start and stop remote processor without any
communication. So ideally "mboxes" can be optional, but in this case it can't be
because remote's power-domain id is used from "mboxes" id. Even if both are the
same number, they should be different properties and should be used for
different purpose.

Thanks,
Tanmay

> +            memory-region = <&rsctable>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names = "rsc-table", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +
> +  - |
> +    // Late boot mode example - firmware started by Linux (remoteproc)
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc {
> +            compatible = "microchip,ipc-sbi-remoteproc";
> +            mboxes= <&ihc 8>;
> +            memory-region = <&cluster_firmware>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names = "firmware", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +...

