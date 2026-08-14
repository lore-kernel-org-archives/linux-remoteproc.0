Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1640F741;
	Fri, 14 Aug 2026 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693069; cv=fail; b=NPNtO4JQu86brZ/MrhqnGnoLmoEZbmHLNaVqPeSsCOh9vtZGzP6ZEiSSRctMUCbXetbQIVTZE1LG9N0QMpFhURFinifDIhVl0RQA6hULNfWt7DvHA4lVepdHijAxGJuEgI/OqliHZ2SRk89kBcquRWsLxSinOB7RYgbicJrO0wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693069; c=relaxed/simple;
	bh=DF19hyw8h/AWEp1d0PalDaNgq2LdY4fpI2kZpyWWEcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AiCklZGxEgIHQ3AQSp/GcKtMkV2I+FgS7yTBFAdDvT/B5Bzz2K7vx1VIXKKYw7YrMnmkBTvjnlM/fHO5xgtAmo4Nf2StObDsWkAnDLcQXm7//nwrVA0eEzWQNGzBlK2vNcBfDvm1LMK3hAfOLuBZV+usG+cKgFEyS47mzhQgbsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GdrB217h; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GdrB217h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAY/sHS4CMl1nxbYeSqLDX4RxjJrPWwW1ZZsBM1C+LBqn+M7bYQ31c4Sf1v8DBFt7QtI7j54pAxZAU7VwadVfHJHSU+onpKs6CKKb9EUBymdTp0TjFiOEKtEt2uQvjZN+QuZc8ne8UCuIjumOyqS4H0bGn7PZmoVG3P7TwPBeUrw9/9rUeaouyYg1MCxrzVmxxGVLXfWMNUBpN56SPGPGbFwtWM8OVxQESg4F4eKZOnHEOqfTEnMQnkwvs+7PmzBSB+rx1M7nOuBpa6ZOLAPSH6/HwuOr8HiawEDAUvnG8o8mY0MER7K3I7kBiinFiyH2WVRPFKw401arEf7fgsaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF19hyw8h/AWEp1d0PalDaNgq2LdY4fpI2kZpyWWEcA=;
 b=K4NcBvgU8O6ok688PnZloT83N/yujDgsj4K64mdlCXtYWxuvZhRil/mklsap8fbgMcpmHe+vMeje45a8GNLIzZkoIUB9ygSrZY4k9f8PUluPxZz+WjykSMq4MmeXLbb840yO3GJkdWrSYuEBriN04AiYQ0QzYpHEyoKzKBqobwD0NXqbA1lC4s3bDHEoLscq8rQfYrklQXcg5rBNuRjbH81BgAFmEDp6ilnEuFq6kyj3bgF7mP1vKbzaexP1QexKRrbJX1sNTMJlw7mKBHG2RBMz1is/Y8FwY0YtbURCjix0/XlF+2WOGkiBeTEtQ0ZDa2/23O2yD5TJt/tdmfyBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF19hyw8h/AWEp1d0PalDaNgq2LdY4fpI2kZpyWWEcA=;
 b=GdrB217h5K4Eww+/O78LdMEuccePAzrFUcqjOismCxraQ1YQbokW3k7rWLemOR2AC94r7lmKdrwGnE//PvOWuK9UXO9AUYqh7t+QNNIZMSfBQBrt/hbOr7//fKRkg19OcrE5QVbjd6B//xLX4f8UJAGAnNYqjtaxVZnQptoVuluM8WvwG2qKOH9lVlwACZn6FPgsAEPMDISPVilodxKE/DEz08n8ZdlJ9hd9n5hWrhEVMhcF0jCDzEbybf5VPTE/1qaWsHQS4CPpN8ontw37x8sT6C4H2JmfQ8OP3DY7Upwsj9SOJGVcevjk12xWTDOIYjMBaZtmPeEQoKBrzetRDw==
