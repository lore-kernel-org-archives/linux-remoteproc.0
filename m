Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3AC2609C1;
	Wed, 11 Jun 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632514; cv=fail; b=tebZwSPyfcy/X4KoDGnxI7/Vv8gV+eqbXWDfAChc6dS7Mmxe5tQMgNyUCB2LRyQKYgf/6lVS3uJ8sK6W4G4+lea2zWKwgR0r/DgMHmKyKaY6IQUczCYefHGHffC/4M5TAWIuI75o8jxjtRITRJyCouGHqpHjrI/YaUw/c9i/+kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632514; c=relaxed/simple;
	bh=6yZBzIVJ/auKfM218IbzhHQUTe/OtUPXTeFo1TrRK+0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ffqHc9N0BlxT1uO6hGOy4Xpnq/DeWezNMy2LBcUUYpoHSZapbuApjq1wfKgcDEqSPCA2+WVQ4AEihBUi2XrW5nXOSNDEBapiIJ0MQxZRF6WptXRcWMcHEBtEBIxYwJ0Cm7vMtMQag+mQCJCG9ZLFeKdXM7mYRL4fwjSWea5Qjuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uyegxsb+; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uyegxsb+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdlwp147ar8UgK31WLesMbp1jBJ2ioy9b2l3tDsO+SSkSCpMTghziaFFeSILS9vCrQB5x86dTT3CR7p1huTbX4sr8xoaWXM2yQpFFumWseP/d1x2xyIMGACE82Rhk1ZBy3s6r6Q+g1DURChu5WrKvWQSNQCvOuN2qOL3djFg6k0fppetcd7G4zy718tS+OJ1g/J4+FigB2nZRmcGAIdTkUU+MS3y4poHkjGCR5b4xqb3rMw/xrm3sIjZSPqVrNdSYSCY2bdDjbheEBhH+E+8010WFAz0ONAmF9wQtKRtvdB+c0xJX9M3tqXoWQw51gsWWKfTrwu7LDqHZXqNfj8hPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8+sq+ONZP3dp6Rqwvb1updwnjL1rfUb6xrXiCmieqY=;
 b=te/HjhfFnOpOWJuHtGvDedA7xa75Fy+tngqmag3mBGzTq7gqPEl1qRWXb94mfjnzsW+ZFPPn2fJH1mBFyW+Jiyr07erVa1qpiRvNQ7uvfN8CSF8QW7Edtm7uYdx/a2PT2MyeF+hz+GRvcXUwl3GGQ6qYX68fiyoebBP1CZbMWY3DqFpXgHvGrcKsa108ncYeuGEg1RY9eVqxQBrii4hkf8Rsr//NGJ4rOgadTlsQEtb8QOIEqHYLiDgEYEmCKnWnGH+g5MGx7/sZa6T1lRUChVln8wbGRj/8co9jT8v8qukTrgcGF8oRyHumZcKT2A/d9kKa0MpQx4q7ezB+FbBAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8+sq+ONZP3dp6Rqwvb1updwnjL1rfUb6xrXiCmieqY=;
 b=uyegxsb+5lMMxQa7prlyGniya5D/adqLJlxava2pqt8/Eq/fI8PN+mLtOs5BdSuNH9kUUo+zR/TFBDTg8SEX/309hkvVNtLRRwlKUgconguM3if/yjziyGq/qUfYkBswGYCU461HMm4wC7LTXEmc1wtVD3MrzQwNrvJ7FNS+zFAVJ/I1oUjhx+Ze+z5xj8mFuOfV0inU/h7i6Wu+ABLCZotBB+CcyPlawzEoT1e/Cv5jkJO3ySIDOTGXT6vTrZ9hOk8VBtkQWnr775gyLkKCu/wPLiaSZQ1RkbjExsSrpQQRZDeYgQ07LTOXt1uKAsVtOuFNM8jNHhcfW0qBsbt0OA==
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c0::8)
 by PN0P287MB0876.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:145::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 09:01:44 +0000
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f]) by PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 09:01:44 +0000
Message-ID:
 <PN0P287MB22589781F2D49353E7C66C46FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 11 Jun 2025 17:01:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
 <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c0::8)
X-Microsoft-Original-Message-ID:
 <c897121f-996a-4705-8a40-ab72a5371328@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2258:EE_|PN0P287MB0876:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ccc05f-ae13-470e-33a8-08dda8c69695
