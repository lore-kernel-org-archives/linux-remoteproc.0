Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1C936197F;
	Thu, 17 Sep 2026 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669208; cv=fail; b=ahyhodZulIzzdHnxfYuowSQI8a3/57oTyA/Oxr9Bja60ylfck23WOcd/JOF9b8bh6/TNBQmwsGkUx5fhmMprTq6n1t1P03EOta5fWddyzR9KGW5aLWIGG3+uXqoKzv0YybCdbF74cpbTgSBT8p61o4Qd+qfj+dCPwMaXJhGWUmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669208; c=relaxed/simple;
	bh=eGwB6yhkV2itxcytQYTvo8USOfeJkqgm0fj2b3DpFY4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=XhF0WQpplqECDkYiMb3h5gQe2ZPlrMc8ELJvOAyRPoQPEreUkLBdNEgK4G6XGvJ3C8cA7ZAyVSenFKdFVEK8Kd3j/oBI+Q62nbEQ9E6HofXARZZUWlGxvYHkCHkAorx2ua3Sk3O2tefWUz87z4CFii+EI60w/CcN/2Hz9GDtI5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UPvEisFY; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UPvEisFY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh269ambUpq7nchGYzmeNI93mPpwMrEq9mCF6IElFm6ZPcltzhdGn78/JemoETpTa5ECNWYJEvAFcplPk4/Ar5GG+3OS4Lb4DXL8VxW7Y33Xy2G8DbVWttv4In6+CHfF25DCghxocYJC5afQAjqGUE59iRoL7Y0wQVtbjIeqbNzZQHK2vhuosXJN1biGOmHzIziWEStpBU61cIh8BjpP2MDQvviOm21MfkG+e3L/dbwGGxgyoYd6SmIra3T4cM+lRXlXyENZYplKDltbH/cS1CD4INbCC6pxmysVFvy2mtWOqTD0gttAWsws0Kd7Q6KfpnErewnrlhOPguoiw+aJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNoeY8oNsTA860/+2Vf3bSCoN3ONfscoovPxVQLYDjM=;
 b=l4O8OaIcdLed7IsCuXJS2i7K7cIf3hxKJ4CKJt8fvJO6cQ+lezu/yd+jku/14Slp47gdpUhEEvK0SqKMQGODhguQMdKUdkpd58ugc+UPkwsOFTKQe+MOUljwLqKIhg3YjJFUR/5jdzec/WchwffXGGY9xck8CDOCBU25Y1LZ1OW4IVZXAX34/SG5OlcP4lNH24ZsOY11O0x6Q8g6rh62Xt1iZqK8XroxVc4Prhfd787VfwgolZ1YGrHcY9KAu0niE9Cgw09JDu+j6nmshaJ9jLYilmaydw7o++J31iWAc9kSyP7JdpsJ2NiiaKdiCxUJy4PsNg6sNv65tC3hQ+tqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNoeY8oNsTA860/+2Vf3bSCoN3ONfscoovPxVQLYDjM=;
 b=UPvEisFY5VsvWslQvPsNQ81fbO12p235usW5wb7ioiBbjlYIYyGn/HdVR2TnG5zr9tiqo9xvaV8mRDM3K5morwBNkj3FZtEfSKRJKwna/H8u+o6xO9PrP+4ezf+/JxBgGZpIgyjhxaf6NL2Be36U16KTY934EFgObc1cp3mEAN8Eqa5TQ8lA0mwkoRVM3NyhzTk4SYoiGoN1UvaUtrdx8+0QzbAIt0ic9KiepUX7ohpwJVgK54ZtOJsurad2JEePjOlxoGW7ztSgJ2viHxjJYph9tUmrpKheVx2JmeZdhlxFyAwi+MfIj0fUlkIM0Rh4jBotEO8is9NxDGPMp8Nf8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:20:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:20:01 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v4 0/4] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Date: Thu, 17 Sep 2026 14:19:41 -0400
