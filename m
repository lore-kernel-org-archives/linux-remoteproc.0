Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCF30E82D;
	Fri,  7 Nov 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762523366; cv=fail; b=ax93oahYSV/aLoI1XPKvx34PVlv+IdoUK7TP512Qoox7Cckj6LHY4iLWTUQ8oQbq92P5bgAWBnVoM3+qlUllSl+3sm1dJLOQ+XYF3nbfJ4a/27dMmSk0C1ItNqbD/mFOPu8417cltxzZoEOaT0gKqhcj4V3zcROBVUs9QOqzZvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762523366; c=relaxed/simple;
	bh=ztGz+c8b6HiFHYvaxyk9qfCca6SqD6M9QF0BE8lDY0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DzzafVKsIGG7MLQDhVUjqd1LfppHlsZhBgWOtZGcaIHf+KGgnAOitDBnGHktaRXPKda9P9qoWRO/q7Do9a4UCt5IIVH85tTAk/yk3yXWeygZa3mKHgLCm/nXFpXiD2/4/7MAljyESvQioghugD0LisOk9cQIM73BUCErCQF4Rec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ksbk2fHn; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ksbk2fHn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agxKUwNUmpy0e82iyEknNIirOe5ra9Dh6yFphdmK44CxChfzlZ9pWYwlYlgULi9jHtQt96uJMScBnNckMAXkSFzI6iJjLfotXcH0W+J6wZoA63Rx1CbPL8almmeXgfdBiivd/wmh6t4wT/5Nh39U8gjF2xTmmbdziBF6VJiq0a+KYtyrcWMwKNH5MFGyNGFlz0huKCiD0kD6gin/e4HFghIzZYFjqGT2reotxPCzCHaILfNqbL4Os3KbYLLOdbIOun5rF9a9hVRSvqNrt3+InMp/9o3eqcql9eBuhAVbn01ldbAcQzkEu2VSlb1/KRfvMyWP80M5RAijWgCiTHIbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BdVlvxhGlVnRXtQcVzaOSTinLPPLBtr52U6+tCOpSw=;
 b=NhcH0YdOxT8wTIpWdtbsjgmtEVY9I1yx4sbi/8W4eg3ltPQyjVR3a3DSfWXz6AnxwPTiDnQvFOlJgKjLdT/rtSsBWASZlnsxAeQi2fJiFHyO1yKwEAI7M9UirnFu0XiPnKWHfAFZroDDDNbzFRjdqpztsLev9ciLzjJhtHG3uqjNwI7ArAGEfmO5Sw25RV8ceM5gNfPcVaa0fMvc+fIMaC9c6jqF347gKj/QL93RAr8vK4e7kTl6SEE0J+JxPWWidrvmZwum+hfMdFWxzisCjnNqisZO3FhRu8vNdcoaENUYWtdoEucPzMWREdpn9cCcG7hwQBbuPy50aLtXFxLrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BdVlvxhGlVnRXtQcVzaOSTinLPPLBtr52U6+tCOpSw=;
 b=ksbk2fHnsPTHP8rhPO0LQia0ryzkTQSVpW3LEyxlyHCDWwrfoCnyI62WSR83l6hlW3amhlARZEq1qdKDmqrGvgo+hxheySSXBZ+6pyKghjlDfYkJm40PeceYUbOf/+E+N17F/SUOZKXsu0HZZuKb4bXhg6ucz04yFYxZt8As2zzcDpN4cem5eSq549P9ndIJtVufawdaNin8VPmEVghIv98vxM/5baUuSEMfpJus3mm7L4Ogw94mKh/050Wpidcsq/VC93X3z4YYMT61wHBHseGGVHmesZqn4OAoyVFzece/m3oXj2bZ9ysAiucAkmv2TROfToejaq8XSwS9OvYpxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:49:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 13:49:19 +0000
