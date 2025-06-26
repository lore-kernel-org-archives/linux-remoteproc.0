Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56882ED860;
	Thu, 26 Jun 2025 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963709; cv=fail; b=CJPdkGzK2PheVhaeFbc2YGZ8Man52ETNUQ4YC2x/4jzEF4Bu8vwDOlHhwb2GC26SkZ63LQEcn/haHxSA5cinkYgNKRs/Qz1JcBL7gTQCa0hrKf8Lmnk23Yz46J6Y6Pgt20FUg2q/qV+ireBCMrNMORcuA3NedSgLbdbDHIJWioY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963709; c=relaxed/simple;
	bh=rEQuiFad72fnjgtYBbUgM9tvjtgjSexrLPqrHXJxJto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dZEIGa6Em6XP+bVP9gkwe+LKeWsFj6LVeLcJoaEJhRxnxly9C1Oxryx6Vi/r31WGRE0eqA6O+7D0jGgNsbBJc2nVOl8vSOWn2cDz6zSPkCt/nt06Bq0mTFZSbZxsunTM8joutpLyxqcrM+3vilSXUEEajKYExMd3Xmk2y4S+meI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bo0H/yh/; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bo0H/yh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xerirtWsgpLePb0uLhszPFGMNTkTwfX69MeADhlq/ROGjmYXIpnNSoP1pzNht3zemMePQsLfbuf/YTvZpEdHNVBhBD5tuVZj5b258+OL/6gw5hyeDJC/0Sc9ssGb5q1bxCWngzUeBjv/3AakgfXkVgOFN6eSh8yu+c5MWgxdQbHrzgpsKTA+dcuN19JDDBvQCKYyZ2D8A94M76aswEyh2RYgcBHdCj0c0N5YQ+1nf5VvidTuabQr68XYfn5Ix5UMb7daJfcM/53mLm2PqzwU2VTBxd3fGVVDLrjPu1PIPt+zgt+iK25rWzsAGK+X4/IlBUeWFJhTZqpUZ52gsnpXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1Pd/eZCMinJ3Yke6/z31SjvtAvfh0YTkjpnNCGae0k=;
 b=sQhaXFyHr6z7i/kUPBO4pEE0rNFIX22akNQpvVFigeqJgTs6p46bmFeT1i3DM0EDASjCyLd0oVhMb7h2GShgWN2Qs4YanYz/JAuKq/xQ9UbZqTCi8cZi/zC7BljVAIGHUDl/ogTAnqGHIJOYaRyc5JmbXbm/se9jiWY+ZwbELSy1mlPS5+C8b92ba1LlW/8Yow7LokOQ2VJDMjcXVkG1SVaPs2ikswShIQ67d9zqE7KuNUTa66RLc7BGJVsJJnbl/I228HrLDpwFsGV5s/9kFx2TK/kKokZVvgYApS+pMc8HPIFQE8OvuLF1P4aMBo57zl3jREP+Zrq6Z0ojAMWtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1Pd/eZCMinJ3Yke6/z31SjvtAvfh0YTkjpnNCGae0k=;
 b=bo0H/yh/dUR2WPQ9H4e0cHAT9Q/iqOTZlRk/RuA3cTsrXkgUsmik3e9lllrYfqBOs20aqgw/4s4GTN+5pewy7BHIY3MGqDXK8RITGraJSSnI9F5Q3r8jj+Y8G1JmYpAiVUfwP0CdgJENkYnWD8KtySBO2jKrcn3AZ6Kdpy+xrU210Rh2jPkpBamMrLhgg/p4qXg1W3RBvkPMQ13sabOSCieYTsCq9LvbpL9WXuZ+tDDTacJsWEAJs8y/FE/XVwuWKXAqLirte9wB8fHMdEj/Pkxsbapxa0svPg3S2Tz+cDo1EUSB4t7Wt4K91NLp6nWF9JEkdS0g7/fOobrltqL99g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 18:48:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 18:48:24 +0000