Message-Id: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4vrGoC/yXMUQqDMBCE4avIPrsQQ221V5E+RB3tCollY4si3
 r2xffxg5t8pQgWR7tlOio9EmUPCJc+oe7owgqVPJmvs1dRFyR5+1o0VY1pycB481KUBnG1vVU/
 p+FIMsv6izePv+G4ndMtZouP4AsoZxVN2AAAA
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789669196; l=2040;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eGwB6yhkV2itxcytQYTvo8USOfeJkqgm0fj2b3DpFY4=;
 b=ysvoiuqcRYJochO2+OrsQqj50moM6IdOUIs5mzRyx953AD9BUS89yZajyBxiBzih+JSylw3/J
 XTeNIg1nik+BTX3r8aCu8GzHt278ZODoDjN7B1igHuz4tRTLWBn0lGO
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CYZPR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:930:8a::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: 267e04ab-a032-42b1-964c-08df14e849e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|18002099003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	x81RRIVxsr6+5qtHVuL4jXIQwpBINYyCpyd0ykjbkW/zG1qrbqP4oKUZGpTC1zLuFcE08W3CxDcP8eNIx1mNQy8YYWWB8DdPnH5f7Ajt+3yb0wlYTmEx/b/iM22PizGBpcnYb87UFIy8WyTM/yMCX4EnRPl5TspNdxeWWX1ABP0ltlbMIFNh2iJSDO6AxHspGxb1nmobFsUbxJzcKPdyfiQtbG2WWnGQk7wWoE1kG3bonwQ6QvKsd8YxUx8/qL62EIv3nrzkwLVQXFw8b5TDJAj6FwDQZX86kCIVMLqb+1Ty/+U54snKjEiSSPi4wP15BiRu5AUDq8ZE1mHjWm/hdh30pmTTdY/06FXnsQ0FKFxzwFFojDIsDH89DDeY4sxOj/NuUmjPrX19drICFEbCFuPdWG0iqPmXAWHr4BjBlrkdIZ6AI7yLRLkWBOqTIqUdncIUvXwWto9xaI8WHhmh66X9h/WpSWQ6nooSwyNBxe/u+XGVYizXw581tr7MadFAUQEImi0/SILTIwg9wmmkjmiUaLClZwAkQbx/QJrpEIeLZ58aox6p/59Y/Uffq/vyXvs/bG6F0EVEvJvidyScepihVyGC+tO372qsISIYy65kM72HfZ8zTNPILKp/i7e3rn/MlV2jjXnFhUhGGaI5rh3uQ1Nky0DZ6luENCG0Fss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STgzZGZ6RVdJK3ZockQ5OGhwTnJjR0xOOGVwb2ZCaGlOS1cwVVVtT1BQVWZM?=
 =?utf-8?B?QzdBZjJNU1M5YXNSVmZNTi9NaVgrS0tuanJycFNjREZKVVRlUXJJRllvTFBq?=
 =?utf-8?B?Rk5COHpJOW1LTWF2UUxWR0pNWEhrZHBRZTFmcTJvSFB5eWQ2WUh2Z2svNlpw?=
 =?utf-8?B?OU1OVjRvTmxhMHFOYnNnRUpGVUZxVHRHcEZITDJZRGJRNXFiaTljYkxlbUxE?=
 =?utf-8?B?UjAyRDkwbWluSklCbmFFd0I3SUxPak1jdTlPUW1KQktDaG8yejFuTTMxQ0JL?=
 =?utf-8?B?YVhKY1pOamV4VzlWSW44UkFIV0dWaDlPU0Y3UjBaK0VXTHdRdmlPSXphY1Zz?=
 =?utf-8?B?eWtieVE5TlZ0Qng4cGVleE9KUHdxRkMxd2tYRmwwZkJpdzBmZFBxK1FYWkVk?=
 =?utf-8?B?L1BrQmw4eFdhK2psdjdNS1V1dDlWMU9JTTk5ekJPN3h5L3Y0RkJOOGFjNHls?=
 =?utf-8?B?cXRyS1hOZnB5UEtRY1VFTzBkRWQ5NHpDdXNIWHpHZUhMQ202eXBVaEMrYmZD?=
 =?utf-8?B?S2ZyQlhkalViVHFSM3h4aGdwbktuNDBTQ1Y3MWQ1S01NeFlweCtXQXRwOURK?=
 =?utf-8?B?MjZjR0VaM0p4S2YxQm9Ma0JqKzBBZ21KT1JsMVZrZU01cWVXN2paZ2dCdHc1?=
 =?utf-8?B?c09RSlBJbGdhY2RJSEs4SU5IQThuUHZTUDBZaWgyMUcwb0YyZjUvcXRaS3Mv?=
 =?utf-8?B?UGJOMlNncjIzM2VqUWJQVFpnaEY3SnNyNnFhQ0w3TXExL3FkVVNFZER4eVpm?=
 =?utf-8?B?SG1ZTUJQTmxuMWs4VllNOVNMUmZLemY5QlhobitvWFVFODdBYm40WWNRcU9I?=
 =?utf-8?B?eXBsTzFUSHdESEg2M0Q5a1hnb0pla2drVExDQUYyRjZkUlNyYUNoQnlPRmpM?=
 =?utf-8?B?V1JyVGl0dVh4TlVxWktmbWlHTnUwdlpjWUNvT05Wb2xHQzJsLytYTW1zQXR1?=
 =?utf-8?B?Q2RwaTJCWERYTDlRWHc1UmViVFRhdUwyVFJya2tRUlNZWEV4cURxSFpkV1dM?=
 =?utf-8?B?S3VGSFBJUGdxbjJzNkRaOUJhbnpJMWdOUCt1OW94RmFQZkZiZE5rZDA2R0p5?=
 =?utf-8?B?MW9nWndnUGRQellIL3ZMUTBpKzJKNGgwVk5KYjBCTFMweUFEMmtFWS9jK05F?=
 =?utf-8?B?amxZVDNtQTVhZkM0a0M5R0xFVGdPbExxbkxCT0pEQzMzVVdsbEtRMC8xZUJo?=
 =?utf-8?B?bkJQcXFSaFFDQ2hQRGxadWU2QklZeXFNTEVFUXM1VHhSNVFnSDB3UDJncUdU?=
 =?utf-8?B?WVlXblZ1ejBxRGQ5K3BZTE5hMEVOWUR0R2QxNng4amlzSUZFYnRvQW1WWDBq?=
 =?utf-8?B?ZldqVEFURmNmcU5NU2JZNHN5MUVQTi9JOVZJbWxSYnYwamV0cFdNNzZBZ1lS?=
 =?utf-8?B?K3VoanlpT3k0djZnT29xQjBhYnNyZnMycmp3MHBVeXlvaXVNSEIyL3l6NExB?=
 =?utf-8?B?K00rUTBCS3FWL1BjbWU1TkgweUR2MDB1T2hIOHNFK3U0dnpVZ1NxTmhmQnR0?=
 =?utf-8?B?OEdPSmZEaVV1citDVzlDV1U0eXlSd0ZuMXpJc0kwd2JxZ2FkNk44N2pzcWdM?=
 =?utf-8?B?dWMvL3JlY0krUG1PMzRoL2QwYVU0cm9GdXZ2K0xObWtwS3pMQ2dFb1RERE9W?=
 =?utf-8?B?UmNWMHQ1Tk1QMWlrM1l0cVB1UEQ2MkkyQzJWWmc3TVA1SDNvdHZSZWZoOXNO?=
 =?utf-8?B?dlpSU3dnZmcrQUN5M0VUMjVpdHAzYXJpOWxKbytxdmlLbkE2TXQ4ZnZnekdk?=
 =?utf-8?B?TFVJc2FzbDhhc1lRa1puMjJ6djdDVjNMSWN3Tzhscm9zc3ArckRrcVpReFBD?=
 =?utf-8?B?T09FbC9lU0ZDd21qa1ExYXd4a3BZa3RHY1AycEpOTkVNNEZlSUI2bW0rakQ4?=
 =?utf-8?B?UERZTGxsUFNUZnhIVnJyQjhnY0R3UnVqbExsaXhKa1crVHU2ZzJ0cmM4ekk3?=
 =?utf-8?B?dEFCaUpHcFRoQUh4SHpMTWNUeVhrd3NLRHREUmxNY0k5Tm11ZTdQM3hCUnd6?=
 =?utf-8?B?dGRXazZaeFEyQ09vOHRwc3RVN0U1a0JOVnphRFhzMkYvYnQzNDhkNHdxRUFB?=
 =?utf-8?B?SWtsbkRMWnVOZWVkTXRQYVVjcElIaWorRjBUUFNjY1FIbkNYR20zT25nNms0?=
 =?utf-8?B?UFdiTE50Skt2MjYrVzRERURLQy9LVjk5YjdRaEFZUmNqTTlQVlpURGdzd0Jh?=
 =?utf-8?B?Uzdwb3RSK0t6c2dWc2FmNFZ6WTJqN3R2Q1BWajFlM0V5ZUhxN1RUSXRqODFp?=
 =?utf-8?B?bkQzQ1VuWFJWQ0JicFBiRy8wWXFsV3UzWWN5UTQ3ZEZ5YXNVb1RpazU1aGdh?=
 =?utf-8?B?SStvUnBONE9JNlZHUWJJYmdyYXM3ZDVEYnJRUU5aeTdWMDBvZFFmQzRoVDBV?=
 =?utf-8?Q?I76RMZ+q4hfO4KSMyvE9XSGMtrBYxWVfhRvwr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e04ab-a032-42b1-964c-08df14e849e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:20:01.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ229kowQK0hnYQu+VAXFlj7Ol6i3oufD3YvgnXoQoEfaeV2dF+SrKc4erA8Ds3GhVzpA3FsuOauQ6qmAzIYHBghIBiL5/VMAqM4YBnykKsBCRzCL4XXIFm0qcAzzp1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Laurentiu Mihalcea (4):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
      arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
      arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 21 -------
 drivers/remoteproc/imx_rproc.c                     | 13 ++++-
 drivers/remoteproc/imx_rproc.h                     | 21 +++++++
 6 files changed, 113 insertions(+), 23 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

