Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA03175A87;
	Thu,  9 Apr 2026 00:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694522; cv=fail; b=FGgL9zkUR0yVSZL5khAyip+xWCJv3Mc3i8tPgXmcvEqMnNGwGtSKy1g+WS4Nezn/bV9B3kegZBxYrsa2tQMEtmEXcLFEHZZJwULkCzclTW3lbQb3Lhp7FWQ6aBVdhwdmUHPdxxUZfgszBPTxbW46p18eSn3Y4dcRl6eMTen82mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694522; c=relaxed/simple;
	bh=NNwinLeNiQrlmKXUjbKrWJ9hZ3U7GTOcoSscSGmPcao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T+g/1JdytLY9XvETq3Wa8wuSjOM7yARtrNMIplJ1Ae1RZ/Tx0Vm9lB6RQ0vJ9OoBps0Qd619rjGFwEi4vEuV29m4CyHfigQsiiwB1MrdNBFKfQhFp9eSF+a0+JUSJoGyF1uufuH/G1HiwlXytaE5MqWywAsvBXVlFrCZgekaQRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mgxtkZzT; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mgxtkZzT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1keNcvoSJJIjJfNO+ql5WWxMb+opqw8JiFXbKbI8GizTR3PQzj42Pd+Md4IeXDQbPmC9M3DKFcJA/nMukAmfUOiDV/inT1tDJcdUgmoNAFeLY1en5GUwNge0QjGJKidEL2PcpzDSM/ftbYRNkfSMyOxNyZgssxY0qABCF43V1Fkl/5RaHQdyIL14upf/qEE/Iw1S83O42MY9wOKsMgEqv/VvdDJjF82snv/r3CTD/dPz26SBVWW0yXU8jWGnC6EixGtQSFvblHkn9ecJHWd5tWeLvRDdaT20Oho6URQqa8WBP/4YDuu8jQDwSHODpJUxUyVAOWpDJgsggq/Oy8F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5KZdkQz73VXmwaxOANgI+OJtLYoSri/GxY+gJ9gMeQ=;
 b=BHL+1EDZ3IVCPhsD/um9v0dnPRoqRaKWAUh2J1/nshnzLxLmYKvwqtRKlYh1uHN2gLO0zGrQ+UCThw7+aceUNzFf4iJ6+/TQOj9Y+GaKokb/ITo24ABgEbzFI1A2dQHgAbIyu7twGUz0vsvbBlHDeCJKdFuFQ36e6/oC6bF6b1t4aAW+FRwkqrc/99S0D9ewnuBhmVXSEKye6ZOHPCPi2aVs31fbjkjq/RZJlRdspX8LeXb03KO6C6FlTgOEBnanyvJgqIHeXNSlc0+cypKLnKoYF2fEK1/XLd2IJIzej4y0W8f7j65gwAR8FDhVj3agkFmV9rksDb0+pi5nsiedrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5KZdkQz73VXmwaxOANgI+OJtLYoSri/GxY+gJ9gMeQ=;
 b=mgxtkZzTKjTV8XB9SQbvb7AYkyNxGdXF4O7ZshPYEbvGn+Mg1/6M+o/QzZT70Zjly2eNSUtjj8BT3qABaddfDUDbRDBVuC4VQ00mpwYIhUJk5z19biABsPyBef4LzWLccG/3MYo6AqWX54TlYM7BHT0PJQRo5BcZ/k3MjKwSH/nrBZWvNq2cHCapugmm3ljCmGPRaYgC7QxmAOjXdKrnLZn80QPK51IMm+jmAKLs146LAza9p2R/YM9fqCP2kcdiENR9Z88Qo9LkY24hgz5e0YjJT+A6ndAB5mIbbMN6qoYNQPdbTRXQKJOz1uiDEY67EkH5oy91Jdo7LKbw+UESIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM6PR04MB11267.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 00:28:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 00:28:35 +0000
