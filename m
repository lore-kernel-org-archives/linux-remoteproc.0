Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664CB1C5486;
	Thu, 18 Dec 2025 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037064; cv=fail; b=Ioh2McPq8au7nGB/ZV8QJKCsherW2X1TaHwip6haiXccMsj2ejQmWqx95T1hO+WdcoRIdzKpsAk6jPdSTmaNXonOHjfyGH336NNxbOJUMGlg1aKqg4ytxI0YnwwSoA5SU4i0PQ7cB/3P/mGX7/pnCRjXRFFct/WyLUXvY8pVIJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037064; c=relaxed/simple;
	bh=xjhYLecQKz0G6giV4lzIQwYZKWTErLuevPE144Vv6Go=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=thSPhe0tyqrms3FxcqAF1/p3ScG9WOq9RJwF3DcFIbEsgQv9XQEYEqEoGPGofaYvvLWWJOylvqfkAvdKS8Y6HY6zxm+wuE4Ld8ofRV4FdlIifaHetCjPVXZ1vmJ0IbUcpsrEm9vqZHwY0AqHT5zR+DJ+mF7e4ujvEBG59IvjzPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qJBPZscA; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qJBPZscA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suadhbDQ8x2uHyiZN1QH7qxe6Xa1cStx6fvUJyCctN4XYfTlhWSOUh5t1QJSlLJPIq4J4ygfEMOa8ijwVlw1E6Lb3rVP9gguQ8TMw+cj3UZouICSG+jy+T2r//fkHwdxeCXPTzm67QMNVkgLu3yMVXch6ftKQAmQLcNUvyzGWRkynvsOeitSXrpyqhdPltGpraYoAjBqhPyXa0xhW8/lDEOni2h9IBBSb/lrbfRkDvNtuyNp8pYirSKvElWX9QIsW69mXyPl020k0OFtEDbgwt8z3CKwB0huNcgVPuEDlIuk99IMIHhZkeKunv8qDuof+VTpFk4/D+H0qplLWUX4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=CpYuD92xTKTvww0jH0yfw3urPFUyqBE3Ndtu+REXlLNiGcJg0oRLwp9pQ+aJU7A2m7QHzwKRQLOGpxkSpzKDk1+8nki3+QcLPhIAWV7c2RpDnnA9+AZAcxhdIBlERjWGrU1Q0ttG5eXn6q9ws4SbxV2itpuiJ5t+1V++S/xj6L6Q7o7dmUPmmUxtJmg6Az2M+1gC0/37cpgt5LtBLc/1407V7eZ8Ipgkh5Z5Tc48EZCMl7deNxIhGANOV8HK7sXVJol0UKBSOwyDxsLlj8XEj9nzlx/qbI5TIE7nAZs7GyGSV4VE2kQAO1I052EhVpM1NKWmPR8xAaNPuhe33GwwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=qJBPZscAKSokHnPrwYcKG6ST6hEp7cbJB1yHLJNesZkKLm5FqO/mMPKnAjYjsAMexxuvcdiPc9ozYOMJ2yMoimM2+1b6ztmVh34bW2vmUy7Pnj7/PQZIPEa932hie/uR0lmINtHjFBpez9FSSUqOnmnoQIzWg0LWK7UB5hxWpS2x9SwkJeUHR3o6+MdH5zyRh/PZZO6GrcJ/t+gSqXhl8PgbdyyDWqBtMUzgoLRESW89LVH3luX/O4BZMMRX78EugQlOefrhMLvOTbB0STbhEyuEDpx8OJikjA2q/rkmjVXIuT486lvT8auWmx6NopOh0N9ojZhkGGyVRClyIEZIqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:09 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Dec 2025 13:17:35 +0800
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-1-b56a27d4158f@nxp.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: ef89d1ad-0e5c-48ae-37e2-08de3df4d591
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em83Z296WXpLdml0QWlRVmJnZFdtQ2RMeVZwMG9Ja0hvSVR6RGtTWTJiZ1cw?=
 =?utf-8?B?OElEdGNLLzErTDJUKzF4RVcza1BRSVV0MXVHbGFJS1c0a0tmTkhSNHhUSlps?=
 =?utf-8?B?TjdOV0pCdnFCcHY4K2k3elcySFJ1ZmUzNEZ3Rm9nTjRuWnNtazYvaGh3cWxu?=
 =?utf-8?B?dGxxTmp3K05lN0RXYWtVcU0wOTdLTS92ZU80cnZmaHhLYmRxdDlUTm5VT3BQ?=
 =?utf-8?B?Vk1jbDRpRHZkbVNpVzdDa0N1OFl2NmhHZzVsZjBEc2FqT0l2NDRKNjBHYkF3?=
 =?utf-8?B?N2s1TnhyVzg1STR5ZTlUZGhLREp3NEV1MVZpREVkelhxQlM0Mmx2TlRtWCt3?=
 =?utf-8?B?eTRTY05iaWlXcEluS0JnbEVhUnlucHo1dk1hdjVaOWpnZDNrSTBuSksyeVZC?=
 =?utf-8?B?MTduTkFnL3JaRWQ1UitGKy9VWW43c1hsNEdmVXJFaHlpMi9LRkFWK2s4R1ZI?=
 =?utf-8?B?UXpmNm1yV3FmSmhBb0NNVElZalpiM0RrM21iWDZBbGlZcUhONXZPVzdKcDlq?=
 =?utf-8?B?eGNsQnJOWEs3eDhXRVRqVDlibUJYVU96SXZQbzV0YUFndk1jM3hVN04vdytl?=
 =?utf-8?B?WCtDSnRhUU8wcWNxL2hCQkkveHFsWnJPQmc5cXZ2M2Z0ekcxaW96Y005WEI2?=
 =?utf-8?B?Mm1nZ3VXQTVScHdXM3l1eG5DOWY5SGtLb2RaNjB3YVVoTWQyVytRNkw4Wkdv?=
 =?utf-8?B?aSszaUkrdjEzYlVNcjBqbFk4R3U5MHZrKzE4ZU13T1YxZm1RZHA4SVBsZC9L?=
 =?utf-8?B?VkM5T2dhWUFOZ1lDZ2txSkFPbW9VNGY3RVo5ZHZKc2hDUlFiTDM4dmlOVW5t?=
 =?utf-8?B?Q1AzZUhrSWV5SzBSR1RzL3NLTnhqOWZLeHdtbW15bG8vV1E2TWNJNURJcUlE?=
 =?utf-8?B?elVkR2VDeUZ5WEM1WHNSaEd0T25rZ1Jnb3ZudGdWR3dmQ0VNQnBIQWt2Vmo0?=
 =?utf-8?B?K2JTMzRza2JsNXdHRjVWR0hlcjFYU3NFcmJ0UCtuNVB0cUNLR215aEJhSmlR?=
 =?utf-8?B?YnVodklaM0MrdGI0dExpUUFHRkM1N21KOFhxbkpjekFhdjRTei90TWlBbTk1?=
 =?utf-8?B?cGJkVzNRQVdNTGt5MWpJWENsdFlodHZoS0hvQk9zMWFiNDdLdjNnSXlGVDBq?=
 =?utf-8?B?WDZmb3lDVGU4SHZId2NQTHQ4RHVycUowbVhnRHpZUDRqejlrK3Nmbll1YlJy?=
 =?utf-8?B?cDBnOXZTdTRXUmFkb29VMTdhTjFyYTk4cVlQSG1KUVNKbkVQeUtmOGVEYllE?=
 =?utf-8?B?Zk5DU3g2UWczSlB0dENLK3dpdSt1cTYyV0RhOHNlVjZ4YVZsYi9WbGR3eXdE?=
 =?utf-8?B?T2dVVDFTVUdzN1FrVDFWeXhuNm5XMnEvdDdqZjJSN09SR1NObGZ1Um1aZFla?=
 =?utf-8?B?UURPNlpVRDJiVW0wUVJ2STZvcTNXcFk2UHRlNmRwemJ1U1BKWHVrT2wranBP?=
 =?utf-8?B?Q2c1YWc4aFZYRlprZ0NHck1NVHllTzRTNUNDdldDTkg0Y0QxYlZ4TkpobEt2?=
 =?utf-8?B?ejNNZ3JuT09sTlBTaVJSTVVncVMvbmpZb1FjVDRvRjlHOVI1YXYyc0lKaUp3?=
 =?utf-8?B?Z3cvNG9kTFRJL1FBcFNOd0M1Rk1jL2NTS2N3L3hLU1k3eUd5S0doUWVOT1M5?=
 =?utf-8?B?aGl0SEJjL09hK2pFTFVseHpPWlNvaTRtaUxZcmJveEhoL1g4UkptQzBpQUd2?=
 =?utf-8?B?RzFRREp1QWQ1OE0wU2JaTnF2dWk4T01tci9EVlB3Y3h0Q1FQeWQ3M3VIT2k4?=
 =?utf-8?B?cElJWURmZW9zeUc3M1dHMnRqQTBzRkd6K1ovNE5LdjdybGtoRWI3SGN2ZnF3?=
 =?utf-8?B?UkhUOHkwd09NMldhb29pMVFWRlpQWkRyZnAyUEYyMDRwNjZFQzRsL2pmclVs?=
 =?utf-8?B?Y1JNQmhiZm12THFaMEcwcE01QWpQUzNFbVd3SlZ4amZYTElEMmE2SlZmb2k1?=
 =?utf-8?B?S1c0eEw0ajZUQU0rZm5QcWhLTVVmY3lMOXhmYmVnN1NnUDBET1lERFE4YVpo?=
 =?utf-8?B?TE5SS2daNUx6T256cFZMdk9qS09INXdUalU3N3pJbTUreXVmR3VZbTJVS28y?=
 =?utf-8?B?Nys0ampxcFNIS1QwMktQdmR6aVZFZmdXMlNTdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkJ5UC80YzVUUE9oZUltREtXL01uOHJVVFB5NDdzbmFoKzRhQTN5eC80RENa?=
 =?utf-8?B?Qy9FejZGWmEzZTFYdmFvRkdXWGplUzBGamh4TlVPc210KzJGR2FUYkY3d3hM?=
 =?utf-8?B?TFFLcnRjYnFMNmlSS2lEanMrUWtYbU9mK0ZvV01vRkplN3QxczAyZXh6dnFZ?=
 =?utf-8?B?ZFh5VUlRL1E2YTFoOEVzWi9XOVlxeEIvVVRWS2xoMW9vaWFtdDNUZWtXNFFZ?=
 =?utf-8?B?dVJwU0FTYWlvOHhRTFU3SkFtNHU3QW9rbmFTeVM2aWtTaVpXQnkyZllwZHg1?=
 =?utf-8?B?OGZmZWNuanlXRmRaQ0Z4RndqVlhCVHhRZXkyTDBBazdyRHMxaURaR1ZsbzZy?=
 =?utf-8?B?TUY1aDViOEdSams5VStWYUdLNFVoVWhoNWV3NGMzYUhwTGJOd2pDNEJMQVJz?=
 =?utf-8?B?M1VwM3hQWHVBdnI2RW5nWVAzNm1VcE02eHl6ZXU3TEx0SzJ2cVpGOFB1emYx?=
 =?utf-8?B?cXpiZUEySkxsSkpJRWZXNExzRTdLc3VDT3paM2p1alJVdG16NkJsbmFZYUpY?=
 =?utf-8?B?NzlER2hxUW1kMithK1hnT1RQQlhlK0YrT2VMekd1MjhpMVlVakRhaWh4R1RL?=
 =?utf-8?B?QWlVUldEUTJWRHM5b1hPWWRnYTZ1SGJ6SFJacXFRU0lkNi9DL2o0QkxwRDE3?=
 =?utf-8?B?bXBCbGFnYkl5UE9ZUTg2Z2wzdXRPOFpxRllISFQ2RWowM0FZNFV2dElTNUcz?=
 =?utf-8?B?clQ0aWlWeUZMbTFhUjc0ZGJmaURSZUN3KzdpL25uVUxlQW8yTVZ3bkVYOE50?=
 =?utf-8?B?N2dtcXh6Wmhnb1NlK2VqS2JXTHd3TXB0VTNIclowSmFKci90T2ZoTFhqSnd2?=
 =?utf-8?B?dWNHU3A2a3pIdTdZRVdmL3Vqd2VjMGRrb2xCTGhCQkE1WVNibTNXOEY0Vk94?=
 =?utf-8?B?ZzN6cWU2ZG1KbEVCRE9tTUh3bzByODVzU0ZLazlSbWJhSmttVG40dm5NWFhp?=
 =?utf-8?B?R2xYNk1HenpheTIyanpuUTFVdUdzMEkxdE5OTUNHNExETjhyQ0pqUWFvWEd5?=
 =?utf-8?B?eExiUWI1dUZGK2NQMjlsYlhqTnpyT083YW43YUNiWFBpbGtuUFgzODBZWStX?=
 =?utf-8?B?Qm5nckxmMDZHN2YzNTdjZjFtTWc4L1FsT3Vmc25HdWIzZnI0TmZBU0RPWVE2?=
 =?utf-8?B?NGlCaHhsdjFBSW1nczVKT0lJcWt5UVlCZEc5V21TNGFMVGZiK0ZjdEhDZG5k?=
 =?utf-8?B?RG5GTEVVRGZFUnFZODVFVjV3NC9sS3RxdkpOUXZRTUVHTjVzaDFoY3QzYUYx?=
 =?utf-8?B?VVR6eHhlT2VBeTJQVW52aEVmWXVmOXBsZDBqM1B4OWUxSk1sS1dnTDNKaVlo?=
 =?utf-8?B?SGRhZm9wcjJpL1BGaUxncnVWQVBic3RSZUs0MDRBenBsUGxDdWJhUnZQUW02?=
 =?utf-8?B?OEhNSW9haTJTSS9xR1pURVhwdkdCQUJFVnczdFFRVGpRSmFxTm84TnVFOWhQ?=
 =?utf-8?B?UFA4R05sQ3hkR1FHNlhtR0sxUG9hUXc5QTBpUjRxb1lmQmkzUWhKZFVRczhJ?=
 =?utf-8?B?b2hJcU03SnduSEw3VGtYR1lHaldJeXBYWkZKbjhqMEJnTTlSVjBOQXg4dG1C?=
 =?utf-8?B?N0lRUzJqc1lhVEF2NGw2OVlqeFFqbzJKdzhTcmJEREFrOFVUK3NaYUFubk00?=
 =?utf-8?B?SDdFcXhCSHJtT3Z5R2FTTXA4VFRXV3M5WVhtZ1lML01oNnFUd2U5UWQ2RDVi?=
 =?utf-8?B?SDMxYTZqbjNId3NuQUZEUjUvdnlPUHlzczRRNFUwSmk3VTB6QzlldWhZVGFV?=
 =?utf-8?B?ZWRrYWtuRnc1Z05GRUF4eDNxUjYyVkl4Rm0zZWZCRGlZSHlncXhxWTU4N0VH?=
 =?utf-8?B?VHZqWDhQQlR1V1hIYTRiaVZYUStUbEtiQWljVDBkam9BMkpMVStxN3Q1Q28w?=
 =?utf-8?B?andjOURMTGFlK0d4cmR0QXRVQlJrNEllY2lCY245bWpVTVc5RlJFZ09qZGR5?=
 =?utf-8?B?Rzg5eU1CWHFYemt1aTJJYWNCMXFObXIzam91eFBoUUZGZHFHV0UyUDhnRXlZ?=
 =?utf-8?B?VjZvbGFVTmQzcUNSeUxIL21EYXJLZ0hwaWdGU3Rmc3IrVU1lS2F6Y25kVjRH?=
 =?utf-8?B?dHNKTlk0Mk5wYnpUci9lTHJJNkNBRENwNVpHNHNDRFoxN3BlY0xUYXY4WWdh?=
 =?utf-8?Q?XvHwUJRwrzbfEpyx1HcZZrYFP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef89d1ad-0e5c-48ae-37e2-08de3df4d591
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:09.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKHKKAoneiLvMJGYOaElKkOXrAfPnsCUmnACAYBCoIwj9HfuPB/BfoTFrdoOlV/xv5RuZJKioqhPBGqfmQQSkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1

