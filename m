Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CF3314BF
	for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jun 2026 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462032; cv=fail; b=NO07EX6k0kYmzXqUXeeXrouH9E5Vehu//9YvKBPKr2UVHieDvDdoCPCR6umZ2jOFJfksRwZBKMLw+Y/344XalVZzX/1UEDRaj17C58U9+DN8nh5vq/VD0oQqvgqaR2M1f5djdl/PoVP2bqmAKNlZBgmyB7d9Xmka+BGZAHY6qkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462032; c=relaxed/simple;
	bh=Dj9RHJu7gug52Ex9mAAdhfIVZfZ9a3aEUI/oEyR6zTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=umlbr0bXdKjbjeoyHaH4I67B8umVR9SiwHM0qoLjiPyjftG9c0XXMLGc7OcbHefEGhdYUJEXBeAqhYM81QlD0oEW4OPwSHOQpRXyCc5Iwv4Tzb7b8OqNtLQBxqjfM5AxHUdwhKu8yKlXKmGl1Q3EZoH3PZeUE81mG60FQv7Ad/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KILyTevq; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KILyTevq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVf+dp9KutId4IUe08TNDgBb8zVJVFybH/vYLmzpVlaErmUCXeJUMYQiyzIKDtl7PqFlzGP00SerGQ3sGfpiMf0E3tCfnBRrLRJAyyLzVh/8XeAcVXdLY1fT8QTa9LLm8V5pmxG4EAe/JWPf0DcbWPa9eMgU20OgAOgt0OI4zMpgXyx70AdHhfOavAa0lBz0eTMj2qBMiFLtGIT2Hf3FmsQuLrgO4lyGjuLF8RqyWJicBYGed+TnVPu5sZduCVKmllSF1RG3Ju0V0B89uwvGoerzpVKZEQwcWAvgE1pgngNMGL8s+r0P2Zsvsp6rLoiSgzXDDwnn6ihSnQGV/JNyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w+cE1SF26BLB2ntUux0o/g3N5d2FHOitpw5P0jm/eI=;
 b=jhbOLOa00MXTBhdgSw62GC6inOpQ8VCk6xOJx7k5HwhK4/uOyirpETVP4IDWGd4Z/OqPb2FpfZRP5N7yyHu7eJWLhgWr8i4kgEAqx5CiLVW/o+OxpokuHXL+o6/j/MT1myahrbG4rsbLkxDiiwKTtjpy/IGMgkDAfMsNadgPGln7da0Hm/BsRWMYhr3HBEWG3Hhop5ZKdsa2sT63yWkxNdzRC/0UYgqA5qSBr8mBZb1bNV3m8SyO6Fg/Id7Tv4Q1KnnMEWCfeV5nRwqlx57W1xDvvH6f+SG786wP9FaMofTfKZng3xleQdcz+RSznXjnMToXkTH2Hqx6BT43xkxWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/w+cE1SF26BLB2ntUux0o/g3N5d2FHOitpw5P0jm/eI=;
 b=KILyTevqlpSF1sm0M/WfnmMC7MD8m6lXg4NBJHFIvqTHA9KYvb7OMSEFO7kgmpp5y3QRKpAc+BCd8oOUHJ6CVdo97ZHFaXFTOib1HjyNdvgkiYZ7nTuzRhiWzL8xPP+rcq8ikL9glJ4fitqxSeiZPF/cAZQUoguLByhd+PQ5Lo/H2616Uvqx9POQzD/D/7X4E0Ak0jKJTQLU18zvReZeuEmfZH4TseO09q+jfgh7Ito7UyGvZw8w35Z8YdfniKdC8kWmw84pxgvgkqBr2zGuh6i7SFQBemCmEsGNTjBaZHV54Gir3AEedcaDor9M/K+UGzWMW+gkIUkb0I2Eh+znig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 08:20:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Fri, 26 Jun 2026
 08:20:27 +0000
