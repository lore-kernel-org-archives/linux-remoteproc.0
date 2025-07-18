Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41286291C3A;
	Fri, 18 Jul 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828804; cv=fail; b=oOF2psmNSm7jzoNUCBPG520XrDa07+Jv7anUvgcuIMJ3IHsLxtn85A7ROob+SbAYyGhTG28uqRPNp38KqxRKL7TrWY7vD+4ad/sMUds1LkO4OUFs1bxlESQq1rga3N9aYpFV55U3I3LVCxhPalBiMGXHT3eRK4x9UgE8HrGZviw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828804; c=relaxed/simple;
	bh=mGi/QgYd8bcBFiO/qbwsApfHrPEtWHrzi1I1Gdop83U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e4i3lilICDOSmyNKxrrjsWaX53zsNSO4OtX/zrpoKyRb8j+ecpR37n24lDGd/wa0Fd2IfVWVALP+gtdMW5nnesE3fxy/V6D9T7YeyvnBEAEjP1pEB9VBC17uPZpPBfS2wRGAW6xRZU2iVNS7+0Gy677QGKMAoZy1O3pUlWey6OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B0md6Ee+; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B0md6Ee+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NihJon6FHQlxYHziZIwYdXV/IWoz539FKh9f8JnOMb3q1e8e5qoDw4EJAwuD7FOPfiu3RVuvakHESIcfF3mjLnfmljp/pW1fMHoB0s9Ln4fkRa4xqrqnnaqkfJT9FKph47ZZcwunbgVk5f2MiFStMQ4WuZkrHFbU9lmnH1pidZ0tjZLRedfsV7Qex5StvzBd/n74KOKjXstzEA89McKIC9I1XNLdRvCrVnVtiZbkgNPEUVoH3TuI8hUDji7kLnnEoSdj6y3elO1RHTdRn4r3pwZ6jjTUERKaBWyvdIo4MS8ewofmdyWCe+dzK/8UJ5wt6QPN/l5POiVPBolQEK6Osw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGi/QgYd8bcBFiO/qbwsApfHrPEtWHrzi1I1Gdop83U=;
 b=a3K1bESP+xOLGnRMzy34YgUiOOefDyPo8GAJRzG7BYbe0x0GsJewUHFDw5hQHoLvcS5JmRSMx7pYwp9POQgPu+VlG98tphpVurNwQ3RckSZKV2Voo+V65g9eAcFWk8SZOO8AI9liMS9uWY9FsOZPHDBGpgRaFnvhsBwqgn0w9i8Rzxb739yhPeL2a+IJP3b8H1k66LcaU9/HhFRrmAw1KAatf66pogXEHowD9OL0QvAWydqKfKzps/FCblui/2GtUf1n7wEH03tYn8RSlW+K8NacvOaP4vrOALzXXpDBDa4sc7UrxEad+r6k626SLZqtz4ne6vIUv/J/cmpLok7jXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGi/QgYd8bcBFiO/qbwsApfHrPEtWHrzi1I1Gdop83U=;
 b=B0md6Ee+WTmnvjrqTeDTNxlQhwbt+DmS1ZrK+yjKndpz4otuf8hNcdsl1CFNYmmBC/OXw61ZlStWT9CsrIzTlwkswIGAe0BpOO7HlAUvbGeK1B2Cf0BWAtedKpXHdIY8UAZZJINNdhInpPBBrFQ3fAoKQdEGWa4dhAzW4a+DmXp8B4pQvMSIB6vIztpW1tS5oiEyM6KPh1uMNjNHFt6uFa7HnFdRUKGGFsb+2flaqmFmAUGWVJvDI1YJ+HRxFSqPGkLL2KojsFSrNcMprjqGGPUK9w+VDWvfHw5q4wok4m43+R1p2/NDFDL/yh8wFLf+6QRh/1eXZd+0HxMvVjon+g==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10638.eurprd04.prod.outlook.com (2603:10a6:800:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:53:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:53:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Iuliana Prodan <iuliana.prodan@nxp.com>, Fabio Estevam
	<festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Thread-Topic: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Thread-Index:
 AQHb8ZOOjNSVtKFE+EOehjF4qQ8e2rQs/usAgASI8CCABOjGgIABJeIAgAAAOoCAAAOmAA==
Date: Fri, 18 Jul 2025 08:53:19 +0000
Message-ID:
 <PAXPR04MB8459A0F330554EB69E990E048850A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s> <20250718082033.GA25126@nxa18884-linux>
 <0e72dd5c-c633-4265-a6a9-ed8ef7dbf67c@linaro.org>
In-Reply-To: <0e72dd5c-c633-4265-a6a9-ed8ef7dbf67c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI0PR04MB10638:EE_
x-ms-office365-filtering-correlation-id: 6afa947b-3b0b-4962-09c9-08ddc5d88afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UENqYk1wb0tHdlVuYmJXaDZ1K0pGYnFCQklZOVo5NjdoaVU1YmlnQ2xiYWV3?=
 =?utf-8?B?SUtMV2ZvOENJdlBIMHZGTlZWb3lHcE1idUx2NEI3T0hVdnBQZ2w5a3c4S0Yx?=
 =?utf-8?B?aXJ1b1FhVmw1cVlUTS94QzFXT0xiWGFnSmt0ZWxWOS9sRDRWV2ZnTW9sL0dx?=
 =?utf-8?B?MlJQZ3V1U0p6aTl2aUVnRnRubEVOSGVTU2RPQUYzakVVWENoRVQvUlVkS1J1?=
 =?utf-8?B?ckIxbWt0dWs2cHVhR2ZacTJhaS9QQy9PdzF2K1g4OU1jQ0s3MkZmWVRQbmZv?=
 =?utf-8?B?L1B0eXI2L0QxK2RoOHNSL3V1RjV1RUhFRUJVU1k2RG9jZGp2d1BRVVdnRlA4?=
 =?utf-8?B?dStZdUhMU280Slk4QXgyZ2lmaXBIQlBJWDVmTGl3NS9nTUVlU3M2WmV1QjYx?=
 =?utf-8?B?a1ZaSHM0eFpYTlFxQUdleC9XY0RrQlc1QmIzS1h3TjNrUDZjRnd3RHRKMU1o?=
 =?utf-8?B?TzNUZXorSW9xNkd5V241YVN3YmZPK0lRZ0tPdG04bTlPUWdkaTBZcHpNUWZp?=
 =?utf-8?B?TDlvQWV6VEV1VS9XTnJnVjZzRmhiVFM4Sy9iS01UZ1M5elloVWcyTTdxOXNP?=
 =?utf-8?B?a3lla3dVZ0VmOTU1ZHRRMkFQN1ZWOHdIZm1BcDdqaWRvZVdaOHpaWk4vZzJT?=
 =?utf-8?B?a1ovbk1CK0pEVjZoWFdqbVBOaWVGSXRxckozcXZoeWlpN1FKUXdtZHJsNHk3?=
 =?utf-8?B?alVmdmU3aWhlV09EYkxSWWZHNDdSdHZiQ1NiY2kvVnRLOUxDdlBYVDhobjc3?=
 =?utf-8?B?UGJtaytaMGgySGNBL0s1d2lwSUFWQVlVTWpnRUMxMnlNUVUyN3NVNzhyREFU?=
 =?utf-8?B?OWxYSWo5RlRZK1lEcWNlZTJsSVpPeHFENm04SmVHMHBFUGowcG5pU21NcmNm?=
 =?utf-8?B?anR5Mkd2OU1DZkRDQWttZkVRK1N5TnBQb2NlMUxLSjBEUytzNENDVE04SlZJ?=
 =?utf-8?B?RC9jWmZRZi93RHBIUUVnUkFXZkZRVEVsUEMwRHJkUUZnSXlFSXRldmozalI5?=
 =?utf-8?B?U1dzQUVNVjEzQ2JXV1RMZXM3cmJFVnVoSVlvaU1qTVRXL2ptcHNNU0RFeC9H?=
 =?utf-8?B?enhCN29COTQ1Nkw5a215ZTh1R2R6TGFIbS9UM2IrVkRsaW5uY2dNNm8vVXhX?=
 =?utf-8?B?V2RCTFpDNmNrZUc2VnR4WFBVbVY5ZEtWVGxHRHJjb0lCUUc1TXBFVFoyYStr?=
 =?utf-8?B?bEVNRUVEZ25LZm9keDZ2R3hCU05KcWo4Qkh2SEprVk1naG1tRDFxSDd6bkZl?=
 =?utf-8?B?OTBxTEVFa3RlYk03QkhvNFJwdzJJd3RCNnRNY2VPSFJrZS9MSGgra2E2QlFS?=
 =?utf-8?B?NEpGV1UxQmVOeXBpYXpyUEJQdFJPUCs4Q2tqSkJPZzhrVXNiaUh3ZWhsMzg2?=
 =?utf-8?B?Uml1dkQxUXZvM1c1U0RYM01GcW0zOGxFNVVsQ0h4MTRxMW9QNVJpb2JVTmlU?=
 =?utf-8?B?Q0lrNlN5Q0hPRjZIb3BSTndRODBiT1ozczEwL2cvRjRKT3p2YVdXbmxIU3dM?=
 =?utf-8?B?ZXRFTjlkb0YxWFVoZzNlYXpCQ3pRMEgwT28vc2pYd2lLcm9lcGRIMS9HNG03?=
 =?utf-8?B?NTFWZmJRYnExYk01RXhHUjhHaGsyekgyMnJKK1laQzd5MUswNThucmxZWjIy?=
 =?utf-8?B?dDZxVlhJNFJRb1YwNk9kMGlHU1VpSVJQQURFbmIySjhGQ3V4V2VONjVObmcx?=
 =?utf-8?B?ZW1RaHRROVY2OEpKNHZLYWxLREUvNnl3NFZJZUhMQnMvUUJXSEJ0VVFtVEEz?=
 =?utf-8?B?TjZHS25Fb2Jlby9sbWE4K21jeUpDTmNSV1Z0emR5UStQYTM3WnFuY1FTMmtK?=
 =?utf-8?B?VjBITC8wOCtzRlZWRUViMVRob1ErM2xZTHljU1dBajNqTEVGenJCK3h2akdz?=
 =?utf-8?B?bUpRMEJWZDlFck1NRGhIdVJGQlg1SXZyOXJ0YTdyc0tzU2laYzNuQXhZNngr?=
 =?utf-8?B?OVo3aG5tOTZHUnlaYTdhNml1T2dOZDVPUUdxWnRNN2lVc21UVmRIMUVWUzFO?=
 =?utf-8?B?N3BoT2NSQ0hRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnk4UW1JYktBdnd0RTliQzVOME9ZWHRaTG03R3BCY0UvYm5uaGJ0N3JaWUh5?=
 =?utf-8?B?OUR5U2kxMWRLQjd3TXFHdjcrM3ZmSXBpK2J0QXNURThNQTJ4cHZaRmxRZXE0?=
 =?utf-8?B?c3hxdDVxT3FacXZwSWpCRml0bnFVbFVKVHF3S3JPK3ZHY2J2V3Z5Z1JWOFRy?=
 =?utf-8?B?ZEpBOXF2YU1tWlhVa2dPNllTa1ZzZEk5bDgzclVGcXgwdGxySVJyMUYzRWxS?=
 =?utf-8?B?VmoyVVhVRTU1aFp5Rm4rMVNxbWFPTm1PN3ZwQlBsSWFsNXN1THo0dGg5d3No?=
 =?utf-8?B?S20xcitQbDhRSHVNcHArZE80LzlTZlU4T1lLZlVWZVR4TFY4Vm5wKzZnN1B2?=
 =?utf-8?B?d3BhdzJ4aktBV1B1WEk2eWt5eTlxTmliV1lvSnRod2I2RlMyNTZWWGJQaFFP?=
 =?utf-8?B?VDNtWEs3L1NsWU1ZTUQ5dkF1bVdMNCtSamNHRW1KaUdwVW5zSi9hQkhQb25N?=
 =?utf-8?B?MjhBeEJsbU80bUF0NzRxMHlONVZDa09WbldvaUJocFFzRGlaeGszTWZUWUli?=
 =?utf-8?B?QmpiMkl2bjlYcitpeFBVZnJSVkEyckJBVkZCeHd5Qytyc1Z3ejhscVByZG1Y?=
 =?utf-8?B?L3RTYkdtL21mTkNyV3NpNCs0T3Y1YnBnd0RQZGEzRmg2TzlhVTcyb3l5Rjky?=
 =?utf-8?B?OUJ6N0NVUFRBd09wSDJtaVRnelN5ZXZ0anJ4cmI1UGFPT2Z0NzZZZ2ptVWMw?=
 =?utf-8?B?SmVNaVJybG1ldWlRdFlsVTFXcGYydDZHK3J6d1NHMFB5cElscC9heEUzdmVO?=
 =?utf-8?B?Z1E2bGxwZ29ucDV3aGkyKzA3THNpa2dCaWloL1ZWVUZNd0NQRkZaZ3l5ZVA4?=
 =?utf-8?B?dEIxYldZU2NjWnRzdVNwelZlUEoyeWZ3NTNaQllHaGtZbXhFSGVUNkhLalpj?=
 =?utf-8?B?dlpCR2ZGa2lyajJoNWJRY0orSFprODh6Vm1ldmJMVlZwSHBYcUdJUE1SVldI?=
 =?utf-8?B?Q2UybGFNWUJSaGkyQjZLa1hxU0NiMkhBT3B3cTFxbnNKRlh1MHlKbDAwT1Zq?=
 =?utf-8?B?WTJWOUxVSWZLLzc5TnFxNXk1UzdpYUFBTUpvMDFTOWpKM2FqYXlzTXE0dDRQ?=
 =?utf-8?B?UVIzcE85TC8reGVJTHQ5MEdRVlJHSmorcUd1a1MxUFMvb3k5bjFDU1RKUkZS?=
 =?utf-8?B?MDNxRUR0Rnd5cDQ3L3BTWnk0T3V2R2RLVmxpYkxxemswd2tCWXVyZmpmazkx?=
 =?utf-8?B?UlFBaHJHT2hPM3RXUGYrVjhsWU5FcERuRzdML1FNOFAwbVc3ZWRidEZwZ3pF?=
 =?utf-8?B?YzBES3JSaXRFVnZ0dGFyM1EzejIzbXhmdlFQWmhuRDlFcHpJVXlWeG1OVkNE?=
 =?utf-8?B?N0NaS1p6S2dPVDJRUFNtWmVBTEhTNmE5ZTAxdElaZFZ3bU0vRmtodjZPQTd2?=
 =?utf-8?B?dnNXVm45bnZQTEZZYUJxWDZ0QkZKcWZMVXZLdzJWQ0twRkNlSzFtSnJ2T1RW?=
 =?utf-8?B?VkVMaHQyTXl0MEEvRjFCa1JTcGRsaWZ4OFFiSEI3ZllIb3lVQWdNOUFzWmRo?=
 =?utf-8?B?cWh2QzJXMUZPcFQ5cWxod0lSTDk1TDFzRVdOaEpHU3hUYWYyNDI5VWdnem55?=
 =?utf-8?B?aFlvMEplemZTQ0tkRkNRVjNCb0hnQWhFczM0dHVGVXF1QUlBUnFGMURUcXRS?=
 =?utf-8?B?YnpQQnFSbll5T1BLenBoTWNiM0R0QXh6cWFrcXpwWHJNdm1WUHBEaXd5aHhK?=
 =?utf-8?B?RHpaKzJhd1pJNkt6eUlVaFBFOEJRSzc1QjVJdjV1STVSNVRMaGNpejQ0ZSt5?=
 =?utf-8?B?cVd1WGNMbHRqMkNRelI4UENPZlk3ZDRJYmFTMVdtMTcvWWNEWGZXZW5hRHdv?=
 =?utf-8?B?T1JGUG5QYVpiZnBRbDRHOXNXc25RWlFsanFjOVlDT2pMcFdqM0JxSXF1Uzhv?=
 =?utf-8?B?VjRGWjNUVU1zZTdMamtabEt2L2xoTmVmOG9rTlM3bFFSc2xXM25MMUQvZExh?=
 =?utf-8?B?WG9xbE53YysycW4vOEVVVmluOU1STDQ3Qm5ld2IxNzhrOTF6cmpGeFhrcDJY?=
 =?utf-8?B?VVc1UGl4ajVpYTRUemxjcWhUVE5DTVY1c0xMVWpENmQ4MXdabDNabkYyQzh2?=
 =?utf-8?B?ejRqbXZPMUo3SUFDWEEwV29sZitTbWM4TWVkVVpyZnlMVFpDSUpwSFhFMzFK?=
 =?utf-8?Q?U1pw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afa947b-3b0b-4962-09c9-08ddc5d88afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 08:53:19.1474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ivydQZbqrWWSUHLc4/EF0dLu9eA7PmhEG1dvcIf283YOrcRTlzHwFggyWLS3EnLUngvt7/9A8vX5v4v+NTSJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10638

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvNV0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBTdXBw
b3J0IGkuTVg5NQ0KPiANCj4gT24gMTgvMDcvMjAyNSAxMDoyMCwgUGVuZyBGYW4gd3JvdGU6DQo+
ID4gT24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMDg6NDg6NDNBTSAtMDYwMCwgTWF0aGlldSBQb2ly
aWVyIHdyb3RlOg0KPiA+PiBPbiBNb24sIEp1bCAxNCwgMjAyNSBhdCAxMTo1MjowNUFNICswMDAw
LCBQZW5nIEZhbiB3cm90ZToNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvNV0gcmVt
b3RlcHJvYzogaW14X3Jwcm9jOiBTdXBwb3J0DQo+IGkuTVg5NQ0KPiA+Pj4+DQo+ID4+PiBbLi4u
XQ0KPiA+Pj4+IE5ldyB3YXJuaW5ncyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBmb3INCj4g
Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS8nIGZvciAyMDI1MDcxMC1pbXg5NS1y
cHJvYy0xLXY0LQ0KPiAwLQ0KPiA+Pj4+IGE3MTIzZTg1N2RmYkBueHAuY29tOg0KPiA+Pj4+DQo+
ID4+Pj4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTUtdHFtYTk1OTZzYS1tYi1z
bWFyYy0NCj4gMi5kdGI6DQo+ID4+Pj4gc2NtaSAoYXJtLHNjbWkpOiBVbmV2YWx1YXRlZCBwcm9w
ZXJ0aWVzIGFyZSBub3QgYWxsb3dlZA0KPiA+Pj4+ICgncHJvdG9jb2xAODAnLCAncHJvdG9jb2xA
ODEnLCAncHJvdG9jb2xAODInLCAncHJvdG9jb2xAODQnDQo+IHdlcmUNCj4gPj4+PiB1bmV4cGVj
dGVkKQ0KPiA+Pj4NCj4gPj4+IFNhbWUgYXMgcmVwbGllZCBpbiB2My4NCj4gPj4+IFRoaXMgaXMg
YmVjYXVzZSBbMV0gaXMgc3RpbGwgbm90IHBpY2tlZCwgbm90IGJlY2F1c2Ugb2YgbXkgcGF0Y2hz
ZXQuDQo+ID4+DQo+ID4+IEkgd29uJ3QgbW92ZSBvbiB0aGlzIHBhdGNoc2V0IHVudGlsIHRoaXMg
aXMgcmVzb2x2ZWQuDQo+ID4+DQo+ID4NCj4gPiBOb3QgdW5kZXJzdGFuZCB3aHkgaG9sZCBvbiB0
aGlzIHBhdGNoc2V0LiBJIHN1cHBvc2UgeW91IG1heSBub3QNCj4gPiB1bmRlcnN0YW5kIHdoYXQg
dGhlIGVycm9yIG1lYW5zLiBUaGUgd2FybmluZyBpcyB0b3RhbGx5IGlycmVsZXZhbnQgdG8NCj4g
PiB0aGlzIHBhdGNoc2V0LCB0aGVyZSBpcyBubyBkZXBlbmRlbmN5Lg0KPiA+DQo+ID4gT3RoZXJz
IGFkZGVkIGEgcHJvcGVydHkgdG8NCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg5NS10cW1hOTU5NnNhLmR0c2kNCj4gPiAmc2NtaV9iYm0gew0KPiA+ICAgICAgICAgbGludXgs
Y29kZSA9IDxLRVlfUE9XRVI+Ow0KPiA+IH07DQo+ID4gQnV0IHRoaXMgImxpbnV4LGNvZGUiIHBy
b3BlcnR5IG5vdCBsYW5kZWQobWlzc2VkIHRvIGJlIHBpY2tlZCB1cCkgdG8NCj4gRFQgYmluZGlu
Zy4NCj4gPg0KPiA+IFRoaXMgcGF0Y2hzZXQgZG9lcyBub3QgdG91Y2ggc2NtaV9iYm0uIEkgY291
bGQgaGVscCBhZGRyZXNzIHRoZQ0KPiA+IHdhcm5pbmcgaW4gdGhlIG90aGVyIHBhdGNoLCBidXQg
SSBkbyBub3Qgc2VlIHdoeSAibGludXgsY29kZSIgdW5kZXINCj4gPiBzY21pX2JibSBub2RlIGNv
dWxkIGJsb2NrIHRoaXMgcGF0Y2hzZXQuDQo+IA0KPiANCj4gTGFjayBvZiBwcm9wZXIgYmluZGlu
ZyBmb3IgdGhhdCBwcm9wZXJ0eSBtaWdodCBoaWRlIG90aGVyIGlzc3VlcyB3aXRoDQo+IHRoaXMg
cGF0Y2hzZXQsIGJlY2F1c2Ugc2NoZW1hIGlzIG5vdCBldmFsdWF0ZWQuIE1ha2UgeW91ciBEVFMg
YW5kDQo+IGJpbmRpbmdzIGNvcnJlY3QsIHRoZW4gc3RhcnQgZ3Jvd2luZyB0aGUgZGV2aWNlIG5v
ZGVzLg0KDQpOb3QgTlhQIGJvYXJkLCBJIGNvdWxkIGhlbHAgZml4LCBidXQgdGhhdCBzaG91bGQg
bm90IGJsb2NrIHRoaXMgcGF0Y2hzZXQuDQoNClRoZXJlIGlzIG5vIGhpZGRlbiBpc3N1ZS4gSSBy
ZW1vdmVkICJsaW51eCxjb2RlIiBmcm9tIHRoZSB0cW1hOTU5NnNhDQpib2FyZCBkdHMsIGFuZCBu
byB3YXJuaW5nIHdpdGggQ0hFQ0tfRFRCUy4NCg0KTW9yZSBpbmZvOg0KVGhpcyBwYXRjaHNldCBk
b2VzIG5vdGhpbmcgd2l0aCBzY21pX2JibSBub2RlcyBhbmQgYmluZGluZ3MuDQpUaGUgd2Fybmlu
ZyB0cmlnZ2VyZWQgYnkgdGhlIGJvYXJkIHdoaWNoIGlzIG5vdCBOWFANCmJvYXJkKGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk1LXRxbWE5NTk2c2EuZHRzaSkuDQpUaGlzIHBhdGNo
c2V0IGRvZXMgbm90IHRvdWNoIHRoYXQgYm9hcmQgZHRzLg0KDQpXaGF0IHRoaXMgcGF0Y2hzZXQg
YWRkZWQgaXMgc2NtaV9jcHUgYW5kIHNjbWlfbG1tIG5vZGVzIGluDQppbXg5NS5kdHNpLiBUaGUg
YmluZGluZyBjaGVjayBhbHJlYWR5IHBhc3Mgd2hlbiBJIHdvcmtlZA0Kb24gdGhlIHNjbWkgbG1t
L2NwdSBwcm90b2NvbCBwYXRjaHNldC4NCg0KQmFjayB0byBEVEIgY2hlY2ssIGJ5IHJlbW92aW5n
DQpsaW51eCxjb2RlID0gPEtFWV9CQUNLPiBmcm9tIA0KYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OTUtdHFtYTk1OTZzYS5kdHNpLA0KdGhlcmUgaXMgbm8gd2FybmluZy4NCg0KUmVn
YXJkcywNClBlbmcuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
