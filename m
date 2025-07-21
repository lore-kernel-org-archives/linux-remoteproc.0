Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219B1E515;
	Mon, 21 Jul 2025 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753067288; cv=fail; b=uyCQgwD+/EnUSNfq/pa9sNdefEz4N+IdoCvdvAdQMKlto4TyheIefd0dyVmmQHWGd/jXrNNPoxkyRyvMdur5+8f9QpOSErFgD6FXtlwWhflsI3lxomYZKzQYbnv2BXwltRoVOESWTy2JANIluXMD8Iam0bx2PuN/PFY1k8bxln0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753067288; c=relaxed/simple;
	bh=6O8xP3mIMe2zWIZeM5wA30VJo3r0fHE2+MAqVzEuC5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r9Gb0X/eWNW7Cjne9AXxvLHbS4wl42eM29wL8055QDPVZei43qFQ7JF00z7TvibD8/PkcG1acxCHER5ck0Ar6qoFDaBoQFo1Z/esZ4glwAtashDgrc6RPoodD4PTGydA7WO1lZN4RMvDpGZttZsW4+10Z3lCXQo4/82DupcWl4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UCXgq0vv; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UCXgq0vv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQLS28yC6nCp1assWS5cHuflABX7i2G5lz9s3/WWi72mxjTPCjmePJKQJkhGRw6aq4uPtlxqCjGqK/lgPRTdLF9xSjPKBhfjV9kKgmkVtT+xgEoyo/R229qZIIDZAHoUaR1+jc47mltK1AceOZ3NjGxhdcayromS8uKJvh9W/NBID+ji18AGhjLnqf/1yHQCIG4WA7ImI69D9zpujkxcrjVaxndFEDLY89mFOoCr2WuFKjvQHlX5eOGtxG1Oz9oaqZiLMwh30bD8RDNN8o5g3brLcl/xoddN28V9PUTA5mHkSnCB9lX2mD4Kz92j0gTJha4TVjC9t2k7EaqBoO2o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq7ME55LkiH8KYWgdgxivxWFizT37eSCODY+RRtAhPo=;
 b=HYS4eRbr1AhmzcwWML9HEvPtqB2nMW2JQIpd8HBLydG4GIH5BYbxCVLWkPAYVjm6aZeQKkzwldTJ9MdbWfdOG7QCk9ED68FIJSx6CDZZB5jkP2VnYiKwIaXEV7Dztz09UGDcAPrcSc4RCFfj0R5qqjJBFxoAvyiqmiqWAYXFEgZFwLYIKOwDY/RdQe5oHHIGNB2Hw3lcdiHPK+SMOSDOmCOUIGCUS6CVVE/PKKQmwwCXGsvOqo2lktDhoinT3XSHHHutG8gjKRXH8d1Sy2goNvX6g7a9kFUw7hrswWcfouPZL+3XqkfnzVc/4RVOX1Ouy3yyxOtdWUNunFqF43nQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq7ME55LkiH8KYWgdgxivxWFizT37eSCODY+RRtAhPo=;
 b=UCXgq0vvkEQYZ0YTy543uBc0151oPUd1+s/4tJv1L6jkZi91uOWedvBzZXZaDRwwP3s/mQQ/RrqAjEaQEsGMkQhVPXjEZL9RN6ERj4ozSZdy4ohUKBwpLrJngIrti768thqgsCW0Pr6F41e0CXthmRnMDmGeknnBCa6q07QLGAZUrITjOJpnwSu2tFiANIX+aGRKEHQS9qfyYu8MqZzlYFM3M8ERvepJbnRiiMA4duphQVlXBS0tl6sqC9tuiopKfBkzim1wH3yEH1e5l+DcQtl41fdGnskEZiR0HmwPUUnNp8RABJw2wILooh+Seb33NbB2Lf3wUaZTqBkRLDfuEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 03:08:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 03:08:02 +0000
