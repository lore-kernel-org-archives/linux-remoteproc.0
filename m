Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C83B27F0;
	Thu, 15 Oct 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074746; cv=fail; b=VH2Gxrf1YB4Cq1bGUdiPRpKJoHe26rrwwIGbOns/fCH7preY+zoaZSsnOtKdvKGgyWDvr4sQ8vUcfRvsa5NYGL5enUYOr91VYQn7jhYx4GGj8mvP9VifowF+zMksPrBGCwFdMIuOsYK9T0J+8fX9DS5ZMNlqOPyGG+icwNMRc6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074746; c=relaxed/simple;
	bh=lrrEK+J2N70abGJIRROCaWKJq31Gg8SwEaefVBjryQA=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YNqWHnWcH3riVvvFAIPdKp90spYc/Oopxai6Lpqnn8BRBCXeMzjl5ctOBL4mkXe7ccTO1XQAc5AmJzyFYnWJh1un1pMCfSQ65/gXEfHsUvhz6zDfr2/vqjBqBZRTxPQCMkay3X4yxxZL/mrL0rUtkvDPRz0Xdusb1B8sja64CZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l0LKAB4J; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l0LKAB4J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjoFXrdXyckisdIOBJJfTRM2ASeSO5wGRVcJykPBD8zFJUzmh8PuVsinMAi6CgPipDoo8V7Pq8v6xjz4ngi2Qi8athi7Qoepd5iDBekQMgD0nM+b0356wXRkvDLjRqIyB945TBMr/wNn4eG+8XwlROUFIbj2Fy51nBOqzoLV5XWFISq5MUlTlSu8Q2myi8U6wOJjoZPkskWmvL/TrHl1ar2R6mueyDzDmb7YXcNkVH7jnBLi2wHC7ohw7+MNqf03wCaF9k5qVq+OCyZdv+MFskHogCph8UNFrsfDrSCSimbTB9UYt62MGpibvKo2VATuaCKm/WXcXhKkSAGV+LwpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZTJ4L9vahBZUDt4Lip9E4w4Tnb0yT70qmvGInjEqMc=;
 b=MY/K3wvntDYEtg8pmElzGDSMSedb0pBxyvHvgcCwaVqP4HJuYadbqYD5DZLcXEJOjZ9ZmdyScQja7GwNT1wxr7D/zj81IQLXPr4i9+mkQAjsKVclpSqKErZG0nhS5CzG+qYWLob53MNCascGue/J/LnK3m3ZVBom879m2da2dWnR79P6FIcFKQwN/4l+TAxZKO8mni+UjgC+s8iHYf+bTGXbroACE2U+e3zz6NFZmFaLH3QiTMw+ZSXgGMeRPVYdACntuqEG7UutI3r1nMQOhY/d8XPmrdHAPAf65qeuYE0ep54GazijdpFBILOEdbKxWjlEVic8Ur6biwAV5zyIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZTJ4L9vahBZUDt4Lip9E4w4Tnb0yT70qmvGInjEqMc=;
 b=l0LKAB4Jgi/8uq9sFmfcMqomdrAvpiGRlOfAqlGkz8TKoLhSF6I5trjf2tLUYNU+7/Yzn07bMF2Kth3AmBgLVdyKbo1GR+UbkCzDQZdMW/nJrsMysv7JPbNXNBGEQdw+FK9ooGvSGlw91O25VxT+sv9DY3X4K8lhy0Gie5GrAaQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:32:18 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 14:32:18 +0000