Date: Thu, 9 Apr 2026 08:30:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adbzPl7ydUvb+MIS@shlinux89>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <adZ4WIaC6WN97JhR@p14s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adZ4WIaC6WN97JhR@p14s>
X-ClientProxiedBy: MA5P287CA0162.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM6PR04MB11267:EE_
X-MS-Office365-Filtering-Correlation-Id: 75220f92-dd26-4201-27b5-08de95ceefaf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|7416014|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6mghSCfTn7tWfr2nMHH63oG4srDfxrQp72OeR8j+6Tha1XmCFNcFCoAsja2P8JYSzKVt6X12YJN8MzsopZP9x9xYkCzcllrX1XlQRbVMmp+BKJ+68psgGztV9u00JMC3AdT3Nmn4VofsxRKQKAwcL9W8HT6ggUNCRUdbpO82tknOCrmukrsj98ZPfO2Mf2fLE7vuVRaHTjGcNNJybRj7VDMkC1fBYD4Uo6BeV64gCeNwRM1gSAaDtN0iNScoZORbpvvk0x06178AIzPfEjL05PtKeONflM1Pfys71BoduDCvS60semGHQR9vwdngapDl7ZBR5M1rsgpMSoCnR18Z4ky0O+m67TWhXfcqG3TbgYqu656phvjRoX+LJnu74vox7fs8MskTeNx0DqExJ7Gefk5fK8rQQNT2JyRfDQ/kSqS63uwYOCwimkb54AU7SXpyCxfU5wFYpaQxeaB79TJUgUcrHF2pu5qz61CjARfZ7APgJC6m7vL4RK/YDnmoGJcJf8+2atavR0+0lRiovKoAF0YyjzX+baMOHNGVVy2Icu891qP66X6Kh2sizoh/sL4jgTbY46xGBAihw4gM6U/mZmJdIw3qoht4NQ4ZdfszyrBQ6dSzf7BpxapuKTIrYqIb5Ok1ST32XpjL6JZDXauAOSaYxUXm/l2m2GhzaAVFiQ7QYs4kY0T43dYsOfI5Ueq+RktlZYH7cHj4lXQRv+55jXkNC+1g4nXNi/QPjcFvUEzH5xQSps7Dy1QT6jdbCvY5tyB35aNzkm5lo7LwkYU8OAUM4DzjejgcXa0MCtYd4UE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(7416014)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlBhMmZGbkUrSXlkZVlXWDBNN2V4LzlKOVVYWlhYckZEbk9xT3NNNVcvRzcv?=
 =?utf-8?B?dFJtWXM5MFB5dmkzRk9nNVltMXhVb3NYU2N3MW9mOHB6RFd4Q0hjL25XRjht?=
 =?utf-8?B?RGJpZ1oxbis3c3JUc1p2bm1zR1UxRDZDVVZiL0IwQmd6MXRYWjFqODBWdW05?=
 =?utf-8?B?dTBOamtnbEFwRVFvZ01GRjNINzE1Q1MxbFdtekhWMzZCM3ZxU0ZtVDlRVDJG?=
 =?utf-8?B?N3IwdERkbXpqZkF5Q1lyaGpNY3VCUnNFZi9SWjIvc0tpQ0JRTkJ3NXUyUjNr?=
 =?utf-8?B?YTJlS0k1NU5qajJYNW5BWFViWFFwSmNPNmtFeDYwTjNMcEg4ODY1UXptd2Fs?=
 =?utf-8?B?WUJSL2hXU0czU3luQWEvQWV2WmE3N01vRis5YnNkbWM4VWpqRUc0cUZrdHdI?=
 =?utf-8?B?ck4xaTRzc2JrYVc0b29uQ2tBSDJ3VjlUUHY0WDF3eG0zbEsreFIzcHRTWXhn?=
 =?utf-8?B?QWZUUTFVY0hHM1dYRHNxYUFSQVVra0g4MEdNZFR1N0JJNENucHFBM2IxTkVu?=
 =?utf-8?B?UHh0ak92VW50cVVTUVc3aHhrck9naDVHK2FhRk1uTFFmOStrZk9kOTE2NWZX?=
 =?utf-8?B?SlhoaEVHMHNscE5jbWxtUDF6a1NHZFJkMDR6MGRNZUtkOTNsQTg5cXk3Tmdj?=
 =?utf-8?B?Sk1tSEdPRzlDZWFvYUg0NG1NaXJHZENvSG5WUFZ2VVQ2U2ZxWGI2bFB6bDNO?=
 =?utf-8?B?VmZqWm5BWnpFeUpFYU1QMzEwbU9CZll3SFhOeXM1Unh3UDdHTDliZjh1bzVJ?=
 =?utf-8?B?bWJYZTFjWXJsLy9DUTcvTTZOU2RTSmpkd3FzMklXRGc2VXJyL2NJaDdwNXRT?=
 =?utf-8?B?NVVUMUM4Q0dLZkZEU0pDUWt6VUhqM0RrNGV5SzZ4WmJobVBkeVozUm5PT0RE?=
 =?utf-8?B?L1NDODNzT2RsdW01NnJWcE53dmNUbmUxaVNTWkx3SXVFeHRKSklmZlhlQVB0?=
 =?utf-8?B?Zko3ak9oSzBkVkR2T2NqNmdFeFlYcDZUWFAvR0xDdHVJRkl0VUMzcm9kbEJ0?=
 =?utf-8?B?TUxaNW52Y2dYVzJxdHdENU5xSEtMSEoydWsvMXU1bXY5b2Ntd1NmTDd2MXFp?=
 =?utf-8?B?V1NqN2FPZW9hdWpIM3dVcHdkaFNkR2ZPWHFQY1htS0ZLczJrcWFxTGVRTEhR?=
 =?utf-8?B?MFQvWmlTUWFhWTZnUFVieWtzNlBIK0xyMTY4Qzhsa2p2bmdMek85aW5rNC9a?=
 =?utf-8?B?Wm5Sb3NQNnFydEtTcFhueFNMR1hYNFByTDlzdllISGN2MlR5SDUySEF2TkhF?=
 =?utf-8?B?eWdNZlk3RHFUT0REWTZlMXFMaU51USsyRUdkMXg5eldaQ2l5WVNNQkZQZzlG?=
 =?utf-8?B?SFZIWnIyUmVMSDlKWUFHS1hmeGJoNCtDU25lS0g5NHVicVJ0QkR6Q0dLMm15?=
 =?utf-8?B?MHZjSE5YdFdpYzA4ek9jbzNZSmdIN1pYRzRQWlJSZHJ1QUhSUFBtWmlnSUNw?=
 =?utf-8?B?ZEEwNnA2Tnl1cDRUNEU0MndlbkJ5TlpkdmtYVEU1d09uTEZBbHVSUTZVZElk?=
 =?utf-8?B?bDFIZFFldmRZS01rclExZ2tKYWh0elFOc3VacnMzcGZQd2Y5a1VJRFFYQWIv?=
 =?utf-8?B?cUY2YmlUbXRuZWgrZ1lTNXhxRXNtMm01ZTBlNXhmVGhnWC80S29nVFdPMWpa?=
 =?utf-8?B?TWM3V3lFQUNIV0RmTTM4VUliZ1hEajhBeFBoU2tDLzdxejNxempDWmVoTE15?=
 =?utf-8?B?Q2gxcS9qRzdPbTVWVU1lMXhkb2RYcU8wajMvSGR2bDFmeVF6N2NxRUpCcFRt?=
 =?utf-8?B?d3VHdXlvS2hPa0lsZFh1U0twWHFvNlpUcnpiVW1YM3ZCZzdmblRJYXhJby9h?=
 =?utf-8?B?N1VkUUZvN09BODkweXZ5K3NsYXIyOGJHRUsxMTdlbWloOWl4YmoxYXVVYjdI?=
 =?utf-8?B?STNzOUt2WHp1ZStYelJiQlhpMElmM0UzSmJWemVLOU1Sc2hDU0RhQ2c2SlVH?=
 =?utf-8?B?VWNYamFucjJMaGRUeXZzQzN4cDJma21adjU1dTk3N2tJRWZZRHU0Y1BnZmpH?=
 =?utf-8?B?TjhQdlRKYmsyWGl5NjJBMFppTWx6aG9KYzhjZG5ZaWxFQ21ubS92TFJVek5L?=
 =?utf-8?B?Z0JuR1krK1VObGx1aGJPSDg1RWxXMjdscG04ZHIvb1kvZGlIYjlpSTNSc0VI?=
 =?utf-8?B?SE04cFZNbUFrNnpLTlZWUXZVcUtmZDdPcDA0OXBIWjJRUWVWMHQxSzhZbEll?=
 =?utf-8?B?ZFRzV0pQK2gzVi9nU0NFREtNTHlMU3RMRVQzTmVacExsaVcwSk5WN0NPTnUx?=
 =?utf-8?B?amorTUNWUEdlWHV4Q2VCNFVGRmRRUDF4aXFLYnNYZ2JlUVVoVk03U1BmcU94?=
 =?utf-8?B?RXMvYWJ1MHE2MXM3Sy9WTDF2R0xwWmtYVEUxSlNHNEwxS2dTdHdVQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75220f92-dd26-4201-27b5-08de95ceefaf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 00:28:35.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BifCW/+z/1jLkrY1vLR/L7VfjEFOIHq/kROO6/MUzy6HYJLbbrJkjayyiyo2qt6/C86NDKML7XL+owiDvKTMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11267

