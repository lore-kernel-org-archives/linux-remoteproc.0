Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA9208997;
	Sat, 26 Apr 2025 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745669362; cv=fail; b=a83m0rp8DArzMiUGYP5CvWDolYhB0zqLiWk5ysVUbxW0Xck1XVSLH5lOGiXykmw0/ajwN3gGkKcczwNpUs8w/spoTm7q5g1BNBl+hFniYbQm/491KN1Aufvn2qamvUPPkOf37NGNXv+h+3T3pLViVXyDUWsx4t9f8K+5k3ORCXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745669362; c=relaxed/simple;
	bh=p3UXKSO7qFZzCMMBR94XJVA+Lv3sL6ht0QdPX3m9FqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aiGuWeiQcnF/h0ihoCafBVQVTJXjSnEHOngXRQDtCFDPcAq1oXwCtTXq1wc0fpZFMik1mReOAWP74NKcaBmiansKVszBk9yJDUIu2TX/8Kjd907bMLaalqUCVxcdMglFRPgW3yCpx3gFkzBnEh5/sS2Z8HmtRZ/2yi9co4TYjgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G3dKIGvA; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G3dKIGvA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAXYgDcF9MLKUQ9/6xqa6bfjayyO1Ki2dpT9VRIDUx4KJpwXXFrFzxH985WCXqLu2h5gBRKUNZedkqyVM7FNo/kjHfnns6etff/3z84KNlCX8P44adNBvyFQNmX3BT6etWpoQHo1BNW8Ae3U9h13d5JOW7hgiYCp/L0BQdU/zzCgWNKoCUIKY+6OroBERZXW6tERVU9Mau1kStw0GU2V/xE4Vdf8TesDRBnicz4L1zdvReKFWQfgAIalh7AyBn2ol6mU1eg8s85g/XRzIsajBNxi4r6/xrbmNs9w2if8ZA0k+HTywma+TIEENeU/e4F0bYCFo9lCjF3/inbhAxFOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdVixiK6AA3uGT/KDYmNOBn4S48Kipz1Dn8Oa05jBQ8=;
 b=y78cFVaRtFforybnKImnKZEk4IRpWLpFNoXy2lE73Kz4YPFII2XBIQZHbrHRzPHW3Jn6+C+7M3vGUFFyzcVA6/P0hSyCEAyKGbFQM+WGpWH2YgajhoG1uVJdaZRXVTJ8aMJVh1gQCpu0czpW9QduA7O9p3dI55s6lqIhGaMYGkWn3TQKhZxuv4aTZJUL9ejv/3Ylx6+z7zQnIbQc8U2qNEnbDY9O6K76iOzBa2DN0/1R4J0XYXZIw2lvJv+fZu6DGwS/nMRumzw65Z7RVoifKxLQSFzRLyVIIVz9HKr7zD191htZRBOP9MJgPGlXug75FAWmICTGVx5CqDgQxxdQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdVixiK6AA3uGT/KDYmNOBn4S48Kipz1Dn8Oa05jBQ8=;
 b=G3dKIGvACl8LWA/teBpdUpZsb8qg23yxYI4nTFJVU7BGg44d5Cl3vZUdOTvkuBfOoCVkZS1llF1pi+dSu7ZMzzdpPSTfnSNFvdxlnhvriXUT2qUSt5DyP2I+Cdrf8nXCO1ECHBH9QtnlJY5F+eFdoWE8w7wd61yBcMlNKxD/CO9q8K0CF6aHNV82ZP2gQK9BdMgsCaSHtzxEhgTnkTKgLcDP0rCDZy+ybQX0OkTc6Eo/c3z+y3+t3XEHm+4W1Ugl4hNMDf+R/5qKzUZNcaqdFG3MYz6odaCiXfRkTPZRCqB0dtMGsQQVYJucPGYqQdve2BK5BF284biSqlb8SZW7hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sat, 26 Apr
 2025 12:09:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 12:09:15 +0000