Date: Fri, 7 Nov 2025 21:49:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aQ35BvxIwMetA5fm@shlinux89>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
 <CAEnQRZC8PTbzNM056WUSR-kYqdf4Sgkr88z3S87ZFk+rc=q3=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEnQRZC8PTbzNM056WUSR-kYqdf4Sgkr88z3S87ZFk+rc=q3=Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b28fea7-89a8-404d-ae50-08de1e0472e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nbdvnwNSakdQqTqrIkB4J9jbKnQ1ten0+eqgGKhYlPofDiPTIP3hzEafOrII?=
 =?us-ascii?Q?UKJNTea5MU5n1lyYHu5SfCKYEedXq5ixm5PUiIlbtbFyL55LyVNQ8oVUiqmE?=
 =?us-ascii?Q?BliaDKtN4JFLQANBzVjOFY6qR4tjRkmJ18RCltIfgwSBMjAwcmcyffhCxlLW?=
 =?us-ascii?Q?v/KdJMIVfMOzK7EG6qjKRm02jatIJItdT3/HlUHhHQLKZdyZv47JsJjKRumg?=
 =?us-ascii?Q?XXFFDCjmP1urFlhT6lrRNUzef7Yvk5h5sq+k0Ud92FOYE/GmCBewGt+8Z1Q/?=
 =?us-ascii?Q?IL3wWQMy5mzP7UY4RlCbH5pmv9eezJ8BekBbVnzE6QA1lF7DSVoyuohKxjsU?=
 =?us-ascii?Q?Xd9G3Gux847bRruHaNL8b9SqJfB6naXhksMz07Sy/o3RvIypGB5LD4oOB1Q5?=
 =?us-ascii?Q?MGEpzKkxc5ccHZv3oUODciqCZFdSD2r0kmLp96Nox/ipTA/V//3qVZg8qU4N?=
 =?us-ascii?Q?B7OBw46Q+MI0u3+Ip2Z8gx6v4feGD6PwY++tGe5Hcjl+CtlcThGitmcnGWFJ?=
 =?us-ascii?Q?crInz66o+CKlpAGBhW1i61spucGuu+BsNEA5xfTFbJY7rN7p5yVdyllYyH8D?=
 =?us-ascii?Q?6CFXVcSZsBCEyn6YOxrm7Dg6q3MNDcjsVwe8T1y4NnJwZe9we2OeOxALBbCx?=
 =?us-ascii?Q?umb2eY2/Z168/NTxD22JHbSxtZsXgUpX9RbWkvN+kTMkkJWN46lzojVS4n5U?=
 =?us-ascii?Q?DlgshIRQRCfMtnRK76FNs8nXuMc1Ek8QeSxItDCKun1RZu87iqKyiX1NxDf5?=
 =?us-ascii?Q?YLpyuVKci1PLU0I4c0mWeMwgCySfQGUqo+hhOyK9oFn2nhMVCLhAOgk19txQ?=
 =?us-ascii?Q?nE4exGKKNOFdk7eEEZ3gPaglE59TseMpRRea/VUnY4dWJAyiaAGB88kJ02Fn?=
 =?us-ascii?Q?I5nSfBjfV+TeDgRUcf1QgYSgaojIUcaAJ0HDx8DB4ZVp0h2cX9tkVrVBthdP?=
 =?us-ascii?Q?DH24dIoE6mL/UW9zdRRUhG0aHw+nCy1GDDxFeT01WU3enrEKUNKd2V3fBmjA?=
 =?us-ascii?Q?jHA53dcGf5UyEysHtqL4/+KDtDlfqwAeVL0KRlQwBHsM9jpnaXvfFMItYOIQ?=
 =?us-ascii?Q?f3aWHCV33YFKw1XqQ6BiFFtjsHfHYP099BEfldvZBHB1LvRifEwpGCXptnKq?=
 =?us-ascii?Q?vZ+PHM1O70ogndiZBhJgGRgd7lBE/3B7nxcFJnkthz94IDomV9VRSP88jhbK?=
 =?us-ascii?Q?7NOOxL22SKHTJKpinE8V5xT2i879UBYNLddO4jsZomgV2Ka3Mja11IZqsloB?=
 =?us-ascii?Q?+6ZsU380PMreAAwwzQp5R2G6qw0yHBUG+e17qWCT+yfNIWRvcs71K8umGMqZ?=
 =?us-ascii?Q?y6wt7LjLLOgNAqDvdW1/jh7G11DY4E//j7y/0ipV/NZuIZv25pc+i1xAAMV6?=
 =?us-ascii?Q?scwVcd+p5uKumpIjxb0fDaXNkhq+TVoNTfdiHbt4+2wgF3oa9Za3BBjMqhcV?=
 =?us-ascii?Q?gaJiBbZ9nc0Y65P0D3lJGKqf4CWFCsLADz2duHpaGCYMmsJmOsR830bSEZbu?=
 =?us-ascii?Q?5CJjkYJ2SOIVDGswy+5kJlMQBnu2e1YM4trO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pNKvJ2kgy+4rrwVFiMQL0WuHG94P+pd+EKgARbhJE5gfgap4wKn5980clJGH?=
 =?us-ascii?Q?T8xx1OEwSRViwVFBV/lXWKhVyDgWZ6COTAyw3D6kocfyU3bGlvF0oXXAUyu+?=
 =?us-ascii?Q?aGmtLVc3Y9ME+De7wrxIcdwxyF+94GAhrie5PkZQnmB1/gpwVTC+tvemk66e?=
 =?us-ascii?Q?69J63LiN60ex/OIpzeXyaPP+4mtPq4bfAlT9kaSsv6EvrYonjKpjFC7Ra+pi?=
 =?us-ascii?Q?L6ZKd4MP6H0PjBAl50OjsmK4RjptsHU1NafSR6z1IO/2BU7PwZpCPfremhkz?=
 =?us-ascii?Q?zd19p89t1Dy/xaD8NX7ut/WoMFcFCb8YR7azNNfLLAFu/VQ4bmcEoelGJadY?=
 =?us-ascii?Q?mFL/2DERFwPsTlbjv5RWeLad5IkjvrlXmU+IW20ttTcWQdytBw4zMdw0O4Ib?=
 =?us-ascii?Q?BHD1qX5uemU6A97phYnbhrTi5hw8Prv7zASqzQ5SpjZDeGYIKd60IJ5rFVt4?=
 =?us-ascii?Q?1GZgkTT3RR64N8UMCEbaetd9kx9q5g+OgYS1lhB6Y1aFLGWPEgm9vQlDCbmY?=
 =?us-ascii?Q?Pgmq/vj8p7M6B9UUeAuzxNG6xEcwfZoJw2orkIMF3I0CDhbVRojVtxm8HJ42?=
 =?us-ascii?Q?Yfq/vIFe/By+CTPpCMLdRIIW/njyr3Ks6F8MzWaauNvjs0j0tnRoZ88XJh1Z?=
 =?us-ascii?Q?Liw1IsQt1WX3gykFGJykzVMvMSaxMyvaLcN5a5Gi2O6mLUsQFm64Q5u49hdK?=
 =?us-ascii?Q?B95YkaNv5uBPn3EAO7+EknWR2825QI4R43J6E5BBEzSsAPOxLYhBOJkpHGKa?=
 =?us-ascii?Q?vI9UwRLN5vSjRxkhz9UY9wtLXWW4gQ5rMiAQtvu6+Ihj/zKgz3uZd+IVasud?=
 =?us-ascii?Q?X++TY1mTEayDrfR8FgFHx3InHJrpMzqFkEXCzcl6X+ovoVLYvwEfQC8ht4Rs?=
 =?us-ascii?Q?BVx53iwbMRBRt60lwlNo9q+BpPqB+vZEDsP6r5dB03hOWzr8gH6ejv159gye?=
 =?us-ascii?Q?E/s7RZZkDO93m0ZkgGgIOn7Q/xHnqI/AUYXingahyv2YYXbKtn6VT4fUEFhQ?=
 =?us-ascii?Q?M8k2rpw3WVI2C1z7pSDKW05o7Dnz28AJZqLYLHkeJnflQey9rHYrsvgNKVLc?=
 =?us-ascii?Q?VtuYBQIrP3NukyssTagW/GNMPQWC5kayxfBms+7s5t7hmE8YPBSpTPSOV+ix?=
 =?us-ascii?Q?pCCLA0Zf6tdnvS8f8MrdtYmH9J/NlWenXk9CFzVzlYdPtPaU8sodEWB8mk9R?=
 =?us-ascii?Q?OA/W8tAxJ3B0ctwNZk//67eJoWDLN0AXwqBJOwE3Ptnmyw+o21FkQXVRyw+P?=
 =?us-ascii?Q?G/ixsNL0pvqEqQ/s0QOMIe7OoBea6EJzDy4ebVqcCAxK8b3EJ3S1unGTp7Jp?=
 =?us-ascii?Q?vEuIrJLU5/xKq/qtd340m6dXmRPFD3UCxvTBLcY6z7MGU8grQIOqufs+g2Iq?=
 =?us-ascii?Q?ZgG3hj1QGH1OvyPlxahwJbKDuKM1s9G04zmHhIcpzyEi9vvNCnx8BS9Hsj7g?=
 =?us-ascii?Q?XCEM/7YIW/xk8RsdIB0jQtFrgvbJEeYk9ad4/j8Ht865ySBroJpAnuTo9TxD?=
 =?us-ascii?Q?o/p8zVZvjGBuMiojazJSJkohLey9xj4p6vL89c9b0lYBRusRttEQ87vBFWd/?=
 =?us-ascii?Q?yxl0SFRU68TDv70G66rSlwBWBeGQtlqEuaLli+I5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b28fea7-89a8-404d-ae50-08de1e0472e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 13:49:19.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QS8VyRcim40y9gvJDQYknWD75hJTQDv/7rR7TAaAk8s4iFbNsq8LU32zpnN7Sx10D0Gekg4EECMpxjRcPJMe8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420