Date: Thu, 26 Jun 2025 14:48:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aF2V8yqGO/6CRlhu@lizhi-Precision-Tower-5810>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
X-ClientProxiedBy: AS4P192CA0039.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fd3640-e2a9-485d-560d-08ddb4e207d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wTBgyIzVZiBp+BSpwCi9xXmrqiSMg+JM7J8UFYmrw562I2ORMmQ/CH2Yu25e?=
 =?us-ascii?Q?ZSAHqlja/C2ploJOHgn/x/1LKtLbA45dkMF8BSG/a5Qys4R7IUlk8WjtjOJh?=
 =?us-ascii?Q?vybL4cMQ2rLX7mpvl6UZvTby8p5f7m/7UeEz6T4NS5ZVgdETth/Zx1XQsFXG?=
 =?us-ascii?Q?quFRLVIMJ8fzDUU+UqQGMTpFYtQZomsjLADp9wOvCKN77t8nKZkrNX31qOdz?=
 =?us-ascii?Q?y9JRZau5vqfVds1k79nz2NEGBz1RSilgZKyZbYgEVl/wk92TfKT40t3IGiaw?=
 =?us-ascii?Q?F13jwKyNidnO9yYdDjNgRzuLzOota/VUPrbDn2yA4QSlk18RKVLCnm3VhzXi?=
 =?us-ascii?Q?l8+97V9EFDiqXUSHnfsLZz5J3dtRDd3zZjSPCC5Bq5DdaOtGYnOvHnkpNHVT?=
 =?us-ascii?Q?1PHQ/CUnnYfrQqPg4hZXtg7i8ecSJU6nnygsoBHdExnU6pfU6rxepV3iZbo1?=
 =?us-ascii?Q?oUADN4QtehiaFbC6YezYIVrdvOoyH2sz1vJVIcN1G8A8SqxuMhXEl/yH//BR?=
 =?us-ascii?Q?asswy0+PP9iJY0PvPNdUXHdvP+Onoirz3lVUPfxk9Kwri/mRxC2KFD85OilQ?=
 =?us-ascii?Q?onLCtMAVd0odScT9biWDvRcVzSTh0ZtwkudKMCmj7Ke2AoL7rR1g/c7yHYob?=
 =?us-ascii?Q?BsFP09vXasf/bvqmv4RhmfjbH0aNRfi0EksX0PBQwzHVB6l8ORkT1QgNtJT4?=
 =?us-ascii?Q?8gwBpXh3dAUkk2lRwG1LNgvYuH2Fh9GfYirghRMx/Cs8l74x9XgTVy83yc0w?=
 =?us-ascii?Q?BYbzvZZT/Dyk3wu1RNX05fZeeGicqC/F8DVABTMxlSRQrSremdfWg4p+B1Vq?=
 =?us-ascii?Q?tfuzevBWBTvkYioe6e7+n3KD5dPj7ynjl1KonSJERN4kfNt3+b8VSu8J3eN4?=
 =?us-ascii?Q?NvkaYjvS/ihlNM5KOwx73VLPjfnrasdJo9gn0LkcykNIJMEevhh9U6Td4MoJ?=
 =?us-ascii?Q?Pm5OAaByG3ilClkITxanoAJlmB9lMNuUN6rx/MOV4vfdzBdaHMLj9RvI0RH3?=
 =?us-ascii?Q?HjJLOosnHrDJRcEazJ5VpodIfs11PK0AnUY1k8E37RLiqITDjupN7wmxU+F3?=
 =?us-ascii?Q?6zfypyMCcaFnnDHKsTobdzfmbuOOBDwADDdPvh+kI83vAHo9kW4AFCGRaEpP?=
 =?us-ascii?Q?u6J7hyk9QFLYlb/X+NjuAHamnnX4xi2A9kMV7mDR7ScjXKHJqIM4wyfegKNu?=
 =?us-ascii?Q?C7rz3b3Vf6Um04IQRJU7SHncRjLKir2NwFxCN0SvYmrAaFpVL2cpxVUEVSgl?=
 =?us-ascii?Q?Q5koawTa/Ll4vppUg2l5yhrd/+4XymNGNR5EuJurXZYxAAhEGI7jDXOLtRaJ?=
 =?us-ascii?Q?FKuI+QNQrWvLOBOsnU/JjkP0CDHr5mVIl8oTfyuDRkt224LGj4n6XqNlyzso?=
 =?us-ascii?Q?SK8VgMSQMdJWoRjyBhgyTyGAWUdV0ugk1gey0qtnXgx+0/4Hu3BGQ+DDJs9i?=
 =?us-ascii?Q?X9g70pA7aUHuSryM3Y8TLIW3pOfbaTHvwL1rGAMGSiK9WxuKdjrf2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RyCo4Ce04Ux4qD4qNcJXKmiJwED2KDAK7PLs4b1iOAlVtVZiRSOo0/Q49fa+?=
 =?us-ascii?Q?fMPyBFy1sWUpbFNYWctsuVmroM/gTCiUzc9ta6BtWnJszMxkZEDWNSEW6Zvb?=
 =?us-ascii?Q?HI0tWOH36ZsTcAILlQXRmmg2HBBjeByqFwNP7hyIkkS8myyYbjRsGG7XNCMP?=
 =?us-ascii?Q?VesDxO0NTBszTI9TUiMHu1LV53hYk8dNxlBrl5BdvLU+ictxw0y2fgDGEQsS?=
 =?us-ascii?Q?Nq0Vz22y9C6wjNWBE4C4DukNn1Udzr0kCNaj3stClwCRhlYF50z+IrjJB1ow?=
 =?us-ascii?Q?BuK891jaQLQdd7bxzOORFuM/zZSKiuzxFWgU3x6Gwoe1AJ3l9LqNiRRR7Eho?=
 =?us-ascii?Q?AJaEpSQxI5j25v+JV/tYXWaMMEVNys23WJ4fmQICC9CWhsAVn4E/AN82JvNv?=
 =?us-ascii?Q?2JwsJQC7Ols1jwafrfh5LC8uepnOLus1egnSu8/7A5fc+6XiKUISVJagk4gL?=
 =?us-ascii?Q?i9KQFxFlezsjtdbvQuVo/IcpTwwQ6+B+w1iBBoQUD6OEH2e1lQuw5TlIHz9f?=
 =?us-ascii?Q?dHQCTq6MjyaIilHt5VXCMy2yMgW/mTFjtq42V6VLQXfhpIjafV8reaf9NNuE?=
 =?us-ascii?Q?MhCmCwhbv53EqAAg5qUjELYaDADFpcf1hiIv5jG8f2K7DhP2Gy6EUUFdDmWh?=
 =?us-ascii?Q?31WMQIQovwsf5TbzxmeXIuA8ZnTDc7gJBoZQFajsFtxgN9PyThhXWRe9hgki?=
 =?us-ascii?Q?++p8blM9928ZUO7bXKWKm/edEjzQmMybNRej43zNG3sN/DE7ITT9xueFlwQQ?=
 =?us-ascii?Q?MkKT2xng2qoBcX8pMleGsCKhpWK0KkmE8mbnazEX+acunT3+0ooaHTl9WWUZ?=
 =?us-ascii?Q?uLIk064TNmCRUXYVhx09w2MVqp6UIQt/IuXeRZsG62WPVaZG7f8u6/jRF3t/?=
 =?us-ascii?Q?XdyMGm7bS9t9+PgIG4N5t7k7aVg8tL24IAKXl59o0Ak2JfUSa0P99hkvAvZQ?=
 =?us-ascii?Q?93eoH4IFxlk+oo8/xSvt152FfVdjVMo7hsFdbUGlMor1XPwoTq+bNKuv0PQR?=
 =?us-ascii?Q?vt90LTpHKNXhquW8bCZNNpWTaF/mzjSNUeoKwjsWHalaTKKbmtra93pfdPli?=
 =?us-ascii?Q?kjA/vbTTnZFh/JSDlfXJGvhoM9mh1CSJgYNcNpY3JBTMLxqaOS2RoKM0kpcz?=
 =?us-ascii?Q?KxARlqs1izt47dpzFS5aMfDhKBOvEsDQdgYcivwdZBW6uF20m7aDuB8OlcT9?=
 =?us-ascii?Q?XzT8i3pgIGtRoyyMGIOrheyniOOMNZS31O3wd+K8QGT/WdlNMrncjm1VdPpQ?=
 =?us-ascii?Q?VeEtKa2L/xsBfW5UGS67ZcLEO4+F4RL24XxaM6WPCEmnYAUwXxmLendmzCSP?=
 =?us-ascii?Q?0NsKRwyfhX5HWpUrKz5h/R+fso/SgJvdJ4LBtCbcEPFSaoVhx3FBMYfklQxZ?=
 =?us-ascii?Q?ZLpN8uYHZO5Pgk/cDMnp+BrwUioX//x9GmrsdJFnwHZCkwVHluQBg/o3N8kH?=
 =?us-ascii?Q?l8uQpVW6Uv45J4PyEB9scjQaSTbsLZlqz6Evd6Lj24SZw5I6Zi5OpufW2IW0?=
 =?us-ascii?Q?Os41fF0GZZ13EQhYqO0/No6C3b/BLxXfqNVjQ6C8//aqM9cs3jm/KplkRZzp?=
 =?us-ascii?Q?OMyk+2loc2B2o9XDLx1LjMSQwHDC2h9BVmXMpc26?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fd3640-e2a9-485d-560d-08ddb4e207d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:48:24.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXs/NXXuP3/+vZqmZZofVImXq8k6civFwUCSN2keQdsVBhqVO1dU59Mh4/1wjTIaodugm7/LeAA97jFgnaCBAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445