Date: Fri, 26 Jun 2026 16:23:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <aj43FQ7f6juXQ/tP@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
 <20260624074409.5jwpWs61@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624074409.5jwpWs61@linutronix.de>
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 56bfbd4e-d893-486e-bf64-08ded35bc773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FAGyMogxhtKSQVCGpsRDwOjOlVj3fzNWlrYLChCH2LM49wDWzcY9pKqGxoOx3EQ0yKrAQaDRHGeTEjPA8GwucdU9J7Ub1O6MyJ+L+EP2zbX1Cltg9hiV1u2ASyp//zsTaZsvQcXomv8hCeImD9/yoq76Vh4z9M7LuDqD/OwHcXgEBhmZvNnGsc3sp9pCfZChqGb/4IDGkG03gbuYO745E9BXiCFye5jvGOei0UnWHXQwI/2q6rlpmG8OjK/kXSwLJUFCECJEbItJnTo963t1Ca1RP/YVIYIxbUspZ9/4hKBXyaj6jJsmxKzKCkZboc35Qw1VRO+xXGrk90JQAaYnQsfxm8y6iwKz2PcXEwz6hedh0FWpvA02/ET0nezqcZuaYber9CeptlRkRXR4p4OjRPkGyCI/W4G56oCWWK39wHVifqhzyvNDdBH3bFq3DU1nto7TdE2UBGqb2pF3k/je3vxaq3hRAxTrcevlfWMLHGoWqbb82zRdyFd14j+B8qVWHnMGOylRTOt33jPWG+2QtfaZHqZUHDnHDnTvJ9oyU/iVSDO+S1kwDkB59N6ZBtsdadQAgiYSDYUNLJwCx893mMYGcdQR+8f3Pd/FS4+BD28vzwHqkVqpqszjGfm300cOc1G7Uvn8Ci2juzMjM7VPRK86yvHD6UsNy0iWmqd/CX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NKv/JbIXtwl4xWfKa93kHV/wmD54AYOITH6+kVMdF11muJ9u/PLGv7l8OaSM?=
 =?us-ascii?Q?ndPSPM7CTPhBeDGZWkfR329lDmTt0dBe78jtYtSMbugEcc4bkRDqt46gdS8V?=
 =?us-ascii?Q?ufBcyPyYs2iDtHxHPJq2Rppf7GviiLsxtqNNHTQGVgFhy0CKO0Qm14NH5KW9?=
 =?us-ascii?Q?RKgDt8dvfAaqJXNG22zM5oUzX/UFE0y+lJHnmsbMJHmFW8i8wbrbpCNpgUnW?=
 =?us-ascii?Q?H2QrprPLApxQyMXgo7YmQ7b5675KcuOqnPC3Vo7i/IjhSA20UQ/0GfBQPIZe?=
 =?us-ascii?Q?NvzSUKsyFzZGEcyKmRI3DpkkXFNXzUEsSeTjaXKD47JlJgQXgnGMF/xRUU5S?=
 =?us-ascii?Q?NQAaY8FN+B9PmmzVZ0BrcWlYFrnwDhb6X07wtTXL7l/K5W+ZNDElhbhW+7Et?=
 =?us-ascii?Q?5jzY2xvWD3F3uFdPbvhZurfoxGTPf5MjCeav2GdH1TnDabspVygWoXE0ax74?=
 =?us-ascii?Q?m0af5cI2eSSNc16gslcAPWtJeP60riUxS0hDtFiR9xCSFZbd8Stsn/GC5q9X?=
 =?us-ascii?Q?hDqipDhsdtPuGYksr39QR8NYK90WA17xVeKdT+iD8FklNCoJI2mmyTSFNd7j?=
 =?us-ascii?Q?7edxuEPBxeeDcs2+dkJjwzNCOETBpufdYTsdDqSu2uPFe7PjQHhYXSQ8xtCf?=
 =?us-ascii?Q?SbWIv48rIODIyjFCiWz13gpywMvmaB2r6tfNJNr19EN59mpf1cEa/Yfn5g32?=
 =?us-ascii?Q?CfXacVzmKKhZdozPhnxOtyG9QJHWJkOX5vlf+zzhxhgyoKfy1C+L5rsPjHEg?=
 =?us-ascii?Q?B1R6nA7hW2d0pLPa5IRHk2BPBHkjBmJsK17t8ipQZPuTDPK2dU1TIeekHHar?=
 =?us-ascii?Q?uGLtVg33/DbrI6esLu0jl5PdV+28mz8+HrZ360Gn0VlGecTy6A4oqtiXUiy2?=
 =?us-ascii?Q?Hh77h/+o05svNhUTZpSMaCUyUvpXt77H07nVMcyEd3I+K19BPnHoZ1PWyji9?=
 =?us-ascii?Q?b0XgXbxoJLu8vyxlgiEfT9NCuaYrJnJqPlnJQpPXMPybpyJC33x6J1zLPMEG?=
 =?us-ascii?Q?EhcJIJhpK5EeyxaJbn/HuxkEnUvM2tMuaZjA53RESXC2QAaZOiBqExyLYejL?=
 =?us-ascii?Q?GdxAYkn5hgogpAd8/REXdGmGvXI8xA+FAgeg/NASgWTmQQ8n+Ouz8E8dtl20?=
 =?us-ascii?Q?yJktKOaK5YB6fFtkeDEWgAjuLT67BQ76axFiD90iXp+F4NcrNeUZ1aI+t6OQ?=
 =?us-ascii?Q?hpll7n8bIT2CF8fOsYzcVyD/Of8ikuYH97t6Ktn0HeB+HXiFlFexG1xa9lA9?=
 =?us-ascii?Q?y3JzsSQJIgQ2BnyKQ/4WOON80BR803TcD5nU7HmwFNgYUVkCNtQg0mDiuSYk?=
 =?us-ascii?Q?Jes4WoJoXxuaujZwA+f+OiRRfgLYRL7gtTRkZw/19vOqnpcwoUQ+14KDktvf?=
 =?us-ascii?Q?pMSdhHGw1XDdWo5qD+gNoTPe6iSIyCdukrG1V40+fxnbElGrbMR9hiKHlmWe?=
 =?us-ascii?Q?idMrnvlBz6iN+NCRtxdn4K0X+xvsPynUxdl6zsDUPrf6M02QcZUxxfM/P2U/?=
 =?us-ascii?Q?2Uc9Zz/vi5bhP5fj6aVbrGFrd18RDQi9ECA6wEdOUUXW3MaI6ncjgm8tdf92?=
 =?us-ascii?Q?JIPHCknCv1Pcexay47Oy/gwHfM/EtFCz98XS07a/pfmiNPmrkzkKgajs/CO8?=
 =?us-ascii?Q?zLYmSZHrXX5BAIvnHWip1fLqPKKmgrP7fgrvy65QlTrvCsfUys82+/0OzRIu?=
 =?us-ascii?Q?PSkA89GDD7IkEH02q4vkyzsxhBcP2xbeeKNAntl5HT7p2KQhzntuckyrco1K?=
 =?us-ascii?Q?PXjyQwGXeH9hyf1Oz1mc0KCHRIlItFME7eAsm/PQy/axT2xq5Bor?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bfbd4e-d893-486e-bf64-08ded35bc773
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:20:27.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyveB90AUyiC525fD2MnzmxRKAPl/pe/XApL/wUTWnxeQvH91tW4f3WF8YFAIk7++5idlqPDJ0KAfBBzMYDUnfrJGLzfHLAqLy26lv4gdCKToGAoRhqs1xqSmo5GkqjK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

On Wed, Jun 24, 2026 at 09:44:09AM +0200, Sebastian Andrzej Siewior wrote:
>On 2026-06-22 19:24:00 [+0800], Peng Fan wrote:
>> We may need to use atomic API for TXDB_V2. For the patchset itself, it
>> looks good to me.
>> 
>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
>Thank you. Is there anything you want me to do or is this series good
>as-is?

If you would like to address the AI reported issue further, you may
update readl_poll_timeout to readl_poll_timeout_atomic.

From the fix on error return, this patch is ok to me, and the series is good.

Thanks,
Peng
>
>Sebastian