Hi Daniel,

On Fri, Nov 07, 2025 at 11:10:15AM +0200, Daniel Baluta wrote:
>> There are three cases for M7:
>
>Here we should specify how M7 gets into these three situations, is it
>via the ATF configuration?

It is not ATF configuration. This is configured in System Manager.

>
>e.g
>
>Depending on ATF configuration, M7 can be used as follows:

I will use:
"Depending on System Manager configuration, M7 can be used as follows:"

>
>>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>
>Here we should make it clear from who is M7 separate.
>
>e.g
>
>(1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>can't control
>
>>  (2) M7 in a separate Logical Machine that Linux can control it using
>>      LMM protocol
>
>(2) M7 in a separate LM from A55 cores that Linux can control using
>LMM protocol.
>
>>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>>      using CPU protocol
>>
>
>
>> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>
>
>>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>
>s/seprate/separate
>
>One question here: Is it OK to call scmi_imx_lmm_info no matter the
>context are we in?

Yes. With LMM_ID_DISCOVER as parameter, this API will not fail in permission
check. It will always return current LM ID.

>
>If this call fails is it safe to assume that we are in the case (1)
>describe above? E.g Linux
>cannot reach the M7 core through LMM protocol  or CPU protocol?

Sadly no. See above.

>
>
>>
...
>> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
>
>I think this should be called imx_rproc_ops_sm_lmm.

ok.

>
>> +       .detect_mode    = imx_rproc_sm_detect_mode,
>> +       .prepare        = imx_rproc_sm_lmm_prepare,
>> +       .start          = imx_rproc_sm_lmm_start,
>> +       .stop           = imx_rproc_sm_lmm_stop,
>> +};
>> +
...
>> +       /*
>> +        * Use power on to do permission check. If rproc is in different LM,
>> +        * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +        */
>> +       ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>
>I wonder if there is a better call to check if Linux has permissions
>to handle to other LMM. This is a bit
>strange but if no other option we can go witi it.