On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/remoteproc/imx_rproc.c | 113 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   5 ++
>  2 files changed, 116 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..b1a117ca5e5795554b67eb7092db2a25fc7de13b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>
> @@ -115,6 +122,8 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;
>  };
>
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -393,6 +402,30 @@ static int imx_rproc_start(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +				return -EACCES;
> +
> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +					dcfg->lmid, dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
> +		} else {
> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> +					dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -435,6 +468,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +			else
> +				ret = -EACCES;
> +		} else {
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -549,9 +592,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
>  	struct reserved_mem *rmem;
> +	int ret;
>  	u32 da;
>
>  	/* Register associated reserved memory regions */
> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>
> +	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> +			break;
> +		/*
> +		 * Power on the Logical Machine to make sure TCM is available.
> +		 * Also serve as permission check. If in different Logical
> +		 * Machine, and linux has permission to handle the Logical
> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +		 */
> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +		if (ret == 0) {
> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		} else if (ret == -EACCES) {
> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			/*
> +			 * If remote cores boots up in detached mode, continue;
> +			 * else linux has no permission, return -EACCES.
> +			 */
> +			if (priv->rproc->state != RPROC_DETACHED)
> +				return -EACCES;
> +		} else if (ret) {
> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> +			return ret;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	};
> +
>  	return  0;
>  }
>
> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
>  	struct regmap *regmap;
>  	struct arm_smccc_res res;
> +	bool started = false;
>  	int ret;
>  	u32 val;
>  	u8 pt;
>
>  	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		/* Get current Linux Logical Machine ID */
> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +		if (ret) {
> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/*
> +		 * Check whether remote processor is in same Logical Machine as Linux.
> +		 * If no, need use Logical Machine API to manage remote processor, and
> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> +		 * If yes, use CPU protocol API to manage remote processor.
> +		 */
> +		if (dcfg->lmid != info.lmid) {
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> +			dev_info(dev, "Using LMM Protocol OPS\n");
> +		} else {
> +			dev_info(dev, "Using CPU Protocol OPS\n");
> +		}
> +
> +		scmi_imx_cpu_started(dcfg->cpuid, &started);
> +		if (started)
> +			priv->rproc->state = RPROC_DETACHED;
> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1029,8 +1134,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/*
> +	 * IMX_RPROC_NONE indicates not under control of Linux.
> +	 * System Manager(SM) firmware automatically configures clock,
> +	 * so bypass the clk settings for IMX_RPROC_SM.
> +	 */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
>  		return 0;
>
>  	priv->clk = devm_clk_get(dev, NULL);
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -26,6 +26,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_SCU_API,
>  	/* Through Reset Controller API */
>  	IMX_RPROC_RESET_CONTROLLER,
> +	/* Through System Manager */
> +	IMX_RPROC_SM,
>  };
>
>  /* dcfg flags */
> @@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
>  	u32				flags;
> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
> +	u32				cpuid;
> +	u32				lmid;
>  };
>
>  #endif /* _IMX_RPROC_H */
>
> --
> 2.37.1
>
