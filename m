Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2C1D86F7;
	Wed, 30 Apr 2025 04:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989184; cv=fail; b=A2PtLZoS1sa9xd8YTDzG5x+8jjrPbBlBiu1ZathkBShXjM9Cg0gkdkznlKR6b184i99ftNtmOGWvwHiVdLBBXwChBR2fp82k/L7iKocIqujSkoVNWVhZdXNdWUFIAbj1e2uXI1Zz/psUJiafgdKS/LgRf8TW0usdBA+vbv6GXPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989184; c=relaxed/simple;
	bh=PB1sDFICrg83LO1W+1j6uLl1x0r5s9shGcOaxGrZo9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eZAPtsgQJOpzTzCqs/BL06C89GomiogPEjSF/GP7R53aPZSVsYD0nq8YatOgzDU7MJg30v7TTGx/tEkhRH2sNoBLiU884wXJia2Zvpa08ZWJM5KQCBL5rtenHGPV8NUne5lRYe7+mwsRUY+odKSefwea7xJYTTBU1pjmWg98M3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n1cs1tGe; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n1cs1tGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBbUZt75N7VyacEgHvJ4ujnBQdAa5g9wf4bXQ6Jp6eRBXKQRxnuuWeJ1HwGuA3pmn8qMWq1XAz/vUklFh1cWx5BuajW3baA+1T3bBqjn2pfp8mgGqabK8xkP3sxUc3V1HzQCxMNRl24sRkVOxMoRFY2T2HuMDSggUVbIs2zsw/fSWR1GD3/dNS7+wyXfzX32PF5fCVugO3onvSH6QOXfGjl4ynbLsevzSu0DNp/P+NbQapApzK5cC9HcbxuzBsaEE/QPg5uN86eXq5/hg1bXDnoF2S7ryFEe3NSOVZGhbxdeiXli1Li5GGeRyrmp1503i9M/QhoJNwiKN5o//VfIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vccj7coqlaLwTAfsRE5A24eNVUMjylLXHpABf2YMWbw=;
 b=p87LUKtPzeq0Q4bEFXcmDiWYzQnOM9twA6fLF0NBTAMYUpW/yXC2/EN9JIwIuo4h3ukQdW1o3NgixeOFGShHmwdWSlkRw9n+XeHoD5aVsLevgdPhedlRX4liVPlEydz8pTb0bL1GWceHekivQC8+g7Cf24f+A2Ykal8cRW14lk4z9vyhDxN06HTS9qDK3dPJBTcOlKZpIHpJ/Yweqpl4fTasr1AUqN+8JSv9LPzekVL9/PhPTgCCM3MNWeWSVLxSc3z6yuUe4yIg5j+GM0XOx4rCCOETGTHKiNGezYKRZSgSFT4bQ710msEDxMAUYXq/t05bwI5mnMAoWmLXOseFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vccj7coqlaLwTAfsRE5A24eNVUMjylLXHpABf2YMWbw=;
 b=n1cs1tGeS7l1CSCIpMjcuB37zsoQo/bfosY6Duvnrjype5u3ViuPsXSAitvPY/x0UtqqlppPfMpughzivm5x18N0zWDesZDVUUnsgfuQY8LXH761auRJWvvuDbIG+YhXS93j7SKFshzQy3K1j2qxABqhNbCflaw1eHvU3i/pg1pGKF5HDJ9CbQwQEFvV/Ebm/+ON90HGWbmQlgxqZUZcP3Cnb3/+h8zbgumoDYJECUeBkvVxpWSHIQ1j7z62Q22vQX8wOV7iT1cVjspMfF655k8nEfLwNK/RXRcpE6BTmnNLFU6pfoWmpfzLbcWgQORhKQ9cYWS4v97c6O4Mi/fC2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 04:59:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 04:59:36 +0000
