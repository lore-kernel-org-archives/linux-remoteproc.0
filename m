Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C3408034;
	Fri, 10 Jul 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694803; cv=fail; b=tjmkouoCpHLPbpOgN527gk0N8U1adcseN3TQJdhKYmK5ZM1pxC5waAOmCmne2XmZUd4yEo+31w9g/tDgUgvVzDVjeEebV29KkJzDzM6AgMSO///CvI2ejvfRwh5n0qzIo09Oh5aqrubpgzzvt+MclRv8Fx4d68XU0xy3Cq1PHyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694803; c=relaxed/simple;
	bh=1U1Pdu5J23z7EjqyK7gaffc458h/ToUvgU/8yMrxM/U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qgjj/xxZhRNlpqCPRrcWLOAgnZmtbri6MBbOn7qyEBaizpDRsMysveshu5UutmOkhzBI+dLc6ZS+Z6WSmrEnaUpbciwWJGfGcUqnrEKwLxa5DBPcG69N14Zu+dzgnpPdda7y1r426Zueo76WWNm03GDS4llWJCHC3sYkcQu9h9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZGtZXQ3d; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZGtZXQ3d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Keho1w7NHktq5vUelYVdoLNHWL0vECDO2KcPscrfR8hSsbkMzBexRjATWVIToVSpCvZSGICuaFa4PGySybFTQhQi/h/lodURSPzzjSVmS3unBMjjN4DmEqBVtMeGkNPm/lciW03JkWIXDnmCL+4+COkvFnCQSrhcfQtktDsYob/kh7KpkqnxyR898THUX2G4OLDlGoa6u2ZIJnso4VAjzGOEBNhOLFaAgSscGGN6sGvvrq9qAq1UX6AuSUobExPStgp9uqFm7IAvxLe8lWlMtvSmwCwQ1fwtTXsiMcfwkd53qg/7JfBp0Kf48+PDT5CXEJ+o2DfB9bJbVPulvXjDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXTfYlxCWPHhiU4IPoFZOQ4OUVANAYZ5mXToCjzptQY=;
 b=pQNG/zxwqboIp9AKrN5r1x2avlHEnPAa1i41VwnGOjNNRanlnTnGFAOl1YKTcI8K8XXyq++7RZaRIWBZKnEJwUBxgMwVEp1Pi2YSvUp1dYW/DW46AhUuo9OWCgJ/Va4P9kPBNF/e5nVTUeo6r2IWe9AvZHdo4C4UjmGphrRz/QAXeZfZ5xpZ2Den5eQVT49/k1rXNwvvCJSrTsTS3l0tBuxtA9gloFXSVxjRb0rRdni2RvGoOUN8i1LzFjNXBtN3QmrvH/+hEgqEIgV4tGsxWr0yazkjCr7fH5anuKgcvbEBHUdSwHMCnq/dl9WsGEpBIiFTNCuyuDBPAppJWkAzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXTfYlxCWPHhiU4IPoFZOQ4OUVANAYZ5mXToCjzptQY=;
 b=ZGtZXQ3d40/93UP1Jq50GNnLUmS6vl9OkaSLPMLA4N18qGWa8ypnf74rIOpO3EsF3PeGB1uXQp2fWgtmEg3Ws1tMqsrk873LYprvI3YlQJ4VrMYj8uUfGhyoZPfzPfwPhLmXUpBETTKY4kvpB9B4D6Vh+7z53dV1ZUo5MPT2x6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 14:46:32 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 14:46:32 +0000
Message-ID: <7740b9fe-2cf8-44e5-8d5a-43391ff177d6@amd.com>
Date: Fri, 10 Jul 2026 07:46:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: document AMD MicroBlaze/V
 BRAM-based rproc
