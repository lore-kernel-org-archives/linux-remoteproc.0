Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013025.outbound.protection.outlook.com [52.101.67.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F601FFC54;
	Tue,  6 May 2025 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517641; cv=fail; b=QxXcPet6k+exTVl5QkqjrrMuVl6hNVG47KTRV4uEhbWpRQP5wdeMgbxG3fjqJVepQUyv1sINBQjsyQzZe9FBeD+FxthEPy783XGkALzBjnXRvkPQGjfyNFXYDiSD27kFgtnO24hICn5kZ1YIZVgUAiiPI9TP59YXyeEB+FGSZt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517641; c=relaxed/simple;
	bh=yodrih9lqZHgbcy9ImYI8RbJouN4Z6o5j/9ORZtMAFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JARx28yJ8cmntohLIv47b109LuNTGrMSbbk5oPma9G4fWWfDlc1lZ+zeTWvKiTXxvFnMyQpahzMsOppirvNeGNAZsXlGDdgiMO3ODSyfn14G0RUf9mm01wJoX0MW27GJB/fqfQavoViimz+EEiFJs3jQiWEJd1biipextgUh2IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NcUaisou; arc=fail smtp.client-ip=52.101.67.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NcUaisou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYiY6JA/dek4OVCbXGCdIhoq4fkSr/LjipeU4EyEa1l/MbfBbhUInptmqB9oL8uK50gvHfmOkmmGo6eGTxGv/8HE0xmcVUsz/U3fS3AQ9xr4wCQUdSdtWPkC62pZgUKmK7DfWq5YG28yL8ZDg5T3bPgzlRjD7F4Dy0bF1GPhXcShwYB9bclHhJZtCFuGnEZB9NPkWGWkBdcIAxeFfT8vBUg9WyRMW+KpFNjxhGQyMqJeXg40f4mDhBrkpVTdWueIwJ76d8eAOj0jWEMMrveY1VsBJs7lu7Zgd4aPfPr/f4wJ9qNP3scNTabNkpBnPCSOH+vO4VqOAHNQWntwAjxoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTCe7iya9Nnzf5NjhyoqhVi6QooePuDUWERv3Ed3Z9E=;
 b=H/5UXxRCNUBvQIsnMqk+s5jutUcXtzfOiyPabctL/dwsi5v8EAhtcssAcnhDrrbgAb8uFmeY9toS4U4VhUlRBSd8JxIAu5GEEiUpkBEo4s7ZSsRsMGqO1N5PBzv+CoEbI0U5tpodm+0mUuTjv3Jy1eq+5o0sqHx4iNHfGC6823aF43z9Gs6LRYVWG8Cw5SuX7Ja0sdwPZ7CquuBBR3Iiuhk5syCvW+QJhXPNqi2Z3uCTeit7XgU/4MqvMsj7rubQUuMR3bjcb9ov479evZluRQWIAgEs6B6csRe2iTI8cn7avFn0lbe1l5JjYX+5RtmYhzps7EjibAFZOAYRwricsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTCe7iya9Nnzf5NjhyoqhVi6QooePuDUWERv3Ed3Z9E=;
 b=NcUaisouk3SBYFPptUmPPEKUo84qQvkyw3FkyFrfgn00QXKRM58SzA2+EduJv5m2TzJnvQd81k+2tuds+JK7hZicM2SEv0KHBHJpr1RZu4lvmL5FsddDAXnMpjwrCxSdYWOg422kvpoPOQxms1bjoUXlI4Z1oDUTrZKvZDYAtXwTEGfDYR/WXWgDPhGR+hMaR809QLQT/ExD1ioI+B4/BE7DToiB/Nka7kp1Ns26knsek5iSipuEBI8iMashBAcODRVlztcLp4cX9QQ5xnzqkP7CnvCeu/Sw6+iXdyFjarD4xRzDswVb85q7Rwd8R+ULdNepNpcc0mdS94IOHggo0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 07:47:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:47:16 +0000
Date: Tue, 6 May 2025 16:56:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix two memory leaks in rproc_attach()
Message-ID: <20250506085622.GA3240@nxa18884-linux>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f49381-c2ed-4192-6e3d-08dd8c723887
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uSP/esU9P23pgCKX9J2qH2ssHX9S67VR5MDBBWCYP5mCEb+wASPScw2MC1Nj?=
 =?us-ascii?Q?BWuyRgstOnFJmj70y4XRTCd6dA88SHLPubGG6GRquu0uhlescOSJEzwYKpK7?=
 =?us-ascii?Q?qcXj9LL5V7Zl0jx4Wrs0W1njgtTRRxpapBwBeK8zJU0nKkkSytckH4zgyUEH?=
 =?us-ascii?Q?MJhqXLkTiA0Bj585g7sB1rLtdL+TgNHxDoQKptXO7JIEbzJwzKSRzfipjLXi?=
 =?us-ascii?Q?oJregDUKZ1HrkMeyI4hz2TPisuBnI7ZSsSWgzElrQTjHVc7ogrTFbvrysdce?=
 =?us-ascii?Q?9Q0txUOUxYmu0vTRvICgvicVG9Ahz+leyAHLVLKO6U9O8Lzrv/3sT5rh8ncm?=
 =?us-ascii?Q?dTm+issZJtiQ7GSYkqy0+9IFU0MKxHxc7SA+Z+nqvluSjPY+jz1k4W1FylJf?=
 =?us-ascii?Q?TZzJe8hO/Wv/E0VMADT/ycANNBPtrHEMOQVfpi7XmlL/UMYJ/5cRCib/Ooft?=
 =?us-ascii?Q?iD4Dbk9keLh/i9u4thwAd7zbr9++PFfmNYDQL+2ktPK1BisP4K+uCHjIVafM?=
 =?us-ascii?Q?pLDig0wbapQd26jn8nQgmbsxZj3/ccGESOP6WhZaOtjWHygfFDOgtuKL8BOy?=
 =?us-ascii?Q?ZE4spRs49At+e+ATfwM9icHldTSJ/67CBUqCUqe37jG9c9ay3WdyLgOH0zEk?=
 =?us-ascii?Q?0kBbc9LgnRnTAJ+Dost+/5IlK7btRY8L0YBGIkXkiv0FmUwEtcP2ja7VG5vA?=
 =?us-ascii?Q?6GgHWPIF+i99mkyfSaQGI9QxPkqAfYXxwJdJGrTymhodOSRYScyADH9cTimg?=
 =?us-ascii?Q?G925uLVQ4+hbmdDmLwXwrSbC2yjSyEU+dkiBVLFGCtjYSyh9U7iWu3THH3Yc?=
 =?us-ascii?Q?1Oqb1BJvEawngOCRA9AzEsqasqWPovVNfWPD3pM/XrSQlvQISDyYhR9k8Dv5?=
 =?us-ascii?Q?EFq7eguvTMp7R+Fb0uUiZxpn5cLyyDtAg46qDqAaQRG/vm0XJ0SSYJz9oyGW?=
 =?us-ascii?Q?4ISJuZvyfdfo1boGX17KBaRAcaOKh3aRwmCbTXLC5BECnEasW6OweXc11qWJ?=
 =?us-ascii?Q?g2XzFi0Fc4JhKswF0kIDd2MhbfkM/JfHUwYJgwBJtIVurWBX2uvbfCrVBL7k?=
 =?us-ascii?Q?IAT0VbZGxk4qM0pwPli0FofAX9/O1SCV3rKj05aYShK6sGaOUgjr44ZlBIJ6?=
 =?us-ascii?Q?RkDU7UKmfpgbyV7lSFdjOR4LhGjNHln8ZfTl+dKTSQjbV8eqyOOLs+nqEO9m?=
 =?us-ascii?Q?apJeEatjgKo6EvUKXx0187InVwHsPIiVRgRt/h6WtYjJ+yL4G+3rWCt7Owoi?=
 =?us-ascii?Q?NA3AECm6BVYhhYBscOozxkyFmTEp2FdH2t6HMNLvIgy56zVo8UVrUH1JFYiL?=
 =?us-ascii?Q?bMT7JrPpnGgT8gbIgqyzoPxstRCbscxabQnHtHB8jRCmmJrNZc1Axh90QPdM?=
 =?us-ascii?Q?Vek1Xxqs8CEWmn3TZl8c6yAuLZzkdJxfzFjau4tunxcwhcvd6uGXrus7QVBN?=
 =?us-ascii?Q?P4cg9bxjr34mMaQh5AyTbu4V7lkZ7EAPJYMzPLJSMq5X+g3omyq5tCrrGSSg?=
 =?us-ascii?Q?HCsWjxFe2mu73L4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8e+zzMo1ZqHrCdDtP7r4t5UlmXvzsvwlVr++bNC6vPvQUdtapjdE+jl8+/0h?=
 =?us-ascii?Q?BTCOoLEpscwWB9D2GD2JJDwGYFh26FD60IQmUPJKLz44bwO+HawmeXyp2vTa?=
 =?us-ascii?Q?Bmv0Qdg/JlUDcDpXuP0cwlotBm87rQ/06d6t6mf1Zx5WRnjaEmrL7Mbhw8Ix?=
 =?us-ascii?Q?qfb+KU+z1F3PF3qqwXemBPyV7N+JSwuOdOiu9WnIGtFhzakMzz0LpNGi8oRs?=
 =?us-ascii?Q?8B9oGLIskd3l7odjAgTAvJKazt8uGV+Rq843/NqACdQdDNZdYnmNU+rSFxqu?=
 =?us-ascii?Q?mkMy0SX6sDz4//D5Ybola4Dg694i0o5mu2ruoH4UtjZ8Xk3qufnm16RhbXeu?=
 =?us-ascii?Q?BtC70gNPBRs42fjazWcN+R12hh8PycPlPVJIY05RNKErsS+N/yDyNnkKVwIB?=
 =?us-ascii?Q?Cg0t/w1qGQ/W1ZBOm9ZWif/yHoQa6cEvuEcsg/iy+emce9Osfr6tYxzzgizq?=
 =?us-ascii?Q?RAzDEJlSoTdkkRb7/yxAZohIx15wqXiypy8yOQDGlQmYtvxZ2pSF2WSr7N4c?=
 =?us-ascii?Q?tOBpGUmXPS2EGj0PwzjrixBLuO1Qy2+oLly6D2gsriiGiQhMLLsYEuc0uMbn?=
 =?us-ascii?Q?rqBeqQFE8XRbNkja1HgG1KSzCIUyuAxmbkzTVedgKahPXRvgIhCaTwTH+XCK?=
 =?us-ascii?Q?GBrOPSZsWg5npBNrYDTeETHVBpNsbN5NiUmCBTs2aVquK/U4YtyXAkpaUBIr?=
 =?us-ascii?Q?BdYHVFvmI62Jn2C9lBoxfR/Jc0VkUI5GuyQGx/2/0PnFcyNpMvB6EksufSlm?=
 =?us-ascii?Q?iGaBSnFdBFwVhRjIKkPLBr0Vr0WvcnveVTCeHkuDn65w6gWTr2OHppZ2r6+0?=
 =?us-ascii?Q?8w+mrzRrtNXlu4LJvkeTeYgrLBOVzi9Er9HotWO1/l4IhlXBpM418TrN6Vx5?=
 =?us-ascii?Q?wD4unS5smOmj6def8sJqqKspiX0YdziiRouFRWlGkpwZdDW92PYh+ab/u6O5?=
 =?us-ascii?Q?wxuxNtNDVA13CrbdnkSbLkMHknFwrq2skTY/x3qn0Y8Plc8ebz0QNTBGp7nK?=
 =?us-ascii?Q?FDLj1tuPKlZn3LYnPQ81YJ8kg07cUGO8afwTl1R1lmkuwdA7eZgxobYpr89H?=
 =?us-ascii?Q?l7QznILYxglLAOMAw4a2tY3lHMls9z/79HZkFL0J4oiS7Lp2vhzqq4GnNs9Y?=
 =?us-ascii?Q?XnB47SBB0VzuZsAS2rvH/Zcw9eQXbZ1Md7v77eOhV7J5/4BdKoNETY3Cn6l0?=
 =?us-ascii?Q?uA9v7dT3k/XMiV54HIDdg6CZFxZv2wO7ZpOpdr7xLjmlv/7TxU4n814hOvRU?=
 =?us-ascii?Q?lazRxJ9U98nQI0Inpg7Gnz98D4W1qTNm6Sku3wI2uwRBPzQh0vAz07forkfV?=
 =?us-ascii?Q?Q+ssdhfMt3iG2y26vOL8kOOaJzz2KLoonqenoItqxyn4CawCuP+8I0hsw4ah?=
 =?us-ascii?Q?9Gvw+1rEelneNIO/oHQ6iHBaNy6/VMiWJoNzuwVb1/6Cw7RtyHvAeo9gmPWC?=
 =?us-ascii?Q?ulcZaYRRWpcg4GgPK3JSCjDKrvlkxE8HgPMpKxCItEpATKj5SunfTes+q8+X?=
 =?us-ascii?Q?Z8mytD6Wi8MV25CGPvK6HH/3Kbnkde1UNlJH315ZGyHj+i2OPczg/D8dfJWF?=
 =?us-ascii?Q?UUkuv67Nd26c5DuCCFanMSqPLgU0yJjjvU2wAsm5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f49381-c2ed-4192-6e3d-08dd8c723887
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:47:16.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEBdkXR0Mew6EwN8NnPMQE6i6yzE51Xa9bySH1mnNUKzisUgex+ZGtPpRA/w2oXaofUHE6Ujko8jGge/tP2LMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

On Wed, Apr 30, 2025 at 05:20:41PM +0800, Xiaolei Wang wrote:
>In the rproc_attach() function, if rproc_handle_resources() returns
>failure, the resources requested in imx_rproc_prepare() should be
>released, since almost the same thing is done in imx_rproc_prepare() and
>rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
>to deal with empty lists so it is better to fix the "goto" statements
>in rproc_attach(). replace the "unprepare_device" goto statement with
>"clean_up_resources" and get rid of the "unprepare_device" label.
>and rproc->clean_table should also be released
>
>Changes in v3:
>    Update patch1, replace the "unprepare_device" goto statement with
>    "clean_up_resources" and get rid of the "unprepare_device" label.
>
>V2:
>    Updated the commit log of these two patches
>    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-2-xiaolei.wang@windriver.com/
>    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-3-xiaolei.wang@windriver.com/
>
>V1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
>    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/
>
>Xiaolei Wang (2):
>  remoteproc: cleanup acquired resources when rproc_handle_resources()
>    fails in rproc_attach()
>  remoteproc: core: release rproc->clean_table after rproc_attach()
>    fails
>
> drivers/remoteproc/remoteproc_core.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Peng Fan <peng.fan@nxp.com>