X-MS-Exchange-SLBlob-MailProps:
	RlF2DIMZ1qVSu1YvvJQFkqcaSuTI28KkS2RJt9ldSxw/9SS8MhDM8Z6m29E4rW9bg/HTPWrr8CsGwruAzuqFuxh7XSPDYBbtz6BGE8U2jv4d9TGMt9lZ7Xicj9hl6sqSSlO64UlAIKh7E4gwf9hZZwMgosccXXO3xk4xQtwODSWrouoZeWvyYzwMVo4WcCTuG8qq2EZ3/HvSfupE8aEaCrOxGObi53qIeYmVQ5WNWxHB7aTERZNMorboHynvi15lsec4FpIE489jPEBZTfPOIFgXVch020kIFN34mD/A7gc6EoSJI0R9OK5MbicJfIHyL1Mx1KEjYmKiu5z65QXR3LkNolzfY38FU+J4nTyc2W9wEY6HHyHyNtHb9QHIdxVdNNRfzph5Eqh2cQs3rbV+qcvnkBOdlVuLcpnMraWCDdKPiuVPe87II4KPM8WFWkVkfb8T2nAvW8DEhuCTid2NW1j3VgUwD14f1mbWU+npfAP5D7TdAWlueyWmEty0WzabwvNoC2JdsTDZt7Hhc2cRJJigKJ4dwXv+pQ4S+VLare/rReXHeQA4O0piFPc3HG1KSH2knkU2W3VFyBJ1jSEFW8vxdvc0mBWMQAQVuc38e9abMRqcl/lSOaEKfHwZPDCKwp4Ff3a2iSBMzt3Dnbz2neRSidxnRuae4S160hXnrI21wE+LmaHUzKEOsytwEwddZuB03qrwsuyQHzRMHicWzPMDox56zXiZR3VfPmUyMvH0x858tsD2zzqvOLWBLv8C01fA8eZW2BviBAljskKiR75oRRSrKXqD0P1Ty+QKqSt0nCRprBbFuTgrXltUKa3ZpLX4arIWT4tpXDaJRGHHfKFoJatPxqgh
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|7092599006|15080799009|461199028|6090799003|41001999006|19110799006|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3NsWXUzSkZwSlkrN1BqTzJoY1FndFMyL2czd29odFMxVkFhUzFReE5xZGtH?=
 =?utf-8?B?cHRZR1RSL05XWTNBWGRWRVdhbFNWUUtkK0N1ZmRwWEpyRUFGRlVWMXExTUMw?=
 =?utf-8?B?SllPbVR3eStKS2dsY2x1ek9xMitqTTVoWTRKTUhFTUNpYzhpaGdoL1N5MktI?=
 =?utf-8?B?Y2lJc1FYUlgzeHhvWHVYSjQ5dmRPUWdQdU1XaGVLQW9NL3lacUI3SU1yQnE2?=
 =?utf-8?B?c1BNUldNK3pHQmIzSERpZU1CY2VEOEVxVlVPaUxDQWxzYkowWVBSMk1NcWJG?=
 =?utf-8?B?VjhvQjQxQ2JvVkd5dnJYdnNhY2p6UTluZUFnNFVDay9rMkJRRmM0VFNSZGRG?=
 =?utf-8?B?UmdPMUczTlFhWWc5aW9yRXRRSHlZQ1pOYkFwMURFaEVzcmh4VUw5alBNc0lZ?=
 =?utf-8?B?cjd3S0N2SWp3YUI5KzFVazRYUVgxOGhpbEdEWS95eTNFM01MVm1LRDJFSjNE?=
 =?utf-8?B?NXR0VWg1RmxkUXNCcVlxN3p6aFNIR2ZoWFVNbzdld0ZTUVBoMDJPNEtJYXVn?=
 =?utf-8?B?NlRiSWVWLzVvUS9NNUMzNDlHVVpJMGlRN3NNSVN2UnkwNDVYYlRscmFrK1RE?=
 =?utf-8?B?QlUrSkI3dU9oWkxYLzFaTEljYlF2bEdKSy9XKytremc3d212VFZLRzV1clVj?=
 =?utf-8?B?SGpvRWhDUUsvZUxXWkJCNVNLUUttTEM5bWZmaUhiVEk2RldnNk9sR01tbmVN?=
 =?utf-8?B?VXhQVWg1THE1R09aVGRmRW10anBwY3AxYTZGT0pueGl0ZzRYVVdwN1g4dURB?=
 =?utf-8?B?WVM4N3daczJ5Mmlic2h0dVFqbDc5Y3BKUHBWbW5CQ0IvWWRWM0dUNFhCTGVu?=
 =?utf-8?B?dDA1aGthcTVxSEZtZHBZMGlTeGdFVlJkcXk5SzZNTEl2b2xRcE05UWZqNCtU?=
 =?utf-8?B?Q2JHSWJVSGxHc2hVU0gwcUlXV3ZoOU1nVUhLcXBCT1drM2VuRUlCclVEcHo2?=
 =?utf-8?B?ZzlwNTB6ZDgzcEtyRTNVMGxaRDB3aWxhZFZWenpuclZyS2FkT0NPZWpOZnJt?=
 =?utf-8?B?Z005VlNiTGszYzl1YU9WQ3p6NkdXVmVGOGJ4V2JaTy9BZ2lZeVA5SXdva3VF?=
 =?utf-8?B?aklwQVAvUGFGaDIyUmpzSkgxbWVKdjVibGtPdTFGenRJbUlKZEJTVXFBbm9P?=
 =?utf-8?B?TGw4Zmc0RlFUWmNmY2l3N0lzN1BtUWtoS3JKQjNzZGd3NFVTS1p5ZExhUStp?=
 =?utf-8?B?OHBQUitVNERkaElrY1NhMXZFOXEvVHlJc0I4YkdSa3VzN0NIVUNwYnlrRHds?=
 =?utf-8?B?SUdKT2h2WDd5US81TUtxTnNsTlJVaFNoQW5FMDFiTzk4WnlMNXowM3BDeER2?=
 =?utf-8?B?Wi9pZGg1a0VXMk1Oa0dwYWxvRFhyZGJnbWZneXZQdnZKTUJJcHNSaGkyK2dL?=
 =?utf-8?B?ZndydTUvZVpCdDZVSEJ4TmhVRGsxS2JORHJOOE5sdmlQU29KdklNYzd5czZm?=
 =?utf-8?B?a0hlZjdlODNod2Z3QlNkOENmSmRNc282Vzk4OExVT0FoMFczNW9OV0s4V1cy?=
 =?utf-8?B?Y1lyOTMrSHh0SzdGc21CaGduSytlcTdwdWZuMkFETkNlRmsrTFJWM3haMC9k?=
 =?utf-8?B?ZWNrcG55Ynk2aXA0MkpyKzlRdGNIU2hwRFhLZ000aTZmMUxibzg3dXduc084?=
 =?utf-8?Q?U8i/dGmWjMKkRvcGdUJCEeoIPHik4kJGB7yAk7c6wsbc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RPRjJuM0Z2ajE2SEMrOHJJM0pNb01JZ1JsWHJNVmw3a2hMWDAwVDQ1bGo5?=
 =?utf-8?B?M01BaElhTXA2bDZsVUE1aThIRlgyRVROdzV0R05YNlMxeStIdkRySTBzTkNB?=
 =?utf-8?B?NS9BZ0FieCswRnBwbVo2cVIwNTJxTUs4bXNGSmZzc1lPZVA5b2V0NTFLNVRN?=
 =?utf-8?B?anlTQmFITUhjY3IyUTlobUZTZ0Y4KzZENFh3VmRaNTY1NXVSNVlmc0wxT1RY?=
 =?utf-8?B?R1JFSVhCMkZKWStHNHNxN0xmTGg0MkFWbjVCMURmZG9GcDFuZ1NMejYrUmJ3?=
 =?utf-8?B?b1ZrUU01cFdNeURkN3B6T2IzSG1EMjkxazRYSVBWN3JFK0N4eWlLU3p4V1VN?=
 =?utf-8?B?SjFxdDI2U0FxRUtUenV3Q0JlbzRqMWdVSk9Ga3ZKY0xSeS90TUlQVDZyWkRh?=
 =?utf-8?B?QjNyT3BKeEl1NDMxaTFua3hVbDM4azEzZ0tVcmFHWU04ZXU2UEg5NmY4akt5?=
 =?utf-8?B?dmpublRRcFp1Njl0RFNEOEh6MGNTUHByS0xNOHN5Wm1mbjJtTVR6VVFpemls?=
 =?utf-8?B?REh5Sld3V1RtZTRSUzJYbXdYak83RldFZGlFR2RBRFAxWFBYY29TdjFxcnlK?=
 =?utf-8?B?d3pWTENuekVRdjFtM3pmMVI0NmFyU1Z5dTdHZW9WTWxlSnF4WWNyT0RDbTVF?=
 =?utf-8?B?ZnZaZXFGaVZuaFZrVHR4Mis1bHYrbHBjUU5DUjhkbXhhbmg3WFJwWTd1eW0x?=
 =?utf-8?B?YVdMcGsxMHFNYU00YkdrSTM5Y2VsM3RBYzJYWnNRbWswcFhDdGVERVNBdXUv?=
 =?utf-8?B?RzYwR2hQZms2cnR3bHVYN0s2L2dkZjgxc2c4Q2RtSENRRjlVd0tGSDBjbE9I?=
 =?utf-8?B?RFJKVGtHa3R1TGE2ZkdXWjZTV0dnRXlMUmt1MzhiTXB0SFdoQVdTTytiNjBR?=
 =?utf-8?B?c3lrdDFqeHg2cktSTHkxQjd4RXQyY0JUb25PaEkwYzlGOThSbGtFYklVSHBR?=
 =?utf-8?B?blRCQVptR3NUOGlHR0tNYnBrRzhlZGdiUDkxZHY5QnJGTDc2VUxxbjdaSEVP?=
 =?utf-8?B?dm5OQ2VkL2R3aUFBZTdHaDhBZEIxQ0hGc0tYU2YrOVF0MDdvNDNkKzB0Q1Bz?=
 =?utf-8?B?amRJMjN5dENnZHdUSVdHT1V6cFFsMjFkR3VxUU1oTjd4ekhsclBMZGF0UUZH?=
 =?utf-8?B?Q011QnRGdTFIcDdJVi9tdnVHU253eGcxdTdsVS83LzB3U0x5Umtxd3ozRC9E?=
 =?utf-8?B?QVMrOWFKbkxsUVlVeFVkQW1YdXAyVC9qRWhKNXVGMG0veXp3TGkrUjk2ZTBr?=
 =?utf-8?B?Sm5saldIMERkQ3E4YkdmOVVoeFo3bWJDS2ZHL2w4bGhlSUkxWWRrTmQrZDJj?=
 =?utf-8?B?ZVhnRDdXS0JlS2RCLzRLMkxCV0EvNVVmYXRNWkRDNHhLcVVmTExIM0JVYXZB?=
 =?utf-8?B?L3I1bUVpS0kzSnp4UnFibTFITDhYejZqMlZ4UTh6OGJHYmdZNTJPR3p2MFN5?=
 =?utf-8?B?Y1JFTGcxQ2NoUFRtd2xRRkE4amtabHJwYy9wU00xdytXY1JwcjdMa21Vams4?=
 =?utf-8?B?RmNVWHZRU3dwV1puVEhwM3dFZHA1TDBWMU1XQVlISjM0aFZGY3BtZFlpSFJ3?=
 =?utf-8?B?LzlqY043RlJEQ2VZRkpjMUlIZ1pvbFMwNHRqRDRGOWhXYm9kYzg5Wlc2Mi9V?=
 =?utf-8?B?VlluVVJWRTZ3WG1icDNERWp4RndDOFFwTjhiWUpYNXp0T1JVTWU3WVpGZzIx?=
 =?utf-8?B?ZDVOMEx4Rmx1UmR3MFpnNlk2UDN6MitNTWdTeC9STDRNUGtKcU9Eemk4K0hF?=
 =?utf-8?Q?27vD53tM+NIOq5MPXSzfPyuStjVgN6g+9YNw5MK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ccc05f-ae13-470e-33a8-08dda8c69695
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 09:01:44.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0876