To: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-2-ben.levinsky@amd.com>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <20260709145712.951146-2-ben.levinsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0118.namprd07.prod.outlook.com
 (2603:10b6:510:4::33) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f0fd7f-9997-40a6-535a-08dede92086b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|22082099003|18002099003|20046099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S5iwP+LcFrA8+a/h96ZiCj3WEFUe3/ht8oKZsdC94FOBJNbSVdwM7q+YN/HmWDTIgDslqhkNwgAH+RUAJCjxuXOSboY38l0sebTGGJv3Rj0j6w0H7G9rrc4zZbo0HgA2hzBDtFSdsZZAARCFTjDPSNPvtT5hK+KxBwqjjGW4d5+U7sEa8AyAkSNDu3rSP8FXbTNQwwiFD9ypDzhtYBVJVR4Z1KsM5Xle5L4PCaShGpVPsWkOsKwnmbTVt22eeIunPHFs7qWkAXscNHMIdGbnlmOu/DsPj1kTEOHfzjv7pHa4LOW3jwLIbm+IXgBttrzxU2ND+4NXC/HBPSHk6qmMY9yLRd25Sbff2DGxMY0zQ0kJ5iHXkou5/wYJ/weJ782KxaQEfMDoi1HZX080EgC0MeBpzL8VeQNBbFCDB2Rx6O6S9kgR5LCWM2Twpj8FTr/WVQ+lZVdGlL5htmQbPlNhsZ/kDZoIrRU7sQo1t2v4tJnOELe/kmpDO+vIgZbdYjR2HQXp+72qc2FQrhLYYJbktDw2wsRbFoO32TTX8WDxmF0a9POgYWwDZoPpXck8CROaHWHtMMTzQUaqOBlOzdD7uamVxC+AE1IV+CnB/Df2znpDY26IwgCS8qot1vNfBlth
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(20046099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC95UGM0dzB5V2VmTWgwM2pZWldLUXg4YUdabnd4WlpERTdoRTgyblFGSlVr?=
 =?utf-8?B?WCtLNlEva0daVjZ0RzY2Z0k3ZUR1V2JQOTRjeU11R1lHU1lIMXlWN3hGR1dj?=
 =?utf-8?B?RFRWcHhpdUFJUTh3ekNNV1FIYjJsaGtDdVBLUVZ3QVJzVUxyS0RyeWppdlo2?=
 =?utf-8?B?N3VjN1pya21rSGdERkdxVzJQVmlRMWV6ZVRFVmZFcUh0MXFqNFlvd3lDV1ZR?=
 =?utf-8?B?aDZIbTAvNHFudXBPN2IrZktHa2hBMHJPTy9QRWlLdnZobHg1NFYyMFI4Z2V0?=
 =?utf-8?B?cnljb1VUd2pCV2VyRnJFWERRZndjcGRZbHlJeHVIbkJsWXJoMWtJTzNGMlBn?=
 =?utf-8?B?YWVPNkFLODRBMXpnNXdNTHNHWmZ3a3RoSnZGRWtKTVA5SE42eFdZYUF4OGdQ?=
 =?utf-8?B?VEtwUlJOTll1a0V1RytUb2ZWSnpLL3NKYnVWcks5blovWkNwNTJieUJoWjJT?=
 =?utf-8?B?N1l1bXMzS05PNmt0cVNlSnpMS2xtVnEvR0Q1bnVCQndqUVZ4aC9VV0dqYUp5?=
 =?utf-8?B?aDhqOTFuU2Z4c3loSVJOblhHMzZOMVFVamN6aUFadkZIMzdxVmYyNlVXNXZa?=
 =?utf-8?B?c24wV1ZadjNOK2lhSWYyZWVma3l0dGVtYnY1RlJxbEZmTTZ1N21NRHpiZGVY?=
 =?utf-8?B?d3R0WTMwbWp1cU10K1BIcVNOUnNkVVdBdVdKTTNJUzlaZ1YyaUN4Ry8zVFRq?=
 =?utf-8?B?L2VNOW0vQng5N1JUbklQdmpXWTBRQ1VHT2QzOENmL1dPY2pmRGRkamEzUjV6?=
 =?utf-8?B?akswVjJUNnVhVzVKT0JRK0FHZ1JCM3QyUUVVRWgrcEdkUDhFTEhTUVNMckpn?=
 =?utf-8?B?VDVJYmJYeEhUV1NEaHpWK3VYMEM4VFZHYXRGNzRkbllxcU5lejg5Umg3WVBw?=
 =?utf-8?B?TlFueExOUTM3S0RoMTBLNm9XdktPZm1XY3NHR1hGNTlVV1VlZm8xZTRuS0Nr?=
 =?utf-8?B?czdxV1JUY3pkN20ydWVnazdoQzFFQ3ZXM1A1RXJEck5hV2c4TXpLS2pkUElY?=
 =?utf-8?B?UWxEN2ljMEUxaHhaNmI1clRaWjcyODZ1VFNibjVjZWZWazF6LzYvVUlsanJm?=
 =?utf-8?B?alRnQ0Y2Y1RaK0p4SUROQ0lXZGVQTzluN09wVXZ3amp3RXVGR1hDZnBRTlR0?=
 =?utf-8?B?Ny9XcXNsb2FFdU9nNTU5NW1Zc1JXMHljbEdBelpZbVJRY05NNXFtZXR3N1Nj?=
 =?utf-8?B?NWhVaUpaVExWR0lkWXNqZC9XSFg1NHBlUWZBQXgzMEx5L0tPT1NGVHlRTlVZ?=
 =?utf-8?B?SFFWbzhHM1FxbDdxSGhUTXVFQWFDQSswYXI5bTVIbWVPc0pNM0lJREhGT1Yr?=
 =?utf-8?B?bTcwM1k5YjRjdG9UcjNHakM2MTNGczJwSzEySXFyQ3YxdGZYUDlSY1Rjd05p?=
 =?utf-8?B?Y0xEMXpackt1Sit5ci82R2prR2ZVVFlRcHlRZzBMaXJZVzRMckY4alJzdWpn?=
 =?utf-8?B?c0c2UGdvSU9sclM0ektHNFpLTVI3SDhRSDJYSEtzWUY4ellqUDI0ZkgwT0xD?=
 =?utf-8?B?eGhhRS9BcFJITk83azF0Mk53TC9oeWhSbXFrU0I4c2ZLMysxcnRaaUhBWUR3?=
 =?utf-8?B?b2FpTkNYVmlXelBoeWdEOGc4MFVPYlZCUnlEQVhBYWVpNGhoeXdkYVRVbFUy?=
 =?utf-8?B?MVQ0WFF5d0pCSW1PODJDZjNxa3ZzeUNIMmtlVDlMb3pKOFdlR0s2dXJmcHhp?=
 =?utf-8?B?QVpQejI2TUlCeUdBcmJoR1hCOEhrSkNkZFRCNHIreTVNMk0zUlM4L2NaaEtw?=
 =?utf-8?B?N2dodktFVEZyeWdEbURQVzl5YXNSL3lhMkkvTVdWWk4xWG11a3VINkpZTEd0?=
 =?utf-8?B?ZlRRM2VscXVCZkFjRU9BNWt4QWRVbVorWUJYenJGT3hmVExqZ0hkTllFUkUx?=
 =?utf-8?B?YmNhd2RRbnN1bmJsQzZjM1k5cmdkL2tBT2lVUTJHTzkrL0k4YWx4dnFiajM3?=
 =?utf-8?B?b29RVTl6c0w2eHhTVERKdEZtUXZXbkJZTWdTalE0dFAyMzhVdjNUS0t6Zlda?=
 =?utf-8?B?V3IvSGM5dWtUN3lPZ2NZU1Q4STNWamhPSGJ0VWZkcklhaTF4YldYZi9lbElq?=
 =?utf-8?B?RUU0OTBnUkdyVkMyWDdQUGhYR090ZUc3VTBsU0lleExqZjlzR2dDVzIxQXpx?=
 =?utf-8?B?VzV6MWNkVnhHS25aS3NvRUtmcloxN1hLbHMyRVVzOHBlMzhWZDdDY1JWTlhw?=
 =?utf-8?B?MDlndjZ4emdkb2FKM0VXekt2Q0ltYlhOd2c4TWVSYW8xbDR6NTVNcWtOQzlr?=
 =?utf-8?B?QjlFUUxORWphaWt5ZE8vSzZEK3dTYTdkRzhpcU9ab1llL2RUdG53THNuemwz?=
 =?utf-8?B?TzZnaHozaXpMQ0s4VGVoV0ZaMUVtTkVXVDk4Q2lGVGZubUtiWUs2Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0fd7f-9997-40a6-535a-08dede92086b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:46:32.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uD8XcLIKDZIltG/Q0kKL9jPWzMbIsckhRxPhHjv4qCu/d5MuSmc3AxYtjgQw6QVxzO/nvSTvrJVCq/kopy3yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168

Hi Mathieu 

Though 2/2 got NAK, will you still review this ? 

If not I will bump rev and update patch 2/2.

Thank you
Ben

On 7/9/26 7:57 AM, Ben Levinsky wrote:
> Describe an AMD MicroBlaze/V BRAM-based remote processor controlled
> through the remoteproc framework.
> 
> The binding models a soft-core processor subsystem instantiated in AMD
> programmable logic and using dual-port BRAM for firmware storage and
> execution. The remoteproc device is represented as a child node whose
> reg property describes the firmware memory window in the processor-local
> address space. The parent bus node provides standard devicetree address
> translation through ranges so Linux can access the same BRAM through the
> system physical address space.
> 
> A clock input feeds the soft-core processor subsystem, and an active-low
> reset GPIO holds the processor in reset until firmware loading completes.
> The firmware-name property is optional.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> new file mode 100644
> index 000000000000..c0359f447ea8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD MicroBlaze/V BRAM-based Remote Processor
> +
> +maintainers:
> +  - Ben Levinsky <ben.levinsky@amd.com>
> +
> +description: |
> +  Soft-core processor subsystem instantiated in AMD programmable logic and
> +  using dual-port BRAM for firmware storage and execution.
> +
> +  Hardware Architecture:
> +
> +    Host (PS)                        Programmable Logic (PL)
> +    =========                        ======================
> +
> +    AXI Interface -----------------> AXI BRAM Controller (Host Port)
> +                                             |
> +                                             | Port A
> +                                             v
> +                                     +-----------------+
> +                                     |  Dual-Port BRAM |
> +                                     | (shared memory) |
> +                                     +-----------------+
> +                                             ^
> +                                             | Port B
> +                                             |
> +                                     AXI BRAM Controller (Soft-core Port)
> +                                             ^
> +                                             | LMB
> +                                             |
> +                                     Soft-core CPU (MicroBlaze/V)
> +
> +    GPIO --------------------------> Proc Sys Reset ----> CPU Reset Signal
> +
> +    Clock -------------------------> Clock Distribution -> CPU Clock
> +
> +  Memory Architecture:
> +
> +    The dual-port BRAM allows simultaneous access from both processors:
> +      - Port A: Connected to the host AXI BRAM controller for firmware loading
> +      - Port B: Connected to the soft-core local memory bus for execution
> +
> +  The reg property describes the executable BRAM window in the processor-local
> +  address space. The parent bus node translates that window to the system
> +  physical address space by using standard devicetree address translation
> +  through ranges. A clock input and a reset GPIO control the subsystem.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: xlnx,zynqmp-bram-rproc
> +      - items:
> +          - enum:
> +              - amd,versal2-bram-rproc
> +              - xlnx,versal-bram-rproc
> +              - xlnx,versal-net-bram-rproc
> +          - const: xlnx,zynqmp-bram-rproc
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Processor-local address and size of the BRAM firmware memory window,
> +      as seen by the soft-core processor (typically 0x0 for reset vector).
> +      The parent bus ranges property must translate this window to the
> +      corresponding system physical address.
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock input for the soft-core processor subsystem.
> +
> +  firmware-name:
> +    maxItems: 1
> +    description:
> +      Name of the firmware ELF file to load.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specifier controlling the soft-core reset input.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    remoteproc@0 {
> +      compatible = "xlnx,zynqmp-bram-rproc";
> +      reg = <0x0 0x40000>;
> +      clocks = <&pl_clk>;
> +      firmware-name = "firmware.elf";
> +      reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +    };
> +...