Date: Sat, 26 Apr 2025 21:18:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <20250426131804.GA13806@nxa18884-linux>
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065348.1234391-2-xiaolei.wang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 99279ca1-e885-458d-7115-08dd84bb2978
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/t/Oyphn0o8cFrWmvlupTjtLl77/h71HdMps+0pmQvFm8ZH2Jldb/dH3urF?=
 =?us-ascii?Q?8Orso68z/7JdrzO1uYzD4CozsXgJ9aBcMz3moR7gaixKWkc1Smtx5MsV7hwH?=
 =?us-ascii?Q?KURGkMhO8FOoRvOSk2ZtNUWdpD+K14XkolLCXJrt7api6EGqFR3MFM2umPUh?=
 =?us-ascii?Q?TfCZwrB7fV3iMAA/MAL8FiMgg/Ue8+9TjOIzo8tghDRVEMbdgM9PhotUbdLN?=
 =?us-ascii?Q?M4ZfmavMuiz9roSbLQK4l5G84806wGjOl+CRIFkU5o/kHSto+oTlO0djNRmJ?=
 =?us-ascii?Q?SffdQXOftJ18MZH03O/FQjiRG+MliX2SB8CgDb1GZGtmbl3mpyQ3uHt8WndM?=
 =?us-ascii?Q?ptlrJ4L6+vTzHguVnrrCtv5oDks43S6z4LYGmhCNa5B3SRGiIXc2Jhu254pw?=
 =?us-ascii?Q?gnssqnUxVg+uonjypS5EdPy2z8lBFz/UmEBKCtfKdulBmndmWHGoykFPZNYk?=
 =?us-ascii?Q?mDUHeMwk/FkrA2hIr1vdZnS83Oj/65641cplSn2UPzJgbqCju2tlzJutQIg3?=
 =?us-ascii?Q?1GE3O4s+1U/7qWmI56N77zo030JHJAOnk+H+J0QygUzHqCBp7wIvD8ObuFNk?=
 =?us-ascii?Q?/vAwv1GzfTwEeKW4lcAi33Hj/9hCp2soizyOKg+fiuVlBkh5uGKC4rESNHgd?=
 =?us-ascii?Q?VwUtup5quHbHOl6Ac6/uDMZ5lWFB6g1ZYeMPUM/NoiXc6DgEcacxfSqWYidZ?=
 =?us-ascii?Q?Bd1jzZSK4fljYiJsECPTe68kTBDCIOPiTeaDhm2yclhu/dwHOmmZqBmBtycd?=
 =?us-ascii?Q?Nm8a7SGviZqpPSLIkCG+OM8ry/2GAqiVInmxgwz1hvskjtLOJ0nyQHWH8XKI?=
 =?us-ascii?Q?qnuM/4sCn1Sj7Bq9pETqdUY7hCbNtx79MIzLWl4/cl7Oet7J5N9yMhj9LATA?=
 =?us-ascii?Q?TzLKJxu+DPW8TWMj/ZYW5K5Scb/HZtP++LB5vwC10H/FjkdEul8+Bs00dkFp?=
 =?us-ascii?Q?gD3Ghr8I8sM2DuPAPa1xWjsBLSHL7Q21Hgz7CfuHZYn+VPKLOC8YvC8sk71j?=
 =?us-ascii?Q?qYTTAWHjwr8Py7KOgHoeQPrqzLd9MoXKGwu+tv+49oBiMqNlrVFQ5a9KU8h5?=
 =?us-ascii?Q?FACRbLYjLs1L/Lop3UxTPRBQoNcSbwjTjNNh40VadHNP6lPtn3hJ4gyQ1/x/?=
 =?us-ascii?Q?hkQhTbL98LSQrhd/xplVKjVYOpHbnG7kMKNxOuB8VFDggfQI3HAxXxS1TmN9?=
 =?us-ascii?Q?0MIiIqPqW7GQIwxtu9Ob5/o2QYQdGOoIhZJPPueeMz7gVNJv/1+15zcwvTuA?=
 =?us-ascii?Q?sj4EI+19mVKmdYzZ2afdSeizC7Te3EB2nGyZoWnNJfDp0U+qmY1OoYZPtSWi?=
 =?us-ascii?Q?65I2KBDhmVpKIZEuP8Rhs5Nkc4SPOdhIexveCmVNoP5Sk4Yp06Q+Dt8Hs711?=
 =?us-ascii?Q?kg42cfK7BZHvZNtq84jXKwJeTfK9KitpnvfadoG9qlDs251G3OqRyMpJdSZ5?=
 =?us-ascii?Q?mL773VS8uUP8FAgGnATTsdC0X+BbI4K6QZnOP1us7paVNHvk44LzeSj1RTde?=
 =?us-ascii?Q?+h8UERYU0FWX7/w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fIkDZCzMD7Up2iM7QOpq9cnYiuy+ZH5PbLz4eE+XJFq1CW8z5r1K4IapJY53?=
 =?us-ascii?Q?PBEAK3Jihg6raSaKlF34dtzj9uZ0grH932GCCuDlX7JgxYDNzCtFJP17bEkw?=
 =?us-ascii?Q?LLoiOFbkJLzmnwoE3c2y9piIhg0KD1Zdi5SPUCcDX9DWBKzQJra+QJ5CuK0S?=
 =?us-ascii?Q?avfBt7q8Gf9n+ZSTz+GXU2Si3ZTP4m5TesznxVYj8PGlFe+hSg0DbyIZGZWG?=
 =?us-ascii?Q?cMSmRDPNnC/bNNVAlY/ty1twunJmtHujTQaa9rIbW12DLEwiLV5rcDsldPG6?=
 =?us-ascii?Q?wPEcwGhOWLocwwtFQsUKgD80Ufy4xKk6SGucDU9bcmAM86VOqvOtCaKUX2eR?=
 =?us-ascii?Q?Lxc3Auu5ke47ysENmtCJdAaAk08GhEIgPwFH1xzE/bT/Ne90WmrwcqI1nusW?=
 =?us-ascii?Q?emgEWF565HOWVg9PhFx6xUZIVy3JTD6LP4ZXlAR+jtuqW+ZbZbasbMX9tXbe?=
 =?us-ascii?Q?ABD2GcGQDkuJVsB0c4Xn0aUcc2xhlkzdb1Iw/63i/hVCJhRFtLW8jW/tFtlG?=
 =?us-ascii?Q?ndmsW4Ta0YZb0HUE5RlR3k2cxacn61YeB3jfwOjHA0MjOr665fUWkVMwdXgR?=
 =?us-ascii?Q?VsE/2OHaKdP6gYu+jtXls6FHa+wkvFnJVrWg19No1tF6YdG8qN+e9Eui0HBZ?=
 =?us-ascii?Q?5+oKDMD5pAOPiE5lPLvWOWqG7fkeTtFUu+nlZJNIM2LUB34dGsTXX/uSM4Pj?=
 =?us-ascii?Q?X0iGvC9A8ogga06x2l3xqpyuEitmmKzpDgqDy5ZnqBUWXhaI+dIWjSNK7sGk?=
 =?us-ascii?Q?eDHbuSN9/q4jqncg5FtHVmSmMU7vDhJpZ68zDGtqk3A3RHxXdG22s+n/Ujpb?=
 =?us-ascii?Q?Jksl1lUx6wbpQtlzFw6vYHPYxzeYH/P1OLAnc+iaxSXLk75B4gjQ3Fdso4ip?=
 =?us-ascii?Q?wzkTBOVNg0jA4RFE8Vg7Kffj4BbgZDTxS4wis/RABeo6KPQhGSz4pV+FwKZe?=
 =?us-ascii?Q?fbKSmky1qPT7QcII0aPXQ2XFA2i7kDtp0Labm7++/5xB6FkpJLz4ZHOngJCR?=
 =?us-ascii?Q?r55w4A6q2DKXTo3y9FxQdrDyUIi8nZiDiYs66a3S/nEWKhn2BDHGhr9a4Dwf?=
 =?us-ascii?Q?XaXT/p7mCcAwHoOf9Yymb5tDhV1eX97Fwgg3amr5ky8wn7pndV87AzoDuy6H?=
 =?us-ascii?Q?CNY8NoJSboyuZYQbRmNoF6K2PNXpF+CD2TMfJP3j9HQ7JMKb9DWhjPPSctyd?=
 =?us-ascii?Q?p2f0Kn/ztYxlYyyuYqD7Dzbl7CAp9jXJgK3019fRGqjDvEDdMZAMI4a9ECmm?=
 =?us-ascii?Q?0kDbVjnh2JQZLgrk5UC3sqoSDc91PSPMj6ueGuVs/nEblLu2/pT+xzsMfmgx?=
 =?us-ascii?Q?1YYOx3opr77WgJ2F1VYD9vPxM9zT0Tqc2WCVWsguDtefNep+2Y2Py2nxlLOO?=
 =?us-ascii?Q?Y75cbIN82bGPcnj67GYF7Yzn+TcTPgWiIbFFqMP/VUoj9toD4k1FnCdiuCAK?=
 =?us-ascii?Q?49weZ/Q0dDLc239hyTElkOjLSz47bv/Z8Y3Mj9gSTMRtroPic0YWoGhGsiBs?=
 =?us-ascii?Q?l0+ejjwJkQSMKEeJ9jHq/+JPMsANOaTIujoYaYRUVDWRsT66X7xspswVAonS?=
 =?us-ascii?Q?BfTrzoff611kfeG8rS3XonqwjWU2aeCL7CMhIHlA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99279ca1-e885-458d-7115-08dd84bb2978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 12:09:15.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm+0xeBWeHgLFugJZbXj2XZGDtV+n676QQZMRFIZMucOXmqrmML7ONLngm8NZcTuPqDtdKlhejKlyjMzM5sQ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445