Received: from MRWPR04MB12277.eurprd04.prod.outlook.com (2603:10a6:501:81::19)
 by DB9PR04MB8297.eurprd04.prod.outlook.com (2603:10a6:10:245::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 07:37:36 +0000
Received: from MRWPR04MB12277.eurprd04.prod.outlook.com
 ([fe80::b242:b18e:8fa3:56f]) by MRWPR04MB12277.eurprd04.prod.outlook.com
 ([fe80::b242:b18e:8fa3:56f%3]) with mapi id 15.21.0315.008; Fri, 14 Aug 2026
 07:37:36 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andersson@kernel.org" <andersson@kernel.org>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, Peng Fan
	<peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu
	<mingkai.hu@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4 1/4] dt-bindings: remoteproc: add
 imx-rproc-psci
Thread-Topic: [EXT] Re: [PATCH v4 1/4] dt-bindings: remoteproc: add
 imx-rproc-psci
Thread-Index: AQHdKkfpAcJSOo/K8ke1LfQ/aU/fYLabnAwAgAAAf4CAAYvW4A==
Date: Fri, 14 Aug 2026 07:37:36 +0000
Message-ID:
 <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
 <20260813-imposing-blazing-gharial-fbb19c@quoll>
 <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
In-Reply-To: <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-14T07:28:15.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12277:EE_|DB9PR04MB8297:EE_
x-ms-office365-filtering-correlation-id: d3b4d4bc-6a20-4950-cd6f-08def9d6e939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|19092799006|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 SKHDJEerOfUmpMZckmtu+9ruDR0Wc0Gg+ZVV1k23VGaxIRe2bsiV4IOqAu7Cw7Xt4uPKFpV5jvHXdOwmbcLfzoX5D8nahsaAGzscXNhaMF/mOfWmj9pChx9XnGtaUlJXUwrlqe3h8yjjVDMpR7RSNcSewx9aBq3oOPF20HrGvk9COVTAwGV7XiENLbuobjnFqEaB+hyayKL23zrGuPNetEPWmJTJqiFtplmeii8KzQrMEzLuJgsOoHiDxn/jUXxGbEauup0xAoWybaKk4ZaEB/F91MY5CVfTNsLZw/CB+WC/f8UQ2RrAnzspC+/FhHa6TBEovKkorvOb+yDqe7CERpjdkQuLRM05Q7sAoO8frTOJ0Awg6yHG0CkFm2x8COOAEWrzWRTVylNmR42CB37vInL0I90z4D/Qfi+sZOUfxd82oCK3GOhsL/Tz53SuFd5EZ/PdKOhr7E9GZO6csRmncU0OevSkRb8dRCDjWyPzC/+vA/zUkgOIB9OVvYqyUN4QVmfpywQKy4suNhtsCiaUwFKwcJIg3jOryiqlzYxNNKFjP/dIwrGjAa13ixr0d75Jg3wuuwl1eklraqKMF+tz0GyX/qtKUbA92i3nTqTVGRRqQEZwrA0uHQUuxMUrAyvVG6/OU8BG5HQ9kZnwRHAw2BySDsO0DoRW3HR56o6guhHHmFWBJ9BuhHUBYsQqrBwDTV3Aq59s6YhdBIJkEdDHTcn6rmahy4I3pXITXe4HX0c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12277.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eG92Ujk2akYySFNRb2VBK2VybFc3MVNNZTdwOXhXSDh6aVpMUkxwcXZBVXQ0?=
 =?utf-8?B?ZGxnTlYzVFJhem1IMmJoVXJRYWJ1MUs5STJNZnNZNkJ4dzNSMlNrWXlvQzZX?=
 =?utf-8?B?YWlzZFlNRTc1NnhGK2oyNG4wMkpMVVRIOW8yZG5uSE9CU3VQNDJtUHUySVFI?=
 =?utf-8?B?YXNCbFlXVisyUERGTklteE81NWxlSkNCa2VheEdsSDNGdTZFS2FKN3BhWEF6?=
 =?utf-8?B?WUVOZlBIUlJkbFdoQ0dhYkcxMkFneXdoVndOaklydUo2MUtOWlR0MUo3QUhm?=
 =?utf-8?B?L0VsSFdLM3JoNGNGYUJyb0VGV0xyRkphR0ozaiswbGdnNjZKWlNBcXJHOExV?=
 =?utf-8?B?T3NTUE03WXFzUUQwamhuUUhxNlJacWVDYi84Vm9kdUs3dS9XaldaazA4VGlB?=
 =?utf-8?B?OWs2WWwvTGk0RThwM3hBOFZEbkNteEt4MFVTZnFVaEUycUp1d0tldnJ0SnMv?=
 =?utf-8?B?MWQ4KytHQXR6UG9JT1dVVFZ4bTgrVWJmK0ZGSzB5Z3N3QjBQR0pCdjloVlN5?=
 =?utf-8?B?RzM4ZFNyTzY3TGpWM3ErUkNmZTVwendiaE5GUkNROGlUV296RGR3UTlMOFhY?=
 =?utf-8?B?RjlxbTBCYkpJUVdTa3NveWovVlVyb0Y5YjRUakhtbmo0WU0xNmJ5Sk1YL3Bn?=
 =?utf-8?B?RWhCVnBQQmRDM0lWSUFiTXQvQmg4eDJoWmwxVGw0MUYzWElNN0ttK0Z4Nzha?=
 =?utf-8?B?WFFvWXpub2VCL0wxWEhMQVIzT2VicGh2U0krT2JPbEVMdnhLcmtoZzA2V3Uz?=
 =?utf-8?B?WGo4bmRtZUZzclIxcXhabGwyaWZueDlPekR2ZTV0MHhTV0ZFT09WZmsxVFMx?=
 =?utf-8?B?WlJnSUhaYnorK0dXL0hYWndVc0NrVkU4YjlKWlFUZVdqN3RyTHRPTGFUYWdV?=
 =?utf-8?B?WUlRWWdtR0hLdURPZzlUVkFZSEZQTzVjaDF1dDN0OThaL1h3K2hPV0RTUlAz?=
 =?utf-8?B?TjRrekJmalUxTmdJYkxpMWtoWHBzNlRtQ24zREZjWGpWL2ZBUHo4NGcrQzVR?=
 =?utf-8?B?SC8vWjZDU3N4NjZDN0hXdEpoRmFpeTNTL2ZiVzFsa3RZSlljbDM0K2JZcloy?=
 =?utf-8?B?RG9zaENpbkxTcTVkeUNkZ2VpdUhEMUpETXIxWUp1QTNNc1dnRHhjUlJuSS9K?=
 =?utf-8?B?NndQMVBqOG0veldmQzg5TlBab0NYWGE0enNUZ3BMamR3OG1QTTNwNEVpOE55?=
 =?utf-8?B?SDVSbkpUUjhvakhCU0pIZDNQRmRhUThpUW9hMCtrK1VlRkZ0Slg5YzZBdE9Q?=
 =?utf-8?B?bW4zSEdkbHVyWmRNdVQzdVFPRTdUN2VzQnhiY3E1ajJOdVJldGc2OG5mY1NZ?=
 =?utf-8?B?Q21wUHdpZnQ0blVlZ3dDUnRSTDRSQlY1b3BZRDdVZTNlTmY2R0kwVnBRVVFs?=
 =?utf-8?B?RkNhb2ZNdUlYVTlWMEQzTzdiOHJQdmhYOWZPdGVIZ2RKckc4ZENCL2x5eG9K?=
 =?utf-8?B?ZTJEUFJoNmFxWmNlcTJqVjlkRlpHa2huSjBUMGoxWlVMR0NZWURxN1NlVjNC?=
 =?utf-8?B?bmpFM0dQZmpQMDFlSDBVendrdnJhWkZJd09xSm1iNEpUSnlUcHl0Wmcrc2JY?=
 =?utf-8?B?U1YyQitKdDRLc2cyS1Rib0svWjg4QVl5SUllUHVUNERON2sxdTN6dE1tSFRF?=
 =?utf-8?B?ZU9GZy9IdjhzdmhnSy9SM2dBWkx4eDV4dzlpTXRvcDYzLys2eUVNK3lzdVpy?=
 =?utf-8?B?UUR0c2JzUGFBdU1ielQ4MmNuYjZGMC9uWlBWdCt6bDQ0MXJHZDZraEh2eHVE?=
 =?utf-8?B?RU9hU3Vsa2RreXh4Tkl0UERKTjRYZno1dkZmcVJYZGVoUEF6akJKRm5BbHNu?=
 =?utf-8?B?UnEwYjE3S0FDK3ZDcTlVbzduekxZRXUrU252K1Y1b1NoK3A5RU9UVGo0M1gz?=
 =?utf-8?B?VkdkWUpIWXl4UTc2TDU5cnA0QWRISlFlY29nWGw2SmljdUpuRDBRMHJvcHA0?=
 =?utf-8?B?R0l5a3BHMG5keUh6KzJza215bmF6TGFUbXBFc3IwTkxsRUVicUtVMUw0Wm5X?=
 =?utf-8?B?OVNRSVY5MFp2UkVmVldzbDJST2dNaFYvSHJlWE52bXF1dkYwY0ZHdmZQR3hT?=
 =?utf-8?B?eUs2eHMzUS9LOGNWbldCTmw4bmZHOVVRaXdIaTYzY1dEa0s4dWFhc25pcWIy?=
 =?utf-8?B?ZVhyWlZ2Ull3SjZ6MlRrZXU1RlVYc3piMWNtakdrOGFIeW1NRG91MGxZUEtN?=
 =?utf-8?B?K3d6enI3d1RZRFNxMk9jOVJZcFpiNURnWEI5U0tZZk5uWExZQ0hkQ2JUaUF6?=
 =?utf-8?B?akllYlRVb1d1NEN4WEZhQytiaTdYSzhBcU91NWpVRTdKczJKUHhqUEVpd3lW?=
 =?utf-8?Q?h2oX/sIRKwMHII7COG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12277.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b4d4bc-6a20-4950-cd6f-08def9d6e939
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 07:37:36.4195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6/cHtH1LciVOJ/JLozhxIVEce67NsKR3E2l+yPnUd92oYlCKAVZzWHabpHrNDqAlZJ/InZfkuFsyMV2CTsLGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8297

