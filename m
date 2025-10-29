Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0A184;
	Wed, 29 Oct 2025 02:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703930; cv=fail; b=X66nUrv++4RU988b5sQ/VqhnWlbu816IK8ogqzNz20wdmxdaPoi3tpI8CwE8y9jMOo8RInzYzTiPuv86QX0kYWP3IiLreJDRqhfi58VqP7+EcceyFLayQEvZxUJSrNi1yyv/eAUxX7ZmAIV6oOoC1D7hlRc7xegpHsusxl+foxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703930; c=relaxed/simple;
	bh=+JKNFT85XG/jxJUnPcKM8XbSSKMrhqkH+BGSJPv6gj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ncUwK5eXo6SoAQ/t62PSIv19uO/9JmlqPjzyL8A14adxT8SWopsdUCUdtXJ6QaoKdoaLgvmdnK5hBMqFjvrjnTzHthwEJzu+4L4x97xaD5d+G0imV824sc7ywitHjAGLyNhr3/MEBw9EywayvNrxT7nqLi1MvOLl2J7erkUiSAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cl3YXEJI; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cl3YXEJI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QC2ow16uE9E/zvxcQZiZbreGUWoJnC7Mpd3vtdwiLHz38n+ap9HyektP1fVtZPyemgXJZJ2H+Ac+dHLhJWs9ylnfoJX3D1m/REPecAr2GQyDsa0/YYsPUDABW1aFKaAWHLOkRcc1sw5XuXR+Adjzzr0sAIITrgjuZ0SHmwn4Q2UH7VIeEhcjYo0PpbLc5F2ZCxAIxIrLpbBjkuwVeV69Icz4PyCtCheXa3q/eSpWX4CtokHvxSj6IT5eNQh4SV9sIAT4NMbw9gCJcropTvZLJJmV2BXD0vGTjNifTz9WVvzZ79GOy72c0IHpV1GVpTNE0dYksxsKMqX05i1ww1LW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czP4I8bD701ho5r5Y2G8k/MKrpR83r3XVTVkUaUAk2Q=;
 b=Wj2HgbS03ePAycgvnC1KOKcObYpizyE92VN1od7kS1yKoHDxja+pGnZfmvGx+VwcEK4PGHKw4KctvaOXACg0sgVn+8ttw5USGKZ5XAYC6Fv9uINZOOu/XzOPGVpXh07Lo3bd1CDdhDvDA7WOHbbT+h9LzY2DCt8h2BbCvbov/RiWu1NXDQmT756MhrCp3YzZJ4rA0RsZ58y5HNmQ4wxXf911kz+MkjmEcA6iZjP9CFHowkWVetR4rQfsYzEkJ/Eo9GxG3j6KYUhswJNX4XzE0MAZ1HFxJ1WggFA9GfEyYQSr3p2X32rXn23u1aDfLZEsG6geHcsY/89omZSh8JeKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czP4I8bD701ho5r5Y2G8k/MKrpR83r3XVTVkUaUAk2Q=;
 b=cl3YXEJI+jq7p6ragYx190HD5pSNnVpJg+WqCb0QPxZx6tYWM5Anel7Ya/o4PNqU29oubis98edDUMQnYdtLvKZQV6yBXVB7Dk1qKGIybrkNSeZEeIjG+LSZRAEaANmED4eqVO7UX9jjRMtnaa37dFnU6rNFy7P+vc/EwvPturVe45FVCUPLykIwGWkK4NRgPuSyjvFbX3MXtDFSpXINmgoww5pCNhaABlt/gaDv8YNKjdZclMpLNMosC9OyZBwFKLPL1Cno12M2Ycm3iecz/Mpk51KcodJZ4wuqpm8sqt9HRI1PFmTqAFrdeGj88pk7pNRMBDD3JLiqZ62UYKHgXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9885.eurprd04.prod.outlook.com (2603:10a6:102:391::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 02:12:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 02:12:02 +0000
Date: Wed, 29 Oct 2025 11:24:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Message-ID: <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028045730.1622685-1-tanmay.shah@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA5P287CA0177.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c754b50-8e67-4e6e-ecc1-08de16908c55
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AnlgpBqbMuRuT5xWCxgMqFXEfKCF+nzQKGpXXnV4VrcO8I+4urul5sJc3EAx?=
 =?us-ascii?Q?b0wKtqXTEDEFK8kWbbDZhgrmfEVyXP8Qbnxskh7Sgh0mF0T9Wod+vVFuHGZu?=
 =?us-ascii?Q?M2NhlPPuxSTQg3zreo7hzLqdJ4M4Ph/8GCz1eJvCZG0YTa4e9o9hL+L7R3GC?=
 =?us-ascii?Q?D2zPR3pTmvqQZw5+i5xdRnNaT8iy78kmcdm9/seYkduu2xQwcT7CUzQEpU1z?=
 =?us-ascii?Q?RJm9G6RPK6iRB8rhLaZbLJfsE6R6/ZVaTKkXeXEdC1/1YzRfDuSM5OdqFfFU?=
 =?us-ascii?Q?eDaWd0OMqun/GltJJIPhDnGej5KFXPyJyCfLGnIdFlMB07kaUCVJvpxN3tFo?=
 =?us-ascii?Q?nxSfBLC2VpYjBFRfyDXbisgefjfRCRexulOMTrUo7ETyzgIkIoaOgEyST//x?=
 =?us-ascii?Q?P5C4+fr3omVQv1SwgkA91sdqE5iMjoqY0xIcAVGff8ee+a+PC2X09Uh/ZLux?=
 =?us-ascii?Q?aMHuEwTzdB28eonNsL4pH9cu+wV+GP2uYntMbkUxGYRgrt1oiLS3ydVzz9MM?=
 =?us-ascii?Q?anEZSNSQ22xNIFcEoqY/BBjgy6SIb9j7rF3LBu176bRl99rKovkwBd1sXmMb?=
 =?us-ascii?Q?2oBYT55R0Zvs+EESl42HZgWoANjDhl56ZWxVHbBB1ZKPB7dhQNu8wm9Qsh4D?=
 =?us-ascii?Q?U2JZWX9jA13fHFzHWbelAtbtM3Om85IiPQp7K5+22hAcy7nsNTwqx5fLC8Xc?=
 =?us-ascii?Q?yQzfzP9JHXZmjbt/fN7C+yG/VCR6/mCOzjCuw2niQgSiAxn2xFiiQMjDfV4E?=
 =?us-ascii?Q?RotXG1P1I13JQw6Os+NkFsAXSg2zujF2XIKLs+822qrr6cL7KLj4JMyDf3pn?=
 =?us-ascii?Q?NOUWgFKJBFh1Z3OTwyzDVvnP/aG98V+BvYs6n0PC+TCY5NnRg4Z976fdoFnF?=
 =?us-ascii?Q?PInaY+9XCWDa2GLoirkjHNYA1tMMCBb6QQK9Yny2bvO47htJqYK8pxPOor9L?=
 =?us-ascii?Q?kdFuwtK1vNR+I6VAXg7+BdnRL74QcY0kDFtutQpgj2K8bmKTqMtEHfYXNDHm?=
 =?us-ascii?Q?/8jWedJ+LuVPyojTyJwcjFpOcn1kVOX8H6N5iF0MgEzKBplBmrwxUCAgSfn/?=
 =?us-ascii?Q?xsW6D7hADYE5nX+GLxSbPFihybZ726LtEGx4iGSyqkQD50FHS9PLlZqo6faq?=
 =?us-ascii?Q?7k603Ss9Gfy0NKGIC5SoDOUTY2Y+NSxlenAmFuLpMOD7oZq3oqFG+so8txZ5?=
 =?us-ascii?Q?WAM02m1lqb9Ihv0mdGmqSls+oTcsxBuKGVmnEBezA976TWOSJsOLtzTjz09i?=
 =?us-ascii?Q?XOPvLbOqjwvNuq8+VUk3Lo1yM/acOa+GBgBroVTAl+GIFYrgVGQJf8gwi7Yt?=
 =?us-ascii?Q?sd5/taA+6HBq6X6drWrl9FhYaLoFxhYZ5Logi/YTYdNB61XGIcvP2G0NtMUu?=
 =?us-ascii?Q?rUTgptPsZuq0ztqs8fvZXT1U1foHpgScgbTt4xlmnfvPA76uKR47vOQ75gFf?=
 =?us-ascii?Q?03HqihfdZlswhPEZVXYp69hN+5DEdvy/fo0IKSy2Ka18PWAU+5pfGf5yynho?=
 =?us-ascii?Q?yJrl/2xiGYqcal6vVy1h7EdsSF5S066O3JoP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6Vij9Ao6vi9xtAP+/xuYYGzt4gz0Rqm6xlZQCEj/Pad7Km4WkHsMcngZ/m7?=
 =?us-ascii?Q?YtyXOM95AQH38bG7EEd+2d4Q5pNAFudvwnghcntDYZbkk7zHNC8miDkqGPOg?=
 =?us-ascii?Q?HzAyQoumRmILrujFXWUMLXST8kcwnmdM+mworb7rmJA3x8h5NjM+oCrVKdeE?=
 =?us-ascii?Q?1CxzWOgUm2ITHcyD8SNZM8NwahVkTXPoOZhwUu7Q3NLzoC4VcoxgarT7DKH4?=
 =?us-ascii?Q?v8hAizQKVPsNBPM/lsLAM/a43s0/7J0D8+OLwX+z/J1jvElU178BOlGU2VIY?=
 =?us-ascii?Q?l/axcmvOIpgSF1phblXwj224khP24XVDex8lr1gdhcu8a7AfGzro/UO29xl6?=
 =?us-ascii?Q?6TERbdP2mwFHdK4QuNaVz+AwQMfhxE2VpyOyiuaRfXA+oIfr5emlj2vcZJWQ?=
 =?us-ascii?Q?2+oCGSovk6kEiD6NmyuyzvIWWdLz/7vsTDeF164/R9KNVpGDP/isNUVV1q99?=
 =?us-ascii?Q?khF0PhbcLCdBhYSyEiGkbfnujsv3xuKwz2LxSURMpeorPhOWOE8wDpLmxWn0?=
 =?us-ascii?Q?rwbbjHhaQcBdTVz+fze2XhAAsomCpG48KDFfga9Eh60lKPHBUq9W6yUEwiBq?=
 =?us-ascii?Q?V1+qyKyoU2criUitUNr/9uEQdUAHf4sEQhy87C/GkTSYFwRy66efLQM8+YvF?=
 =?us-ascii?Q?u8JQLkHSu9YO9ZX92PuEuOas3bDQN0QnRiRDligA9QtOG/Sy6rPvX2sEAxnP?=
 =?us-ascii?Q?GFuI7giB3yNQdbA9f6Xz6pKP4zVCJUL/yMz+mDGcJAdPorvaLNOmuE+dMA77?=
 =?us-ascii?Q?EPSlhLgH1RckgQ4snUJalVtT1iJnJnVIa9HsRbjmo190JYHgo7u8Lo1tinfj?=
 =?us-ascii?Q?6MNiO+Ju3lPKTEvc5v0G0ucWEufrM9u+42JVGr2UuP6VvMoBKf2MfwEvbeOM?=
 =?us-ascii?Q?xNpnrsPO6iEKCia8Twtu94Glx3iFKoYyPX47qlK8n4Wv35YdZbUFSJEiazod?=
 =?us-ascii?Q?RSyHfNHkyXR641t5gXoukMTvyh/Q12cPVgyCrwZcowsHh3DRo7DHqS+6Ho3B?=
 =?us-ascii?Q?G6P+tZY6ERgpIWLL3zbRkgyFAijD0DdQAZ99Qb/2FmbKf+z+OOd9uGENGRjW?=
 =?us-ascii?Q?n8lV7iid6UQevpZOVfzWvOLEWNyboV/wZAgumPxZESmzE6ZkY6zU+UtTHQKl?=
 =?us-ascii?Q?/ks1v9q9l5tNaZkBlJ/zsyryns+2nccEoDFlIzmeRwIgO58ZqvYsXAC7L32R?=
 =?us-ascii?Q?NXpnxaB6/QrJ5zvZy3oNM+QhEwU9SlZNRivzCSwHe0A1d73o0vmZ+UIKC8iR?=
 =?us-ascii?Q?Bka6q4i/wi34qKGK48SysJO185FO8YviCXM8B0lGlK2Gp3xwRlkId2zBoA/t?=
 =?us-ascii?Q?2CVYxL9WuFqt1asb3lzQhFQRJ1/fOpqGW7IoPKXphOiO83eZJozqPauG36Q1?=
 =?us-ascii?Q?URGD6WSeGk4STB5d63WP0ZafG4QWqi+NAX+MUHoq87dPyuhNvGLx1dKhupQ1?=
 =?us-ascii?Q?ai+KlKhVRYusCiBClGk5+DPOSDOHloGv4CDbnnwW7vKcmQoGEVVCKko5ZkYU?=
 =?us-ascii?Q?LcL7HTejkL2zyujZSYzD8sWWktpwd+xjYM7eqqRi9OkeLlnFGx+FHFguZln4?=
 =?us-ascii?Q?NfCwzdkcpNWzfpaE+tm6EfWVE4fTwnr1y/9tzGpm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c754b50-8e67-4e6e-ecc1-08de16908c55
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 02:12:02.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlMHjWCZ1VbAk+Fbnz8s7pNjKzYpZo/7Lf0JkQQu3ndDUI1/DJE9dTbazDIk45NuC/z/PwiQ1swwS6hJ0wKCEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9885

Hi Tanmay,

On Mon, Oct 27, 2025 at 09:57:28PM -0700, Tanmay Shah wrote:
>Remote processor can crash or hang during normal execution. Linux
>remoteproc framework supports different mechanisms to recover the
>remote processor and re-establish the RPMsg communication in such case.
>
>Crash reporting:
>
>1) Using debugfs node
>
>User can report the crash to the core framework via debugfs node using
>following command:
>
>echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash
>
>2) Remoteproc notify to the host about crash state and crash reason
>via the resource table
>
>This is a platform specific method where the remote firmware contains
>vendor specific resource to update the crash state and the crash
>reason. Then the remote notifies the crash to the host via mailbox
>notification. The host then will check this resource on every mbox
>notification and reports the crash to the core framework if needed.
>
>Crash recovery mechanism:
>
>There are two mechanisms available to recover the remote processor from
>the crash. 1) boot recovery, 2) attach on recovery
>
>Remoteproc core framework will choose proper mechanism based on the
>rproc features set by the platform driver.
>
>1) Boot recovery
>
>This is the default mechanism to recover the remote processor.
>In this method core framework will first stop the remote processor,
>load the firmware again and then starts the remote processor. On
>AMD-Xilinx platforms this method is supported. The coredump callback in
>the platform driver isn't implemented so far, but that shouldn't cause
>the recovery failure.
>
>2) Attach on recovery
>
>If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
>then the core framework will choose this method for recovery.
>
>On zynqmp platform following is the sequence of events expected during
>remoteproc crash and attach on recovery:
>
>a) rproc attach/detach flow is working, and RPMsg comm is established
>b) Remote processor (RPU) crashed (crash not reported yet)
>c) Platform management controller stops and reloads elf on inactive
>   remote processor before reboot
>d) platform management controller reboots the remote processor
>e) Remote processor boots again, and detects previous crash (platform
>   specific mechanism to detect the crash)
>f) Remote processor Reports crash to the Linux (Host) and wait for
>   the recovery.
>g) Linux performs full detach and reattach to remote processor.
>h) Normal RPMsg communication is established.
>
>It is required to destroy all RPMsg related resource and re-create them
>during recovery to establish successful RPMsg communication. To achieve
>this complete rproc_detach followed by rproc_attach calls are needed.
>
>
>Tanmay Shah (3):
>  remoteproc: xlnx: enable boot recovery
>  remoteproc: core: full attach detach during recovery
>  remoteproc: xlnx: add crash detection mechanism
>