On Wed, Apr 08, 2026 at 09:46:32AM -0600, Mathieu Poirier wrote:
>On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
>> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
>> > SM CPU/LMM reset vector
>> > 
>> [...]
>> > 
>> > >
>> > > Aligning the ELF entry point with the hardware reset base on
>> > Cortex‑M
>> > > systems is possible, but it comes with several risks.
>> > 
>> > I'm not asking to align the ELF entry point with the hardware reset base.
>> > All I want is to have the correct start address embedded in the ELF file
>> > to avoid having to use a mask.
>> 
>> I see, per my understanding:
>> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
>> reset / vector table base.
>> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
>> I am not certain about other RTOSes, but the pattern seems consistent:
>> the vector table base is already available as a named ELF symbol.
>> 
>> Given that, if the preferred approach is to parse the ELF and explicitly
>> retrieve the hardware reset base, I can update the implementation accordingly.
>> If you prefer to parse the elf file to get the hardware reset base,
>> I could update to use them.
>> 
>> Options1: Something as below:
>> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
>> 2. Use below in imx_rproc.c
>> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
>> if (ret)
>>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
>> 
>> if (!ret)
>>     rproc->bootaddr = vector_base
>> else
>>    dev_info(dev, "no __isr_vector or __vector_table\n")
>
>No

