Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043B271475;
	Fri, 26 Sep 2025 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890024; cv=fail; b=aeE1VqXHqB8nHwsaT/bnMyP3zadfyxuHuUjpGq4JqnwFFSmIpAJV4/T/uW47dF0Jm4E+UUBrRv9aEmBMywj2QZ5dB3z9TfNY5KKI06adkfwrfZ3FlpuvaO/YXIS9wt4B8L7i23ppbhXLeF1+RIbOpplxdbyFCWSbu2oGz+F5P80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890024; c=relaxed/simple;
	bh=hCaq7XkIv5DWOEjYWBRXQ0HOL7Zrek5TPOvsD4qDNBI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jgwlWWKvxHgSwxcA/wYAoydhtfEt1nf/WMM0miY8NvIfUBg+i8PQmfDxf67gwja1/fxke4JqrBHqs/OypFK/iWGGIMf/MHrVMwKeZKGlbvxnKxS8wx7M6jjy6o3g5bElhtzOl7D0hUcrnxiHOeIEgdnlMbsK1mhz0LsZz1CRYCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gahl2KmY; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gahl2KmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX0KGkWWFdS4RmkW4Sgj9dDzCgkPXD50A9sg895c0F0S476RBk5vH+ZLRjkp6yXAHSSyybZI5dWycT8Y6RfJ+ZtRtFs9eUQaNrpfU+NeXVBYZCJtmEGXWarq7IkbZhCC8Zfls7VCO5/f/TO2DaScwtDxc8SVwPiYT2H3k6zS0brHAnHMvza8F1B7DlPKyvXail+gbF/qmlz9lt58trpcVdZtSqoMs2oBOijHE445SVEaoYmtTnqNwRq6dDCCINWp5zRMLHYYSmtmSivyw9ik3ODuLCfo2hN0z6fyx5gKchNRsKQ6T8A+x3V9fISQGwAKkLzOM1hNqrS7PDzfOpUnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2SbXyOivKdMrftq2+jH5oAg3dLd4Psbhq4kxHhl+bE=;
 b=ZBG2tqpP4Q2jB+XAn+bVmoh8Z3xGo/O2+vd570plE93vC3PwYCLKjQ9Y91fgW6N9+y55dlLBIYvFWTxkK8TNyeXsWDj4aA7Pzni4i654SRmmEdkG3cauqFM5Iv9qnA4RGUJig0M0ctkIffB9VtOU8soqF2FsYziYVrPIjmPdUhYEB+6DeLGNme6SsBR18241bN124BLaOSqqJriz6HjPoBFb6JMk7voqqS8eR7IUGk0k+EIWGD04Hv+aeQepQLiPPWOW88r8Z2M+PLUhSCsIuKafm7ycRsYKSCXaQMLM6FGNjsUJIDiclbx6MuzU4VXosZoKeRIfB08J0tkk3z6yBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2SbXyOivKdMrftq2+jH5oAg3dLd4Psbhq4kxHhl+bE=;
 b=Gahl2KmYtUzlwR4oZtfSPY59pvFOFjhxf8SmUqGaaRwWSvhsEitCx7+Kpciyab7xFeoF8M80/HzELcCyLsh1YQXfPexexnUEUEOmzeuExbGGsEsHEnz482q8YlElX5MKsXQacBcqKAlUzlmpM9V4SZZzhDe6fgycZiN8yP+O+Z8xGkAhLCJZk7i0Tv2L1HnbSt46i3vltCKIelzUgBAoV3E2+FjQyecnA/ggFZZibng5sYsuGyAPVdY+sdv+pbgXFq25O1RlqNgFoThlECV6ULmimHeCN6JeZ7tqh3z4vtOF7lBVQYFOiFHbUZZD6f81XQsV44YI3zP1tXB3PA0SbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7403.eurprd04.prod.outlook.com (2603:10a6:102:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 12:33:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:33:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Date: Fri, 26 Sep 2025 20:33:14 +0800
Message-Id: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuI1mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMz3czciviigqL85PgyY91EU4PEpNQUYyMLi0QloJaCotS0zAqwcdG
 xtbUA/glKv14AAAA=
X-Change-ID: 20250926-imx_rproc_v3-a50abed3288a
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=2129;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=hCaq7XkIv5DWOEjYWBRXQ0HOL7Zrek5TPOvsD4qDNBI=;
 b=BaxVvNmiSHbsFyEKTqa42+6MGmuqnNoUErDyNg80zDW6O6yEkjCPQl93V1q8b9iFvLGY4Mbu3
 PFQS0ShYMI0Ba2ruw6zWIJXK4bg6sqxQpXdtim1yKOxm6/TdbKQFZc4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa172ad-faa2-4d5a-734c-08ddfcf8eadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2hSQnM0Wjh5b3Uvc0h2MWhXZFBqUHBwWXd5VkZMR2pWYitEWHhwNXU5U2p2?=
 =?utf-8?B?TWwrVDVnWEx3ZGNDbEg0c2VqUng0OWY3V0lmRCtkVnMwZlZYTWxTTEVrVmtm?=
 =?utf-8?B?UDRxVjVjeElDYjU4N3lOd2VBcFBVaURrRWYvZUYwQlRiVDJBdmYxdmYxMkJx?=
 =?utf-8?B?bzI4N3J2T20xWjBLVjFSajdpM2JKaGs0R2RpM0MzbHEyckNQV2xlUEdJeXQ4?=
 =?utf-8?B?b0N1bGNzbTNJbWx1MkJ6bzVKZ2FIaURjK3pKejZ2REVncWhPWEtFYng5ZDF3?=
 =?utf-8?B?MWp5T2pJK01QQlFzWVBrYlN4MVBlZWc2aUtpRjE4Q0xjWlNpWllWaW44WFNC?=
 =?utf-8?B?MWpIcmV3V2ZzNEEvWlR4M09mQUg5UnIxM0s5NExuc1p3a29MQWkrZW5ZU3M1?=
 =?utf-8?B?cVM2dlo3d2pBcUJrV0tmOXB5dEhtbjFMbUZyZGdqelFDY3RmZXFUK3MwaDky?=
 =?utf-8?B?OHZqUy9uUFZYV0x5eUxRN3dkQ0VZS0w4cm1tQmt3M2V1RE53OCtHa0tObFV0?=
 =?utf-8?B?QWwvTDIrS1o0Mm9yTHV5WkJWRXpLcktLakZJSzlQUEUwejlBWjhRVEF2UmJw?=
 =?utf-8?B?TlFqTWI0NmNZWGwrd3BTU1p4MFIxd0lSZTQzMkhJSWMyZFYzU0p4UzJib2Za?=
 =?utf-8?B?N0dXMnhPSHR1NzNTT1hYaEk3eXpEam5PM2t0Qm05ODQxT1ZGT0xzR1U5aEta?=
 =?utf-8?B?ZlBXOFBEK2xxWU1ob2xIbm9UcFJ4WVA4U3VaRzZTYXdvMjI4MmM4alpTd24w?=
 =?utf-8?B?YTBQUjByam1kT1pXM0JjRHVsVFJHeThGYUt2UXlXcUxEbENsK1Z1RHp3TmMw?=
 =?utf-8?B?aGtOY0VKcmZCTWc5ZXpDNTIvMHFacHRsckRwYlFpSVFlK3Y4Y3dwSGVuQjBh?=
 =?utf-8?B?RTZCS1RPVmxwV1h1aXFWdUNUM1FZVG8xRDBaKzhhR1RZNUNMRGRUcE1BdDlT?=
 =?utf-8?B?MG1IUlJZcVk3WGpvT3phNm5UaWJDdFJkL2JSaDMrR0dkc2E2SWFucWF2eS80?=
 =?utf-8?B?WnVJdkRDdm11V3l3a1RmTHRTUVMwenlKSEIwdVJYUHpjRHdJdTJFVGJYckdk?=
 =?utf-8?B?MkxIVVlvYmJFZzVtOUJ4d1pabWNncEdsYVJwYSsvQW1DVS9ndE11MXdlYVZN?=
 =?utf-8?B?R01TdHBOYUZMVjNWNFBxa3c2cXNWenQ5a2YrUGRsQ3hqcDRkajdxSTd5b3Zo?=
 =?utf-8?B?R0VuTkVUek5YaDhFTHhDV2s4UGhMdVVxcVNtdjhqREk0SUdmdWtSMlpXK1I3?=
 =?utf-8?B?UTdWMXkyQXRXQ3RjdDNUcE1vNmFLUzJ5NHFuZUI3VFBCRWc0WDZ2UXBJR1dE?=
 =?utf-8?B?VEJ2NUovNFZIaXVLNE95OEVmTUEwRlNMclRtZVVWckJqOW83UXVmVE5rT3Mz?=
 =?utf-8?B?MUhYUHl2U29BUDUzOE92MFF4Ymk3Z0FjaVMxTHpmRi9qMVRmS1lpRkxuNGRj?=
 =?utf-8?B?NzAzTDNnMmNuekw5aWoxdU4ybVQxUVE0VnpmR0ppRm9pS3I1dnZnSzY2bk5G?=
 =?utf-8?B?amZFLzduQ1MvQ1U4UFRBcmNuTDVEK0RYY0NreCtIMkw2TThHcHFob1ZKYW5l?=
 =?utf-8?B?QzBieGxWY3d1Y0g3WUhocDl3YnBFVkZNU1dBK0IwOVp1TktEU2FaQjFxZEhR?=
 =?utf-8?B?RmNIUytrdVRPUFFJcERWMGRzRGo5VlF1VVZTdTdHbWdjRHFBMnQ2Q3h5UE1y?=
 =?utf-8?B?aFpOQlRXWXhCZnNZWmtxSGF4dXRrMEJIbU1oMWIrQXN2R09yMTdjNk5NdUIv?=
 =?utf-8?B?ZklhaXVRYVFjN05iUnNVVW1oZEEvNEoxdVMyZW9tdnV5U0RzTXlZQ0loT2V1?=
 =?utf-8?B?dDQ3OTJyOXBVYmVDSkVnY2E4ZUZ6WWxOZmdldG5uNlNOUEFUV1VqSlFHV0lp?=
 =?utf-8?B?ZjNQbmxtRUQrVUhETTRkN1RZK2FxMTJKTHdHUjAxM0xhblp5U1MxUjdNVHVk?=
 =?utf-8?B?VVJ1K2VHMkhqbWd1bE5LcDlOLzl0b1pmbHRjODVqWWZGWHhTVEtEV2VRT0cv?=
 =?utf-8?B?WlJBTk5hNEJ3QndRR0p6VUMrRi9EOHF5YzdSVGsvOHIrcEVUTW5FQzM0dm9s?=
 =?utf-8?B?V1J2aXdrME9KbU9vQ3FWTEQzZWtDVGZwd2dGQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFV4UTNWVjJlS1RWT0Fpd1J2KzRqWFI5cUxIUnlxaGV3QmJiby82ekEzYXJq?=
 =?utf-8?B?WkpLT2FQWTRobnJCQVlaYWhYTGRqcmhIRCswc005eXR6SHdocFBVSGNpSnp2?=
 =?utf-8?B?SzgzbzlhL0ZGMUJQTzNZcmhKbUxmUzM5TDVIQ1NhSzl6VGtKa00wcXZOTWpE?=
 =?utf-8?B?OWpZZWNrdjVWMXluWEFFVlNXY0JyZVV1dTdUQks5SUFIMTRUZS82UFJJUE1Y?=
 =?utf-8?B?d0FZUE5KdEU3c3JYOG91RnVZY1dsUGVKUktlWG5wdVh6ZU5zaFhEUFdBSEI4?=
 =?utf-8?B?czRYVWN1RjZGeVoxLzVyeHZSb1ZacXp4M3pkVTNIZkxCejdaRUJwdTlVNkRS?=
 =?utf-8?B?OGM5UC96RVAvQlExbU1TcnB4VG5GQm5vdWU5NFZCT2RvZEpFY1RRTVVxWlZR?=
 =?utf-8?B?M1hyWXRiTkxQQWt0S0RKOTVZTzcwOFcvcW9BQ08zWFA0TVUrMFpVNWd0MFc2?=
 =?utf-8?B?Q042NHVXU3BwbDBONjVxakVDWnY2aGo4U3pxZHVXZFIxWlFRRVpucHJuRzEv?=
 =?utf-8?B?QzdRYmhzdlg3UDNnZmcwZCt5ZlhQTzJkMkRXeWRrSWZBUk5BR0tMTWZyaWcy?=
 =?utf-8?B?UkV6Lzd2Y2hUS0lvQVBkMXFBMjVrU01BUENQOWpKL3V5amdYbG5EVTVJUTJh?=
 =?utf-8?B?WnBnbEJ5UE1wem9TWTF4WlZCQ0NkODFHNkt5SmJyZzdrUXBvUURQenlmWVNF?=
 =?utf-8?B?TnFpcjF5MFR4dC90UEd4RHpXQXhRc2c3aE9YUWtNekpDTmkzcmxFSldBZHR0?=
 =?utf-8?B?a0JNOWtBeWFzVUNZMk9NZXdQUlZIOURQOTMzYUkzMlRnblV4c0I4a2dSeXlY?=
 =?utf-8?B?YURPemY5cC9zVzlKd3hYSXlSamJKWXFRT3NzVkRhdkNOMEZXb1pOWkkwWFVM?=
 =?utf-8?B?UWkzTE5zZUNFTmRVOExndFlJQUtqeDZlVWx3Rjl5YnBzY2VqTVlVN2J6SEln?=
 =?utf-8?B?QlE3VGVKcjBUYkQvZ2tBZGtCY3dCUFJBR2lQd3FTTTRNeXJRODdnQ1Y2cFpO?=
 =?utf-8?B?a045YXAvYU9ldGp1ZUJJamE3cUFVbld2VG1WREY4NTZsVU9waDR0T1hmRWVH?=
 =?utf-8?B?aE1sM3lPTGlHMFVjNGtHUHB4Nk5xeDNpcndiTUVUaTVRZ0t3SFhBSXlKNXI2?=
 =?utf-8?B?Ylo5Z3VSVzNmR1I3YndJMFBvOXlvSmVaalhiaXhMalFqUDNIbjlMUzJxZzdW?=
 =?utf-8?B?ZGd5NWF5SVZuaEVIbWRxS0dNT1diY3E1UWhibUg5SzNab3hPRzA5NzBiNGlK?=
 =?utf-8?B?bHE0WjRFdGxRVVFtRHZBMkIwUWNYa00vMnpDdjZnRzhuK2NIR2pLc0pZTWo1?=
 =?utf-8?B?Z3VaanJhQk8wQTk5ZzY4ZGlDRjdvdlpGVG13VGQ0b2lMMzZqWHZrN2NDWndt?=
 =?utf-8?B?V1h1eGRPZnp2bEoxZGp3NGl1MmI3K3ZxSEo3bkd0TERUTWpFVjFXR1hub3kv?=
 =?utf-8?B?UzdIb0JxZkdwL3l2YmRmZWx4VGJDMHpSeHdEalRENEFJSlBETTRvNCt0Z040?=
 =?utf-8?B?TktjWWwwZEM2STJPbjZHRjk1RWM1a0pxUHhTZytiNExkKzFnM3BVNFVVYUM4?=
 =?utf-8?B?REdRbnk4S0V1b2NWZEU2MUEzU2NwZ3l6aGtKWjUwU0lhWm9NakIwdHlUNHZX?=
 =?utf-8?B?L3grNVcrZXA5K1FOaGFIbHhjNzRKSGpJT21xYWJFbnVobHlsTUNuVUltRkF6?=
 =?utf-8?B?Q3d0WjJzdXhTdk5Ib2VCQVgyZ1RtRVBZSWRRS1RVNjVOYzJaYytGZUNxV0Fr?=
 =?utf-8?B?VkZwTDVXODlSZHR0S2pBdDM5aUszbVFkeGtGU2xnZDZlRkRKRE9kb0hJd3Bz?=
 =?utf-8?B?TzZJcWh1R0l2SnpyMEE0MHlpUjRDMkltaFVvanJGb3haRFpOcldXWXQyWTdx?=
 =?utf-8?B?Rm1VS2NudGNvK3MyYXRRdzQ4dWhUbGR6dm80ajdHNGloTXpFdDd2V1oyUHZl?=
 =?utf-8?B?dzZieVJsbEJ1TUJQYWtoaFZndndvRFNlK1RUVzJFUThrcUMrcmVZenRoMDUw?=
 =?utf-8?B?VGdGcUFOaUR4UHVPRWtuZ3U0N2NFQkxqa1BtMjdTUVpxMU9vcUtHWENJM2NE?=
 =?utf-8?B?SHZKaVI5UmJpZjFPYzk1SzZsRFNvWTE0SENIaDBFNWhObmVIc2kwQWtVUTBi?=
 =?utf-8?Q?Wl8rsuZkU7xfidS3k4KDk9LQu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa172ad-faa2-4d5a-734c-08ddfcf8eadc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:33:38.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+r23CbFGFBd91yukKDulaquM0caACvNMfxUOmCxc7frfRbJcpmy/qQI2T2UxDtI528jTZuys1x0bzQx2GfXaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7403

Tested on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

Retested all the patches for V3 on above platforms. And pass build
with patch incremental applied with ARM64 defconfig. pass build for
imx_v6_v7_defconfig with all patches applied.

This is the 2nd series to cleanup the driver.

Patch 1:
Fix the runtime usage. This is not critical bug fix, so it could be
defered to 6.18.

Patch 2-6:
Use devres managed API to cleanup the error handling path and remove path.

Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
Thanks to Daniel and Frank for the internal reviewing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Follow Ulf's suggestion to address the runtime PM in patch 1, and add
  Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
- With the changes in patch 1, the remove() is kept, then there are very
  minor conflicts when picking remaining patches in V2, so I still keep
  R-b tag from Frank and Daniel for patch 2-6.
- Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com

Changes in v2:
- Address a build warning in patch 4/6
- Add R-b from Frank and Daniel
- Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com

---
Peng Fan (6):
      remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
      remoteproc: imx_rproc: Use devm_rproc_add() helper

 drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 53 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250926-imx_rproc_v3-a50abed3288a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