I gave a test on i.MX8QM-MEK, there are failures, 1st test pass, 2nd test fail.
Without this patch, I not see failures.
root@imx8qmmek:~#
remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
Partition3 reset!
remoteproc remoteproc0: handling crash #1 in imx-rproc
remoteproc remoteproc0: detached remote processor imx-rproc
rproc-virtio rproc-virtio.1.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio0: rpmsg host is online
rproc-virtio rproc-virtio.1.auto: registered virtio0 (type 7)
rproc-virtio rproc-virtio.2.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio1: rpmsg host is online
rproc-virtio rproc-virtio.2.auto: registered virtio1 (type 7)
remoteproc remoteproc0: remote processor imx-rproc is now attached
virtio_rpmsg_bus virtio1: creating channel rpmsg-openamp-demo-channel addr 0x1e

remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
Partition3 reset!
remoteproc remoteproc0: handling crash #2 in imx-rproc
rproc-virtio rproc-virtio.1.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio4: probe with driver virtio_rpmsg_bus failed with error -12
rproc-virtio rproc-virtio.1.auto: registered virtio4 (type 7)
rproc-virtio rproc-virtio.2.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio5: probe with driver virtio_rpmsg_bus failed with error -12
rproc-virtio rproc-virtio.2.auto: registered virtio5 (type 7)
rproc-virtio rproc-virtio.5.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio6: probe with driver virtio_rpmsg_bus failed with error -12
rproc-virtio rproc-virtio.5.auto: registered virtio6 (type 7)
rproc-virtio rproc-virtio.6.auto: assigned reserved memory node vdevbuffer@90400000
virtio_rpmsg_bus virtio7: probe with driver virtio_rpmsg_bus failed with error -12
rproc-virtio rproc-virtio.6.auto: registered virtio7 (type 7)
remoteproc remoteproc0: remote processor imx-rproc is now attached

Thanks,
Peng