If your concern is about rproc->bootaddr, I could introduce
imx_rproc->vector_base for i.MX.  Please help detail a bit.

>
>> 
>> This makes the hardware reset base explicit, avoids masking e_entry.
>> 
>> Option 2: User‑provided reset symbol via sysfs 
>> As an alternative, we could expose a sysfs attribute,
>> e.g. reset_symbol, allowing users to specify the symbol name
>> to be used as the reset base:
>> 
>> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
>> 
>
>Definitely not.
>
>The definition of e_entry in the specification is clear, i.e "the address of the
>entry point from where the process starts executing".  If masking is required
>because the tool that puts the image together gets the wrong address, then it
>should be fixed.

The hardware reset base is the address from which the hardware fetches the
initial stack pointer and program counter values and loads them into the SP
and PC registers.  In contrast, bootaddr (i.e. e_entry) represents the address
at which the CPU starts executing code (the PC value after reset). As you
pointed out earlier, this distinction is clear.

In our case, we need to obtain the hardware reset base and pass that value to
the system firmware. However, e_entry should not be set to the hardware reset
base. Doing so would introduce the issues I described in [1]. This means we
should not modify the Zephyr or FreeRTOS build outputs to make e_entry equal
to the hardware reset base.

Given these constraints, the feasible solutions I can see are either:
- option 1 (explicitly retrieving the hardware reset base), or
- continuing to use masking.

Please suggest.

[1] https://lore.kernel.org/all/acs2PAZq2k3zjmDW@shlinux89/

Thanks,
Peng

>
>> The remoteproc core would then resolve that symbol from
>> the ELF and set rproc->bootaddr accordingly.
>> This provides maximum flexibility but does introduce a new user‑visible ABI,
>> so I see it more as an opt‑in or fallback mechanism.
>> 
>> Please let me know which approach you prefer, and I will update
>> this series accordingly in v3..
>> 
>> Thanks,
>> Peng.
>> 
>> 
>> > 
>> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
>> > > attempt to set breakpoints or start execution at the entry symbol
>> > >