On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
>When rproc->state = RPROC_DETACHED and rproc_attach() is used
>to attach to the remote processor, if rproc_handle_resources()
>returns a failure, the resources allocated by rproc_prepare_device()
>should be released, otherwise the following memory leak will occur.
>
>Therefore, add imx_rproc_unprepare() to imx_rproc to release the
>memory allocated in imx_rproc_prepare().
>
>unreferenced object 0xffff0000861c5d00 (size 128):
>comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>hex dump (first 32 bytes):
>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>backtrace:
> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
> [<00000000521c0345>] kmalloc_trace+0x40/0x158
> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
> [<00000000e7e994ac>] rproc_add+0x124/0x17c
> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
> [<00000000efc298a1>] platform_probe+0x68/0xd8
> [<00000000110be6fe>] really_probe+0x110/0x27c
> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
> [<00000000db3eb243>] __device_attach+0xfc/0x18c
> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>

Fix Tag?

>Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>---
> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>index 74299af1d7f1..c489bd15ee91 100644
>--- a/drivers/remoteproc/imx_rproc.c
>+++ b/drivers/remoteproc/imx_rproc.c
>@@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
> 	return  0;
> }
> 
>+static int imx_rproc_unprepare(struct rproc *rproc)
>+{
>+	struct rproc_mem_entry *entry, *tmp;
>+
>+	rproc_coredump_cleanup(rproc);
>+	/* clean up carveout allocations */
>+	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>+		list_del(&entry->node);
>+		kfree(entry);
>+	}
>+	return  0;

Could "rproc_resource_cleanup(rproc);" be used here?

Regards,
Peng