Message-ID: <1f6afb5d-47d6-4c15-9ea6-d4a96da9ee68@amd.com>
Date: Thu, 15 Oct 2026 07:32:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD
 BRAM rproc
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-6-ben.levinsky@amd.com>
 <20261015-ethereal-cicada-of-perspective-c1aaca@quoll>
 <DM4PR12MB64480F027338BA7A1EF91E17839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: "Levinsky, Ben <ben.levinsky@amd.com> jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Shah, Tanmay" <tanmay.shah@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB64480F027338BA7A1EF91E17839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bec665-49b4-4e14-9966-08df2ac91db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DtsM1gLykeb77/t3tEapSFrJFpPIlCLiacQR/eqyhcbDSpWdKqOqLWhNWjbI2GNvyDLykc1H986jsr1BhjoaPbGOxIHwI8O8ZK9N7jR03d9XHawZogghhhcB+ogEyI3YWFymDev0exHvJNAduEwS44sAHSYA/I+GwTzGJukpXjlsSEaoOA8BdaCGmK+10mZVPJiWHutlsgA669fimcYaaQCruHiqG/0MsGLx6zAwsGNYiNvjy+XVLN9+1+9RKlRLjyNQ/Yqzlkfod6Ei16Fb5jhaXbS6uEevHCIpHkLEi4kbWYeAPEqMQbSiOHTRGy7120O9e1RvRoWIg9+7LM1sbyAbPiNn5ZToEYWwQ/kiaGCKf0va2s6EUsQO1WTfwrbb9ODbgK1rDDyAAV3otaARFgRY9GrmlA7MLloQ3s3JyYxPXkUeP8rZqEAzs9Lz+h2m4mDiyB/lyQsI1lJt3y0kFJ2Gl9STq3C3yVI4z4FrPIyOV8KNUICw7d/lnxkqIIzAHGUb+GbKTfTlWwVm2NPfvAgUe/vtKEkxJrolybWPvdVxziCpwwrBzv0TLS6FObTt6Dx4pu2875AaF1W3fUI+XdNgkZQVGjogNxchh18lBRycI8vA60noooJAlieL0IBPt3MfhStQMFgk6mPGqjC1n7hU1NVjBErUkNbcT7KE7ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1cwOFozeUUwYkNrR25tV0l2dTBpMkFZNndXSVFRVjNmZTBKaGR2eVc5aFJt?=
 =?utf-8?B?UVhSdlFoTThuclRuM0pZc0NhY1hwM0FheHBuWlhaRjJlanBtNlpncTQ5cDFi?=
 =?utf-8?B?Qy9nbTIvaHp1ZGRwK0gyb2pNQkpoL0tqLzdaak1RNmhTTGVFWk9XcWpUSzhz?=
 =?utf-8?B?Z0ZNSDJlWjhPWkpLVmdDNVlWUUk1MjVVeWk2YVFIWlk1Z1BINFQ1NHVkTHdC?=
 =?utf-8?B?RHlKSWh3V01NSGpoc1JQb2t6Y1o0MEdSbEx2dTduRm53cW1qT2JaQVB3TDln?=
 =?utf-8?B?VlExTmxwNmRvVEhrZ1BIWmtZdzNSc0QyYXMvc0VGdDVLeWxsQ1VqRG0ycml4?=
 =?utf-8?B?TVZ4WkN2T0RzK1d3dVZoci9hcFBhS25SZ1VqWTRLN05NOVJJbmVnbU5EUzdz?=
 =?utf-8?B?NE9vdi9OSUh2ZVVoREtjcUFJUDBDbjBIRm1CV1NLVlVsSWVhQ0NrT3JoQ2pm?=
 =?utf-8?B?S2tsOFlrK2d3VlNuRTFOLzdBMjRvY0tZTHlQcGJiSjA1K2UrUTVHU29OMTVW?=
 =?utf-8?B?bjBRQUx5cVZHZmRtUHRqSVcrc2hzcVlSMkdVTFY0K1RuZW9IK3A2cXI0Kzhy?=
 =?utf-8?B?c1RIN2xraGdmemhzdGpLc0pvZVF5c2hxemFHS2UxWVhNL05LNXhwY1RjYXBZ?=
 =?utf-8?B?YzFuR0lRZVNxSG1ITWNaeG5tNTlkVU9IYXZQaVVIdDNKMkZ1QW5hWVFSejNk?=
 =?utf-8?B?ZHNRKzkyUDZhT1lwcStLUU0rTVZwMW13dUMwRHVFSkg0NlVIdTdQNEVRS1Vk?=
 =?utf-8?B?OWRwcEFMUER6SW1sd045MFJkbDkzWGZEeFFCRXdtWnZ4QXhRRHEycXV6UVdT?=
 =?utf-8?B?akhzNXFGOS80aStBeGlnempFV2NWb3ZKdUpMSXlqU1JaK1pGR1RzeFNobk92?=
 =?utf-8?B?M2swYVJYRTFzYnFDdmEzRkY4eTNlbUViRk9vRCtlQjZNeUlvdHdKUm81TzdZ?=
 =?utf-8?B?Y0F6NGlFd1RxU3dZNjZDYTlRMWc5VzdzeEMxRHdabGJiQ1FnanJMdWlvS2NI?=
 =?utf-8?B?NDIyNnpwYm1qT0RhRWdTNlFCZE5paGNQOG9QQ3VoTHVSU2I4YTl6ajZIcEpi?=
 =?utf-8?B?ZlprTHZQcVV0SGFhcXJOUlJtd3hxc2d3ZUgyOGs1V2kvdzVUc0UxWkNUV1Rz?=
 =?utf-8?B?UTlRbVp5KzB1Zm1iQk5FNldoeEZBZnJWOFdXcGRhVW5OZjBNT0N3eERnSHBS?=
 =?utf-8?B?Q2xDSHpGNXBiWHJBb1hCVzNIZHpxcjU5MnB6RFdRQk5HYUY2c3lhcjFuY2lz?=
 =?utf-8?B?WUtPWnN2SHEzNlRXelo0MXo4SXVCNkNRMnVSK0Z6Mm1PeFJPZFZaS2dySTda?=
 =?utf-8?B?dXJ3a0lsQ00rdllQUlhwY2tjd2Z2Wlp3bUw5WVRYS29lcDg0cE9OTzFNaWRB?=
 =?utf-8?B?NTFab012RjVsbjJnNW11a25NamYrQ0RQNUdrL0J0SFhBM1BxSk1COXFQWjR6?=
 =?utf-8?B?UXBGNmNTVDRPaC9vNC9TdmFYQ2ZHaHJqVFlwdU5ianlTZWFYUEJLdGVuQW5Y?=
 =?utf-8?B?Y0lGQkNtdUVqc283eTFHM2NNZk1hTm9yMk0ybHEraWRFSU14bW9kZzR2M2Rj?=
 =?utf-8?B?dTB5NElPbkt3NmpGeUVvRXBZYUdTOUFaVXdVSzcxa3UxZFVHT0liVE90SjBM?=
 =?utf-8?B?c2grL3EraXZHejV5cCtEaFgyVTAzYlk5N2tmWWtkZVpIak12Q2RlS3N5Tlp3?=
 =?utf-8?B?T3RKY2Fxb2ErU05PR05VRVU2WnJiWE8xYmlFQzZBMXd6RXVEdWpEbmNhZWtu?=
 =?utf-8?B?d3k5UjBBM0srR3FOYW4vdXk3ZEh5YXFyZEdsbDlPU2xGWnpPNkVjUTd5dlo3?=
 =?utf-8?B?YmdNZnBMMTIrTUxkNGd3OHEyVjhzTGx3a1h3ajRwelNWZnZ6SUluajlYV2NR?=
 =?utf-8?B?OHYvcGtmMFN6TEpCOXBJeWg5Z3RjR1I2UDdRRVMzMWx4dFJOcXZWZ2lhUXJk?=
 =?utf-8?B?WjdLM08xZ3Z5MHcvaUZIbi9QVTVtVUZmTG5BQ2drYk42WFcrRzBJWEZkY0cr?=
 =?utf-8?B?WFROZ1gvcVU0Q0JKTFp3VkxJOGpQc2srSnd6aUZyR3pFdFNWQ29XRnVaUXVo?=
 =?utf-8?B?dFB1WFJJT3hyamo5bDY2NkRyeUloSjFkdGpjYVBKSFdjc3Z0bWZYRVhFQzE1?=
 =?utf-8?B?WkF5UmhRUTVCeDVWN2VuS0pFMnc5Y245dmlWYlZrajQybVNRa3phLzFrcE9q?=
 =?utf-8?B?dWY2VHZQMFE2R2hRUG9yeXhDa0JPQlVyNWZQa3AwZVdqWVFzcWJnTTU5U0VY?=
 =?utf-8?B?MXlOV0VKZHhzSFp6SFNIekpFa3N4ZkRFNDBMYW5KM2pZR2pVOUZKaS8rNkxL?=
 =?utf-8?B?Z21BNHpTUXhMemZISCtxMmdnS1FXdjZETUtZRndINGJMNkkwaHhNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bec665-49b4-4e14-9966-08df2ac91db2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:32:18.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xRUpWQdTfA/cdVujmfiDVyowbmf0twmzcu0OmKN65/Tq2fE0ZGaWiCaEhRgqtmw2NjfFA4BojXyp5H+qAEBPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286