On 2025/6/8 10:37, Junhui Liu wrote:
> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> processor typically running RTOS.

In the cover email, I saw that remoteproc also uses mailbox as the 
underlying communication. So I guess some mailbox-related properties 
will need to be added to the bindings? I suggest that these should be 
determined before officially merging this bindings.

Thanks，

Chen

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>   .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5ef451883b0c3d4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo C906L remote processor controller for CV1800B SoC
> +
> +maintainers:
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description:
> +  Document the bindings for the C906L remoteproc component that loads and boots
> +  firmwares on the CV1800B SoC.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-c906l
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The name of the firmware file to load for this remote processor, relative
> +      to the firmware search path (typically /lib/firmware/).
> +
> +  memory-region:
> +    description:
> +      Phandle to a reserved memory region that is used to load the firmware for
> +      this remote processor. The remote processor will use this memory region
> +      as its execution memory.
> +
> +  resets:
> +    maxItems: 1
> +
> +  sophgo,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the SEC_SYS region, used for configuration of the remote processor.
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - memory-region
> +  - resets
> +  - sophgo,syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        c906l_mem: region@83f40000 {
> +            reg = <0x83f40000 0xc0000>;
> +            no-map;
> +        };
> +    };
> +
> +    c906l-rproc {
> +        compatible = "sophgo,cv1800b-c906l";
> +        firmware-name = "c906l-firmware.elf";
> +        memory-region = <&c906l_mem>;
> +        resets = <&rst 294>;
> +        sophgo,syscon = <&sec_sys>;
> +    };
>