Date: Wed, 30 Apr 2025 14:08:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250430060835.GA31028@nxa18884-linux>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <20250428171257.276bqhaupe4ksu5l@hiago-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171257.276bqhaupe4ksu5l@hiago-nb>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 193c6b49-e2e3-4bb7-22c0-08dd87a3ce01
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XAuNfISb6bIglqba+O2oOF3ofJ7h0O3tABr2xGy5jrrv95cEXqmrtUmZ8fxS?=
 =?us-ascii?Q?J6mVkNCjG8M2HcdmsC6FYofgBSjwCprjG8SZYH77jMY/bIVj5HOKtS5+hCtP?=
 =?us-ascii?Q?6fY7mBd79BT7vs9TkJ3y5yNVnZW7ozemgxA15druldSATz3PfdrALlsmbF7h?=
 =?us-ascii?Q?mDPchbKu+pwz2MOIwBv2arzg4154eQcjyOLH/WlHp1ONYgy9i0pazWJ2Yivh?=
 =?us-ascii?Q?d/G6oMntJKHgCMxxUiVjCSrZHdRnuAR4Th/hz39NgkhS0PNuw5m4xeVOvT1j?=
 =?us-ascii?Q?n75wmrrGdkMQlz7+Ouf1f0ys4viu2guoYUcoztUvKqIuT6T7XM3e8yxW1eHl?=
 =?us-ascii?Q?X1uehLPwhpsrkO3NcZTWrwDBrN8Fa99vOxWoUf0VXuNCkXqX1s7PxCVOtp7g?=
 =?us-ascii?Q?JYf+xeTGwLwkl3p4sQZeUtWGNMVLbZP7M7QXgMgu65AWugPKolo1ygmAQk0z?=
 =?us-ascii?Q?/GFYN6opr4M7xE2eC9sd0zDRWpKcLzIzrNv8Cr4cmifkjgHRs/rwrgFHa3PY?=
 =?us-ascii?Q?NWGgRxJjEQjRyrmNLPRVmq7/aU2jyXF3Fr3+VzJXnDouX4DfHIRjRLVoG5nu?=
 =?us-ascii?Q?yUFjcA2jOrmIOy1NRJrvVovDEsw/YjY2JIbQBymjp8Y8Um4DSUOcYtntZ5Eh?=
 =?us-ascii?Q?9J6pWCupxKlrsuaN0iuldhGc/XfnpkvHgf/2WMIEVkmYHmiHAZ/uyIh/Lqg5?=
 =?us-ascii?Q?DJeuBDSRnOqMFtrxzwfvvJWIOmdtiLRAuO2w8LGVrOe1kq1XRNDSOXca4hhJ?=
 =?us-ascii?Q?RHirrBovaSV13pCO5phnmfcXVd79/MPNRbjHyeFvbOj0PwF+d5O63P72+vx5?=
 =?us-ascii?Q?GCy1DhzBC6NgRsGFOBD5rai9eOVfb0UsTrXqO0K7z3kxDq2vhcZvSMuKG9aL?=
 =?us-ascii?Q?gy9GycpF9hprzMC6xUs3R7bms+Vf+Jszsb5PoEBF5puoboEsr4S27ekA21yV?=
 =?us-ascii?Q?/r320w1wkvV9EbqspvG3Rruft8kCviobvMm9jYI8gLNnK4RJBbVAT9hLhNcJ?=
 =?us-ascii?Q?mMiecozRW5yMcaq8FRXrVeKptzOtRYW4uMNBwC93EjmHKWF9hHE3ij5T0JyY?=
 =?us-ascii?Q?Ao7+qdv9gVbX44I0uJxrvKaKeBwNLES63uT8ZpR0es+t967E+snIQuxyi+9J?=
 =?us-ascii?Q?SmF91p8kVMzOKuzB60D6PnXqGg6Si3KsJfYrf8Zispo80JsguVz7Oqk86fdD?=
 =?us-ascii?Q?SDiP1qPgvI/p+Tc2sfxd96CLZID1codRhXlAoqLZW7p5dZJTpd5zI/yremll?=
 =?us-ascii?Q?M44lHBshWudhFI2s6QfHfkgXkrVBWegFNPzeBtUktUStwvTuNgdarmwESSfW?=
 =?us-ascii?Q?sE0H2nKhnmlrU4C4DC57Y71vB0oJCiBLQl/8OepUoJOoGVD4UVM+uT6MoF0o?=
 =?us-ascii?Q?g7DHGFmnf3DHMcUFqdIcX62dygxPuelH4ZxyKRO5HeBMuYvcrp8EQuMZlS0C?=
 =?us-ascii?Q?YswQMsHhTIplSEvVCNEQw/OfwewiN8apvirYzVLRnvGJFNwhU7yCfhRYdMKZ?=
 =?us-ascii?Q?b2zE8n1PSOBSq4E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0rVuOoYBtc6laNh0hw9Dv9f53qwqQQZNhWBnzHBOa4eGo1ymYHOEb17DuDn?=
 =?us-ascii?Q?Bdo9a1J6ABRfI+zGq61TMeWtBMZhmYe7uv9k4LosQsAnPeZK8h9PwOQpKnHZ?=
 =?us-ascii?Q?RMZs16cOFSvMoG9Lq1VuSxc7gasWuvlv/4PHFZEbcV26p2AY+OvyXV+n7wUh?=
 =?us-ascii?Q?X3Sc688WTy4jF9ewVZpvjMpcocPAKtHMfnL5al06q0eUGEU0GbIXdggRUkEc?=
 =?us-ascii?Q?45rw0a9TDIQE03qxHVTFCNGzzEd2wEnke3+Hca466OE6eA0BtIoAQlmxcBRf?=
 =?us-ascii?Q?1lHk5bL4vAbZ8XlK+9cTG/W01/GI6FUVxIDSV3zCbxR4RzZNnJu1LFMWlEP8?=
 =?us-ascii?Q?7eAlIxXgsJwyt7q65VRfzs2uqv7xkUKF73H+4MgEOihejFRgUlBdUGqFPR1C?=
 =?us-ascii?Q?xmCI2UgG1UtauV7X6OC4saGspB4doUnrrw6zIi0pNXgk4a96+L3h0CxVfuWs?=
 =?us-ascii?Q?qMaVqzDNeFCdh7OW6fEFZb8EpatNJXXt0eVDAZZ4/uAUY3+jHyCUtE53Frvu?=
 =?us-ascii?Q?j9egzuuoaDI+BDUlHcl0XUzoMQGzN0keKQzgDMQZ6KcBk2gGn/NfWgohj0QV?=
 =?us-ascii?Q?lemS/UYIKvg9P7dW755IZfmx77Nlg4EEuVTPKOxIO6jlXDjbdZMc0srNdq+X?=
 =?us-ascii?Q?3sEqNLRKNNYJhhU376mf0criEPoM6JXRiR3lbpIk1XvVQZS/fB4bnCS0/KFQ?=
 =?us-ascii?Q?lQ2qGuzx4A9Jnd2xM6zXjiVGFiWEznDztmXFS/e7wDUae47RSRSC/J5YIxvH?=
 =?us-ascii?Q?mwGOhNaiEiNHFDaH25gNDaHNxxvmhFH4TdnNpTSnyC4OaeUUhOvFSwl8ldUY?=
 =?us-ascii?Q?Hc8FScuZZ5+nmAA2yIiLS6+kVLoa5b0KhlmALm7ZrAUXn+DHoGmqgCskSg0Y?=
 =?us-ascii?Q?yiipMHGpzZw56EEv8xqq7oSC8LZOL+1ztkRc/XWJ5AKNQART6dnGdd4tuDJ5?=
 =?us-ascii?Q?3vzNvCqYxU+TF77uLL7IC1yBkddGE8eSYvfLaJyixnoIgPJD3c/DOd1x1fjp?=
 =?us-ascii?Q?dryS0Ck7znggT28kn1OZQetBYMOO57s8dtLNUF2ZyeWQ7ou4OI0i8W3XvDYW?=
 =?us-ascii?Q?A9zbdmu+EVcfRnH0r44FA4PE86CP2BbAYNwvVxKenzDmk3yYjl+X3d+cPP6p?=
 =?us-ascii?Q?iI/DJ9pM9prNeWDAXn9bLr8NqXAUHttgnXUBPYumR6SFbPRbyK2PndKJhtH/?=
 =?us-ascii?Q?7psnjIv7gnxzM97Y1tImdfwLQhkhkRXAKD5omTPTBJD482wuJlk7buvj+sJ4?=
 =?us-ascii?Q?mUuAizkQSrsQkThfXCBSd8b4Dm3FzoVL4LA4JcO0DRe7igYQXdksK+HS/KSo?=
 =?us-ascii?Q?YCdEn8evsXHwoHjrGgJQzijE56y+605vG0iPlhq+oRgTfeVPu3tmJ8DbvBn8?=
 =?us-ascii?Q?UiWYHXWD28pUd07guGpdGUQI4HmcIOI+O7jxlkYAaDEaRwxd8V6/Htbcm1Gr?=
 =?us-ascii?Q?ZzyLMaeP77vxWAuOr9904lt3Cnuwn3hp/ao0DKyy2Aiv54weI1kqcq7AXzOd?=
 =?us-ascii?Q?oTkumrmVpCDO2roV68X4ooMc2ZMmAwXZY6fdEzE5m6pY9T5pNq8LvbxI+rrz?=
 =?us-ascii?Q?zhEtYzGz8wR1vt9qjOctC3H++FZTMdgDiPfIqUPX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193c6b49-e2e3-4bb7-22c0-08dd87a3ce01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 04:59:36.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odADMUaXi6QHZ83yed42XPlTQYB1fkJgXlRWbHfdXygL4LQIzhcvlYB4J69g8tP5w/Cxx95C9tnJGm6VIj0zmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