DQpOWFAgQ29uZmlkZW50aWFsDQo+IE9uIDEzLzA4LzIwMjYgMDk6NDksIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+ID4gT24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMDY6NDY6MzBQTSArMDgw
MCwgSmlhZmVpIFBhbiB3cm90ZToNCj4gPj4gKw0KPiA+PiArZGVzY3JpcHRpb246DQo+ID4+ICsg
IE5YUCBpLk1YIFNvQ3MgaW50ZWdyYXRlIG11bHRpcGxlIENvcnRleC1BIGNvcmVzLiBPbiBjZXJ0
YWluIGkuTVgNCj4gPj4gKyAgcGxhdGZvcm1zLCBvbmUgb3IgbW9yZSBvZiB0aGVzZSBjb3JlcyBj
YW4gYmUgb2ZmbG9hZGVkIHRvIHJ1biBSVE9TDQo+ID4+ICsgIG9yIGJhcmUtbWV0YWwgZmlybXdh
cmUgYXMgYSByZW1vdGUgcHJvY2Vzc29yLCB3aGlsZSB0aGUgcmVtYWluaW5nDQo+ID4+ICsgIGNv
cmVzIHJ1biBMaW51eC4gVGhlIGNvcmVzIGFyZSBwb3dlcmVkIG9uIGFuZCBvZmYgdmlhIFBTQ0kg
KFBvd2VyDQo+ID4+ICsgIFN0YXRlIENvb3JkaW5hdGlvbiBJbnRlcmZhY2UpIENQVV9PTi9DUFVf
T0ZGIGNhbGxzIHRvIHRoZSBmaXJtd2FyZS4NCj4gPj4gKw0KPiA+PiArcHJvcGVydGllczoNCj4g
Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4gKyAgICBpdGVtczoNCj4gPj4gKyAgICAgIC0gZW51bToN
Cj4gPj4gKyAgICAgICAgICAtIGZzbCxpbXg5My1jYTU1LXJwcm9jDQo+ID4+ICsgICAgICAtIGNv
bnN0OiBmc2wsaW14LXJwcm9jLXBzY2kNCj4gPg0KPiA+IEhtPyBTbyB5b3UganVzdCBpZ25vcmVk
IHRoZSBmZWVkYmFjaz8NCj4gPg0KPg0KPg0KPiBBaCwgeW91IGp1c3QgZGlkIG5vdCBib3RoZXIg
ZXZlbiB0byB3YWl0IGZvciBteSByZXBseSENCj4NCj4gQWZ0ZXIgdGhyZWUgbW9udGhzIGFmdGVy
IG15IHJldmlldywgeW91IHNlbmQgcmVwbHkgdG8gbXkgY29tbWVudHMgYW5kDQo+IElNTUVESUFU
RUxZIHlvdSBzZW5kIHY0IHdpdGhvdXQgd2FpdGluZyBmb3IgbWUgdG8gYWRkcmVzcyB0aGVtLg0K
Pg0KPiBTcnNseSwgaWYgeW91IGhhdmUgdGhyZWUgbW9udGhzLCB0aGVuIGRvbid0IHlvdSB0aGlu
ayBJIGRlc2VydmUgbW9yZSB0aGFuIDEgaG91cj8NCj4NCj4gTkFLDQo+DQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQoNCg0KSGkgTWF0aGlldSwNCg0KSSBzaW5jZXJlbHkgYXBvbG9naXpl
IGZvciB0aGUgcG9vciB0aW1pbmcuIEkgd2FzIG5vdCBmYW1pbGlhciB3aXRoIHRoZSB1cHN0cmVh
bSBjb250cmlidXRpb24gd29ya2Zsb3cg4oCUIEkgZGlkIG5vdCByZWFsaXplIEkgc2hvdWxkIHdh
aXQgZm9yIHlvdSB0byByZXNwb25kIHRvIG15IHJlcGxpZXMgYmVmb3JlIHNlbmRpbmcgYSBuZXcg
dmVyc2lvbi4gSSBzZW50IHY0IGltbWVkaWF0ZWx5IGFmdGVyIHJlcGx5aW5nIHRvIHlvdXIgY29t
bWVudHMgb3V0IG9mIGlnbm9yYW5jZSwgbm90IGRpc3Jlc3BlY3QuDQoNCllvdSBhcmUgYWJzb2x1
dGVseSByaWdodCwgYW5kIEkgc2hvdWxkIGhhdmUgZ2l2ZW4geW91IGFkZXF1YXRlIHRpbWUgdG8g
cmV2aWV3IG15IHJlc3BvbnNlcy4gSSB3aWxsIG1ha2Ugc3VyZSB0aGlzIGRvZXMgbm90IGhhcHBl
biBhZ2Fpbi4NCg0KSSB3aWxsIHdhaXQgZm9yIHlvdXIgZmVlZGJhY2sgYmVmb3JlIHNlbmRpbmcg
YW55IGZ1cnRoZXIgdmVyc2lvbnMuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZS4NCg0K
QmVzdCByZWdhcmRzLCBKaWFmZWkNCg0K