Date: Mon, 21 Jul 2025 12:18:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s>
 <20250718082033.GA25126@nxa18884-linux>
 <aHp-_BRk7Iz81OFp@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHp-_BRk7Iz81OFp@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7d6905-d584-4f33-ec0a-08ddc803cdd3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3cAXeU9gEmK14W+xTa+yx//HfXc0J9VXtV9Fj3Jk5uK2IlU50gBWNxiTUMiB?=
 =?us-ascii?Q?uQK/CbBoUVUvjrxnSkdSS+E2lwJFrS2gTvqk4ZWJ+Cqg6E0CSFOGTbRzDR7w?=
 =?us-ascii?Q?veq4Nm179eif5OHP7I3SuUsugD2HIxKBDFbBdVUdGZE/tornMAKLIQuE7dej?=
 =?us-ascii?Q?yIORrsV9oDADNxjvYIPwQAWBbn87tidaei2eaRF2S0DC2TvaoZFDK8holLu8?=
 =?us-ascii?Q?kkyQ05w/J3upygcq13qGR7iTqsClsS0Qvjx15HyULbR1pYxgoxda8b7vng22?=
 =?us-ascii?Q?Gvi4k6ctKswcgGH8VOvbytgfEmJF/g+dHNbITmSoqyqhhQTllfGAvr/e5nqH?=
 =?us-ascii?Q?MXid4kwmNggeo0cXutX/zjJeCpMQlRfnFTKtZXowc50sKmHxJ7ZOHW9VTgA4?=
 =?us-ascii?Q?37JsDfaI8Icfw/jotDRDdxv0g1KAX3bW9XGaSMWtHGdbbZOQN8Zpn9VWBb0G?=
 =?us-ascii?Q?I9uqO55LFb0TOYnW1Fq6E6U+pKgjOh2U1Gl7l0o6lmZM7OJeyXg26G7az4sw?=
 =?us-ascii?Q?Juw192eF1FWd7kvTWYnq2+sHljh44v/Db5b+QsY2hObJ8bFHeFVkinKSGXLH?=
 =?us-ascii?Q?nqRTG1AdW0GWcAt3/DeTqO09CUZAZBkv7x63NcvO8OTrrDHthWvwJIh0QeFB?=
 =?us-ascii?Q?A9tnI2he3YZBDZPUGUOtTMalJHgYiGg5nEl/PryX1DgmnlzH9kPwADzBgpvC?=
 =?us-ascii?Q?ZMisjb2bhEx9OtNiV9/lYOI+xhXj6UNsygf78Bm5FRVH1kHWRZhqcxLIQ5cw?=
 =?us-ascii?Q?C+wnoArZbl6sEd2nmaEWK9htWhzFGi7tjQOls+VdjuXISQZrSkN9fYhYbjyO?=
 =?us-ascii?Q?/JyMQ9hhGviDWFUp0Wc+qBG1B5ONM4XF1Xg/F+736vQ1qdlbmL40j1Hm5eN/?=
 =?us-ascii?Q?CpGN9Z/QhgUalzaCHBeGt9l28iitxmCYVNrKwciSnjTVWp3IvYVaylfKKmaK?=
 =?us-ascii?Q?qJzFw25aNhSTMT2JgU08AmYBr8lgbjYWFNL3XtXwSg2IKusNGAFQeQtv9um/?=
 =?us-ascii?Q?B8xdKZ+woikhPGc2ZrXAsqsVPUJQfULOQguY1mFlO+kKb4UCnix0NOZl6Cct?=
 =?us-ascii?Q?yGRFiKTnaNd7ATjjv1KafFQtysH5QYyrOK0U77i2EysZg/1CGFXT56xafFf5?=
 =?us-ascii?Q?aX3nQ8HcF8d9k7SKaVSJhcvLSyjvI0CBV4K5o2g4f+Jrb+/JiDgJcSo73bid?=
 =?us-ascii?Q?eiXU0lej60aYLF4d61wX4wdtYx26WbmJDqV7XTD5//GLPYpSR/V/5sMTRZGd?=
 =?us-ascii?Q?PSm+Yka+XBxODOf9pDLMSs9pIYysqdPVG8iJe2sc5qWa4RpZo9VWYgokENsF?=
 =?us-ascii?Q?57+wnVkdvtyUM/lYoZSrGHQE9UnXNo4tUxvmOd0vUcQQmf5vOYq8BGVfQZhl?=
 =?us-ascii?Q?oTqXbEEv21nBtDi20pisNXvna5BwZqWcdWYBnNH9xxlUptFyC86bGuTz0lHF?=
 =?us-ascii?Q?J8gsKOu9C37u3YQLtms8FWR1UnADOTOe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QQs8h0bSu1tKev5kpCdmK0gdkuHuHJuv9dObw7f6Nqj1pcocx9SWjp7Yeep?=
 =?us-ascii?Q?SBLakVVSfGJkD6vRC+FJ3nhMPiSQxL4H6nny1r91VZCMKA+Rn/jwm7R6Kxkc?=
 =?us-ascii?Q?jC3CB7a03g1SsusqqO/WObMkTxMZwki+q5wsRJ+ZfWpcdKjwDI2ttqyex0sj?=
 =?us-ascii?Q?bK39D53L9SPN/3GTsKW/+6KpYqjoujIaxoS7ujLwi6UizYR+2qjjc5k83VWa?=
 =?us-ascii?Q?RHqXk9imt8TAs1b/suoOdirWUCVbkiJuN/C8wd4Fk77SjkqNMd8xOuYZZqaN?=
 =?us-ascii?Q?Tv4/LNc7td0a66bfDN6RSPLLQWR1N3xhZFqJyYnpnND8CJ8msmnS7nIEG3bD?=
 =?us-ascii?Q?fABsgzc57TWIUQe1z4VNlm5XTNCdTJhR2d1aP94TiihK0XC145bAzBx1TXGF?=
 =?us-ascii?Q?j7BXb4wVBSA0T4/LNFudZg4hUkQpr6XI722ZHaX4z228a7z/Q5ilyAhg7Las?=
 =?us-ascii?Q?7LYoZQgdaj8TmjupRMIfj/dXgSPrCcNmwVfXEZF4qvv0k2sULvT0ECAAx/V0?=
 =?us-ascii?Q?xrba23Bps1Ay2TB9+woYBzNN92BI18BaDgS4TuZZT/IxVPFEK+BvbTnW3Xl2?=
 =?us-ascii?Q?H3NKbyRlKgwJuS+f2l4uqwQ3WQqkAQWjtYkPhJCLiAW2Yocc8kY9xHmQi+ct?=
 =?us-ascii?Q?/18aQFVnvSipBx0uGOQyMudvNb8Bz4hMFR9vOA5wg4pnuuEODCa2a2Yt1+ZP?=
 =?us-ascii?Q?xcBrPw9QzsNIJTmSLZeZSVh8mJioOPbwwjjcFGLXoZdxhI1X/sNS58ehjaFM?=
 =?us-ascii?Q?r2xBefnhWN2G4H+/ETRqvBJWxUy3UNDRwu2cv0fDf5KpWqJQZn3XvPShBL0S?=
 =?us-ascii?Q?zDbTMHH4Bqd3QslB2AIViZ7kdJrTQEN/QPFpiR1bzlCnlPenhYXCovmUof+T?=
 =?us-ascii?Q?wikHZZ9PA5tBLFganCe1dJvfAard2xEUnvYh63oib5f1cjwZVm12BwxsAyik?=
 =?us-ascii?Q?iNOv9Wnj57MQp9t1lq1zpDTiBs7Cpdib0ogGXGtVzjceHMj03L3HyxlrOlRH?=
 =?us-ascii?Q?WZOIWXwacOiFNUV02MBg4e4o2J1Q7hmsMx+9cmuYGqIkJRDdcCtEF6w2nSPT?=
 =?us-ascii?Q?qdKLj6BXJjMxjCxWY/aeYDOT7Cv4jkmvviuJlXbpaAKN7FpwifmxaO9+Mc/M?=
 =?us-ascii?Q?iAsVCUUUoWAJDkzQkxFrinaerClJky6xmI0I7azKWt+Hep/XUn0xEOKwTNwv?=
 =?us-ascii?Q?y0WhLitA9RB81Vh4Hwsc9wKwUpQnV89KQFi0ZQG4DtQkEPZcVPlW1mVxyvGX?=
 =?us-ascii?Q?3Sdr7u2Voxd0e9ofsXrn7Ier7U/b4gNp0xO6SmSty6JNN5Jq8JYjC7aPKCkp?=
 =?us-ascii?Q?Tar8vD01nt+7Vt4xqP3JN4e6+OcMDACyFB/6ejI8et73phUiNdv7YgUt3ioa?=
 =?us-ascii?Q?Zz4tHynEIN4TDJxMJj2Zl46m1uLh0ac9qKKse9gko3QD8Tw/v/rXgNgc1j0q?=
 =?us-ascii?Q?T8+qcv0kb/u4+OU8WBF+qx5kxMrttKmaDY/UwMRKS+aULj/UaFsFXvKrb6ft?=
 =?us-ascii?Q?I1VCQu1w6Fk7RoluSwel7HJfjPjfmrDLddcRBCvaFCUdR5kUI5v8yg0QJ4WX?=
 =?us-ascii?Q?HY5S8HOCLnUVNQfgZinlYFKw6RMcinRRK6cPpuyY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7d6905-d584-4f33-ec0a-08ddc803cdd3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 03:08:02.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7alAULW/TUnB5y+41tr2GPRzLVQizP0BsPxApuYvZje7+ar7vYOoP5dF5UkHtuZBXwHJDedAP5lcuyUf7KwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688