On Mon, Apr 28, 2025 at 02:12:57PM -0300, Hiago De Franco wrote:
>On Sat, Apr 26, 2025 at 09:49:58PM +0800, Peng Fan wrote:
>> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
>> >Hi Mathieu,
>> >
>> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
>> >> Good morning,
>> >> 
>> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
>> >> > From: Hiago De Franco <hiago.franco@toradex.com>
>> >> > 
>> >> > The "clocks" device tree property is not mandatory, and if not provided
>> >> > Linux will shut down the remote processor power domain during boot if it
>> >> > is not present, even if it is running (e.g. it was started by U-Boot's
>> >> > bootaux command).
>> >> 
>> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
>> >> unused and Linux will switch it off.  I think that is description of what is
>> >> happening.
>> >> 
>> >> > 
>> >> > Use the optional devm_clk_get instead.
>> >> > 
>> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>> >> > ---
>> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> > 
>> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> >> > index 74299af1d7f1..45b5b23980ec 100644
>> >> > --- a/drivers/remoteproc/imx_rproc.c
>> >> > +++ b/drivers/remoteproc/imx_rproc.c
>> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>> >> >  	if (dcfg->method == IMX_RPROC_NONE)
>> >> >  		return 0;
>> >> >  
>> >> > -	priv->clk = devm_clk_get(dev, NULL);
>> >> > +	priv->clk = devm_clk_get_optional(dev, NULL);
>> >> 
>> >> If my understanding of the problem is correct (see above), I think the real fix
>> >> for this is to make the "clocks" property mandatory in the bindings.
>> >
>> >Thanks for the information, from my understanding this was coming from
>> >the power domain, I had a small discussion about this with Peng [1],
>> >where I was able to bisect the issue into a scu-pd commit. But I see
>> >your point for this commit, I can update the commit description.
>> >
>> >About the change itself, I was not able to find a defined clock to use
>> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
>> >something? I saw some downstream device trees from NXP using a dummy
>> >clock, which I tested and it works, however this would not be the
>> >correct solution.
>> 
>> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
>> i.MX8QX. This should be added into device tree to reflect the hardware truth.
>
>Is this correct? I added this clock entry and also updated the clk
>drivers to handle this option:
>
>diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
>index 585c425524a4..69c6f1711667 100644
>--- a/drivers/clk/imx/clk-imx8qxp-rsrc.c
>+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
>@@ -58,6 +58,7 @@ static const u32 imx8qxp_clk_scu_rsrc_table[] = {
>        IMX_SC_R_NAND,
>        IMX_SC_R_LVDS_0,
>        IMX_SC_R_LVDS_1,
>+       IMX_SC_R_M4_0_PID0,
>        IMX_SC_R_M4_0_UART,
>        IMX_SC_R_M4_0_I2C,
>        IMX_SC_R_ELCDIF_PLL,
>diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
>index 3ae162625bb1..be6dfe0a5b97 100644
>--- a/drivers/clk/imx/clk-imx8qxp.c
>+++ b/drivers/clk/imx/clk-imx8qxp.c
>@@ -142,6 +142,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>        imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
>        imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
>        imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
>+       imx_clk_scu("cm40_clk", IMX_SC_R_M4_0_PID0, IMX_SC_PM_CLK_CPU);
>
>        /* LSIO SS */
>        imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
>
>
>However I am seeing a permission denied (-13) from the imx_rproc:
>
>root@colibri-imx8x-07308754:~# dmesg | grep rproc
>[    0.489113] imx-rproc imx8x-cm4: Failed to enable clock
>[    0.489644] imx-rproc imx8x-cm4: probe with driver imx-rproc failed with error -13
>[    0.489708] remoteproc remoteproc0: releasing imx-rproc
>
>	imx8x-cm4 {
>		compatible = "fsl,imx8qxp-cm4";
>		clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;

From hardware perspective, this is correct. But i.MX8QXP has
SCFW which manages the system resources. For this clock, when
M4_0_PID0 is powered up, SCFW will not allow clk_prepare_enable to
enable the clock, the error return will be LOCKED if user continue
to send the enable request. When SCFW powers up M4, it will automatically
configure the clock as I said before.

Set rate is still allowed by SCFW, even enable API return failure, but I think
there is no such requirement.

So,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
        struct device *dev = priv->dev;
        int ret;

-       /* Remote core is not under control of Linux */
-       if (dcfg->method == IMX_RPROC_NONE)
+       /* Remote core is not under control of Linux or it is managed by SCU API */
+       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
                return 0;

        priv->clk = devm_clk_get(dev, NULL);



Regards,
Peng

>		mbox-names = "tx", "rx", "rxdb";
>		mboxes = <&lsio_mu5 0 1
>			  &lsio_mu5 1 1
>			  &lsio_mu5 3 1>;
>		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
>				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
>		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
>				<&pd IMX_SC_R_M4_0_MU_1A>;
>		fsl,entry-address = <0x34fe0000>;
>		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
>	};
>
>Am I missing something?
>
>> 
>> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
>> 
>> 1. M4 in a separate SCFW partition, linux has no permission to configure
>>   anything except building rpmsg connection.
>> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
>>    In this scenario, there are two more items:
>>    -(2.1) M4 is started by bootloader
>>    -(2.2) M4 is started by Linux remoteproc.
>> 
>> 
>> Current imx_rproc.c only supports 1 and 2.2,
>> Your case is 2.1.
>> 
>> There is a clk_prepare_enable which not work for case 1 if adding a real
>> clock entry.
>> 
>> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
>> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
>> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
>> if imx_rproc.c is built as module, clk_disable_unused will still turn
>> off the clk and hang M4.
>> 
>> So for case 2.1, there is no good way to keep M4 clk not being turned off,
>> unless pass "clk_ignore_unused" in bootargs.
>> 
>> 
>> For case 2.2, you could use the clock entry to enable the clock, but actually
>> SCFW will handle the clock automatically when power on M4.
>> 
>> If you have concern on the clk here, you may considering the various cases
>> and choose which to touch the clk, which to ignore the clk, but not 
>> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
>> 
>> Regards,
>> Peng
>> 
>> 
>> >
>> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>> >
>> >Cheers,
>> >Hiago.
>> >
>> >> 
>> >> Daniel and Iuliana, I'd like to have your opinions on this.
>> >> 
>> >> Thanks,
>> >> Mathieu
>> >> 
>> >> >  	if (IS_ERR(priv->clk)) {
>> >> >  		dev_err(dev, "Failed to get clock\n");
>> >> >  		return PTR_ERR(priv->clk);
>> >> > -- 
>> >> > 2.39.5
>> >> > 