Per doc drivers/firmware/arm_scmi/vendors/imx95.rst, this is the only one
that could be used for runtime detection.

>> +       if (ret != 0) {
>> +               if (ret == -EACCES) {
>> +                       /* Not under Linux Control, so only do IPC between rproc and Linux */
>> +                       dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>
>Would this be an error? So if Linux cannot interact with the other LMM
>via LMM API how IPC is possible?
>via CPU protocol?

When M7 is in a different LM, this means it is booted by ROM/SM, so
there is only IPC between M7 and Linux.

>
>Maybe we need a better explanation here.

"RPROC LM is booted before Linux and not under Linux Control, so only
do IPC between RPROC and Linux, not return failure"

>
>
>> +                       return 0;
>> +               }
>> +       /* else shutdown the LM to save power */

...

>> +       ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> +       if (ret) {
>> +               dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>
>do we care to restore the flags field here on case of error?

keep or clear, both should be fine. But restore the flags should be better
code practice. I will add that.

>
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
>> +{
>
><snip>
>
>> +
>> +       ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
>
>Is this CPU protocol call?

Yes.

>So we can still use this even if Host core
>and remote core are in different LMMs?

Yes. SM supports this.

>
>> +       if (ret) {
>> +               dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
>> +               return ret;
>> +       }
>> +
>> +       if (started)
>> +               priv->rproc->state = RPROC_DETACHED;
>> +
>> +       /* Get current Linux Logical Machine ID */
>> +       ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
>> +       if (ret) {
>> +               dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       /*
>> +        * Check whether remote processor is in same Logical Machine as Linux.
>
>Is in same -> is in the same. We need to always try to be consistent.
>
>Remote processor is a hardware part while Linux is a software part.
>
>So always use the same object types: e.g /*check whether remote
>processor is in the same LM as host core (running Linux) */
>
>> +        * If yes, use CPU protocol API to manage remote processor.
>> +        * If no, use Logical Machine API to manage remote processor.
>> +        */
>> +       is_cpu_ops = dcfg->lmid == info.lmid;
>
>No need for is_cpu_ops.
>
>Just go if(dcfg->lmid == info.lmid)

ok.

>
>
>> +
>> +       if (is_cpu_ops) {
>> +               priv->ops = &imx_rproc_ops_sm_cpu;
>> +               dev_info(dev, "Using CPU Protocol OPS\n");
>
>I'm not sure we want to go with dev_info here. It it pollute the log
>and at least confuse people.
>But if you feel a strong need for this you can keep it.
>
>Also, shouldn't be here an else case where priv->ops gets set to LMM ops?

Frank has same comment :)
This LMM ops is assigned to dcfg->ops, see patch 5.

But since both of you asked, adding else seems make it clear.

>
>> +               return 0;
>> +       }
>> +
>> +       dev_info(dev, "Using LMM Protocol OPS\n");
>> +
>> +       return imx_rproc_sm_lmm_check(rproc, started);
>
>If this check fails is the info message above still valid? It will
>confuse people.

I prefer to keep the message above, imx_rproc_sm_lmm_check() will
print out error message if there are any failures.

>
><snip>
>
>> @@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
>>         enum imx_rproc_method           method;
>>         u32                             flags;
>>         const struct imx_rproc_plat_ops *ops;
>> +       /* For System Manager(SM) based SoCs, the IDs are from SM firmware */
>
>Keep here:
>
>/* For System Manager(SM) based SoCs */
>
>Then comment for each of the fields:
>> +       u32                             cpuid; /* TODO.... CPU Id of the remote core? */
>
>> +       u32                             lmid;
>
>But how these fields are set? Are they the cpuid and lmid of the
>remote core or local core (a55)?

Both are for remote core. These fields are hard-coded in System Manager.

Thanks
Peng