On Fri, Jul 18, 2025 at 11:06:04AM -0600, Mathieu Poirier wrote:
>On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
>> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
>> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
>> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
>> >> > 
>> >> [...] 
>> >> > New warnings running 'make CHECK_DTBS=y for
>> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
>> >> > a7123e857dfb@nxp.com:
>> >> > 
>> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
>> >> > scmi (arm,scmi): Unevaluated properties are not allowed
>> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
>> >> > unexpected)
>> >> 
>> >> Same as replied in v3.
>> >> This is because [1] is still not picked, not because of my patchset.
>> >
>> >I won't move on this patchset until this is resolved.
>> >
>> 
>> Not understand why hold on this patchset. I suppose you may not
>> understand what the error means. The warning is totally irrelevant
>> to this patchset, there is no dependency.
>> 
>> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
>> &scmi_bbm {
>>         linux,code = <KEY_POWER>;
>> };
>> But this "linux,code" property not landed(missed to be picked up) to DT binding.
>> 
>> This patchset does not touch scmi_bbm. I could help address the warning
>> in the other patch, but I do not see why "linux,code" under scmi_bbm node
>> could block this patchset.
>> 
>> Please help clarify if you still think to hold on this patchset.
>> 
>> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
>> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
>> what I should do with this patchset.
>>
>
>I was afraid of that.  The best way forward with this work is to wait for the
>"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
>he, or anyone else, picks it up for the next merge window.  If that happens


I respect you as maintainer, but there is no reason to block this patch
because of "linux,code" property. It is totally irrelevant.

Even if I help to resubmit that "linux,code" patch, there is no chance to
land into 6.17-rc1, both Sudeep and Shawn sent their PR to arm-soc earlier
before your comments. You could raise in V3.. which there was time left.

>everything should be set for you to resend this patchset when 6.17-rc1 comes
>out.

Because of the code conflict in Ulf's tree, I will hold on until 6.17-rc1.
Patch 4 and 5 will be removed from this patchset in V5. The two patches
should go through Shawn's tree, I will resend them in a separate thread
with "linux,code" patch included. There will be no more CHECK_DTBS
warning in V5 for i.MX95 remoteproc support.

If you have concern on patch 1-3 or else, please raise earlier. As of now,
patch 1-3 in V5 will be almost same as V4 with only a minor code
conflict resolved, with below change
@@ -1030,7 +1030,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
        int ret;

        /* Remote core is not under control of Linux or it is managed by SCU API */
-       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
+       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
+           dcfg->method == IMX_RPROC_SCU_SM)
                return 0;

Regards,
Peng
> 
>> [1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u
>> 
>> Thanks,
>> Peng