> 
> *From: *Krzysztof Kozlowski <krzk@kernel.org>
> *Date: *Thursday, October 15, 2026 at 2:50 AM
> *To: *Levinsky, Ben <ben.levinsky@amd.com>
> *Cc: *jassisinghbrar@gmail.com <jassisinghbrar@gmail.com>; andersson@kernel.org 
> <andersson@kernel.org>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.org>; 
> robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; 
> conor+dt@kernel.org <conor+dt@kernel.org>; Simek, Michal <michal.simek@amd.com>; 
> linux-remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>; 
> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm- 
> kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux- 
> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Shah, Tanmay 
> <tanmay.shah@amd.com>
> *Subject: *Re: [PATCH 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD 
> BRAM rproc
> 
> On Wed, Oct 14, 2026 at 02:34:25PM -0700, Ben Levinsky wrote:
>  > Describe the optional mailbox channels and named reserved-memory
>  > regions used for RPMsg communication with a BRAM-based MicroBlaze
>  > remote processor.
>  >
>  > The three named memory regions provide the two virtio vrings and the
>  > shared RPMsg buffer pool. Firmware and its loaded resource table remain
>  > in the executable BRAM described by reg.
>  >
>  > Assisted-by: LLM sparse
> 
> How sparse can assist here?


  Hi Krzysztof,

  It did not. As in patch 3, the trailer was applied to the whole series
  by mistake. I will correct it in v2.

> 
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >  .../bindings/remoteproc/amd,bram-rproc.yaml   | 31 +++++++++++++++++++
>  >  1 file changed, 31 insertions(+)
>  >
>  > diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml 
> b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>  > index c0359f447ea8..daff8e615ab6 100644
>  > --- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>  > +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>  > @@ -84,6 +84,33 @@ properties:
>  >      description:
>  >        GPIO specifier controlling the soft-core reset input.
>  >
>  > +  mboxes:
>  > +    maxItems: 2
>  > +
>  > +  mbox-names:
>  > +    items:
>  > +      - const: tx
>  > +      - const: rx
>  > +
>  > +  memory-region:
>  > +    maxItems: 3
>  > +
>  > +  memory-region-names:
>  > +    items:
>  > +      - const: vdev0vring0
>  > +      - const: vdev0vring1
>  > +      - const: vdev0buffer
>  > +
>  > +dependentRequired:
>  > +  mboxes:
>  > +    - mbox-names
>  > +  mbox-names:
>  > +    - mboxes
> 
> Why do you add this? Please instruct your LLM to actually understand and
> learn dtschema.
> 
> Best regards,
> Krzysztof
> 

  You are right. The core mailbox consumer schema already requires mboxes
  when mbox-names is present, and this block is not something bindings
  normally add. I will remove the whole dependentRequired block in v2.
  Thank you for pointing it out.

  Thanks,
  Ben

