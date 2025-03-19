Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012065.outbound.protection.outlook.com [52.101.71.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC68F5A;
	Wed, 19 Mar 2025 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378553; cv=fail; b=EO21GzWfMp9BbiNKYuZBG1yS0lTkh/kWDZ2OH+f8uKKBbYkUmiVmCZlh7yaTe4yE+9UdLFr3yXBVXK6YlA89Sfo+faBRL/nR6xgeLMRXVMoI3MKGhcsG9i+Ou1bzIFDls3hojfwdVrWx9s1vUE/s0lw6z1iXU/gwW6LGM8a/9/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378553; c=relaxed/simple;
	bh=AEVp2kdZkl835ffzJtgA+jFp7drRsHAmE9pD/Bl0YK4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=swOyAIcq+ODz1MtH8pK6v0g7ew7VrFiAUMXGabqSeutLyNjlpOu3HB22F6xB6IcQB4hFDwkUfZlm1zFSGh/ZXZWPcUAN+3DkGo22WtIE9kKdSSzBK156Kzk+3BZafaaylndQMq/DDxxmWIRo3l7PXGlLhNXqc90IpkmzlyR99GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rbmlzk+l; arc=fail smtp.client-ip=52.101.71.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rbmlzk+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWyZReqGfGbqxBcTUOCTET3U1gbkH0wL/DTbHhrfUCljohlSs9cmsjJ7ntbLhBe1kinxkKnvy+pWuDuxy0BxsJNAIABlZcA3VbJzkdnDvq+UhrOhTGX91wcalq5KziTP875PyIp7T0AGOUpOCrn57g6nRTvFXSvsoim2zoqKzIYXM5lhjjc5HBNOCppEXxvVxrKR3uNRrhDm/Db2wobtCSOyhznl2do8Q4a8hLbi0TLHH1YHCUadx8CFp6ZkB6njafXm9isMn9Oj9axo5dj02PmxKoBpHK/JMwXSRwHCrrr6MFggazrm79yuoaBuFslaxIHL2XnHpGzo3gMnImOsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKm9HwM9kw/YtkXOWUyl9yRv6vdUHxtTXYjoO8f6qvs=;
 b=pid2BBiGHfN0Nzua6IXpiN0ofF/Lo8U7JsUy+xMwL1S/OLG5imnPoneaAcP2mZUJq3jcDFK6uyjHkzDvd2+BQlWzuQj4UnlXXHHkVs5yewXWAF0Eft9HMy8Jo/77z3pnogUNSRSTxCk26tZLUpuKQvIR2bknVYtfUhQQ7T+8nQgsN9Kb4p97ND7GxlETB8nSNkNPDxFUqJMYIEz7KsWPcTBIxfFmkAnBYNXqk+Y+aq/PVypQcc2Ue+98uIhCZMYgu6XCiaU2S+ufHeeG09Vf84atjqmWKo/Fi75jrgeXPSohooxu4RnDm/7RiCjP8OIWdK9mPVgY8D5UXBbQ8XuLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKm9HwM9kw/YtkXOWUyl9yRv6vdUHxtTXYjoO8f6qvs=;
 b=Rbmlzk+lPoNH/fUAPEikUqRWDxzSjKgxR2yqQIGrQsv5uIp4rbs+AgBf1B5pUMfEK+sAUMy1S4chUOIQhKkXgbPTJ0p19cGy9GYVx3CWz0E8QoV9q3aIsgQ0/r5hvO8jXNzQb919iHL3LWHEzsOrB8LRsA9kEMa/yRg9PfEjFIjCKYwn80AxK4X7+Diaj0Vwy8p+rz8qG9j3Rqn/qFQ8ZY70cNAuoscwQUBvlOO0wSybTzSHVL1f3C5oZvo3wE34LFr9bHFuSrya7/u6/Thd0KEbB5SeSFxbMa0/Z/8RyPRSEWpuTKMadsUVsmcPArJjhfeWRpDxD0wJjl5LR4n8IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7414.eurprd04.prod.outlook.com (2603:10a6:10:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 10:02:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 10:02:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: ping.bai@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] remoteproc: core: Clear table_sz when rproc_shutdown
Date: Wed, 19 Mar 2025 18:01:05 +0800
Message-Id: <20250319100106.3622619-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 425a3385-42a9-4278-9576-08dd66cd26d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6ATUh2DQfKiz9Cng0U3ddoTT7c8Li0zGRVXJsRFX4fXyx7Z41vgYbjx1BVU?=
 =?us-ascii?Q?vg8MABc0anQzv65W8cachxG+Z8iRKkaegH9jLX/V4GVQ6Z25EUhx/1b4RJ7A?=
 =?us-ascii?Q?2CNCx34TjffD4ni86r6n+pKyhx/EBRJtivMuOKI9dZ5fwdc5/Pb6vbPD/H72?=
 =?us-ascii?Q?YS9orju+Yt9MeGmqJiyVhVnc0N8QFOE0Rqc40SdgJO7hOuy1USggLHXGRx9i?=
 =?us-ascii?Q?xfN8g208hXKPtew+XOO8qaVC1CTdZvzbngS5xBwHkHy6RyXwgiD23YiP6sS0?=
 =?us-ascii?Q?TgJrPp/ZpV78Ik7AsQYuFWXW5LuiOJ7uWMHMcv7I8YgonsO2BuFkyseYFWnb?=
 =?us-ascii?Q?CAY4VaDnpG8/sbcXokGCwJ90Cpaif5oRImyCadwJr02vZnyWQ809Gt54ZSyy?=
 =?us-ascii?Q?dlPgQV7+LNJ7IyzaeFJBCyQYPvsgYX1+irloQymeSzpTxAOnfR+9iK//sBPn?=
 =?us-ascii?Q?wYRaJhrBVZr49Ss09gs6m2ZFDdTCNoyieW6jJ8qGgbdzOdVx4Fz0GeYdeYBQ?=
 =?us-ascii?Q?2BV+I9ucsGPeCOiX74tO1IGXXGm+bHu/kHu1AazvGARkqEye3ScKrBXvJQ1J?=
 =?us-ascii?Q?H+RwO5tq7Ek66odPpSb1t6b/GmIIrhwHX1ffEToCMzv9H2fz2Ccx79zSOpyq?=
 =?us-ascii?Q?I/egbn0X2NOq+4rU7aTezVG5SQWmBXQ9jMwXxe1q6irR9g/xQO+DP14K7TRo?=
 =?us-ascii?Q?BWJT/Wrm9UISIMy7bBK3/lF8b1P7YuiE9ItjNk+NogA/bf2ilx5NYFI/WkgJ?=
 =?us-ascii?Q?6f7Jzovgb2sDgM4CFuI2iJafsc8AjpSISQj90ilTbU/ZRf6LCP6b0nMfHrY/?=
 =?us-ascii?Q?QrIUwDuDPZ2ZfvyA8e8hz5BSJ8pdH1IdBi0oD5Q7NNXa2a/+1IwkH0PBgmDz?=
 =?us-ascii?Q?v0fO0oNvg0WrLavUeLARZhMucukQn/sqROjMPEcOfXfQoooHAuiWONsAl1iE?=
 =?us-ascii?Q?PemJXnUQ/V7GI812pzYXafK5I2Q5dAgTkH5WDZ3Z4ADNLljN0MrEqXtQSuXG?=
 =?us-ascii?Q?XPNKvCHZWWLQ1yciElRblX5LfPeBxiwaboNUolCNR8GaMet+Ks/hGbWKFCGl?=
 =?us-ascii?Q?SwzMw3ryFyaUOIE/Eu3sBcuFfiU0fiSqAhzUzoWKATCdHrZMxlG4H3ba7xci?=
 =?us-ascii?Q?mIAjqRGK9OAOh/rcyw4hlJ1LOBLxjexAYhNr05n3bXzCs8wDhgEV3CBqcTvx?=
 =?us-ascii?Q?nnp5uGVvUpQ1vxIe3cLUs0Y/aIvM01iw8YljqCo74zBEJ2TK9GuC1QkKlG4x?=
 =?us-ascii?Q?RgNvWbTKh0tVKf9oB68aN80a084yix4kpZO0sbBvnCqL3rgVfuaW+IAbmzsS?=
 =?us-ascii?Q?mpUjF72HraOqbu03/c9/Vunx534PJ8zBH92c872ewRWeWi5vsd1DAQvUSsYH?=
 =?us-ascii?Q?gRSY6xxwCFBiFq588xOlwrG6n96O1O+IxRuftInGIAgfLX/j9y+7Qr4jT8QW?=
 =?us-ascii?Q?KhtNx+o/LHNMlF/euTVLnGnkXoanHXyF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kL81ySCEa7Ih+NwBKJ+vfDu/ai+xmug8iHjxljdCJa9wi4i8A0SmW4y6maX7?=
 =?us-ascii?Q?yq1312DjhB0M7l2L+z5t/Mto3BcX7YnSflm2gZ3U4XqLTZrtJi3tpEovCqvL?=
 =?us-ascii?Q?S5XkrhRxHorGZO1h2QTLXTmnNKj68+8lZeqZOt2kj7rBXx4JsaF1N1Bn0RCO?=
 =?us-ascii?Q?HuabBdEz48gyKU0+3LZnkI3QyrBuwtc2ytGW/Csp1vBKjuPAboqtAWLtkr2m?=
 =?us-ascii?Q?4di/673/c3328n15rdtxKhRX2pca3JYRjh0swYsDw3ZgdJqFOqcmubYnxcu5?=
 =?us-ascii?Q?UYpwJGftbRbDW3iL7+ZRwK57mRL0LwNmHbTPvwSewXWb7G+J/6Nidp7kY8T0?=
 =?us-ascii?Q?PCyIfD+Suz7LOOtE99XomOf688cBxe84EdB+jyu9ZSq9MolW35Nz9Hl9Be/O?=
 =?us-ascii?Q?RukUUXvor0Pxp2hw/WM790J/61Ggldezx1ppNw7LF0fhfWdaAlMWXFnq/fnf?=
 =?us-ascii?Q?sUNbmdNQs12qPqRT6d9YjgepCn59zsdpB6nC4mhWvbtF4Bjj4avaBW6oQ2yq?=
 =?us-ascii?Q?WxLcC91Rb6cTuQN8vWl1+WCnBULoOOmSm6jI8YyPkukQW0VH8cK6j+d8HiIy?=
 =?us-ascii?Q?6tasjorY9p9vRekqeZ6ishaonOv3Qgiq/AZ/6ODtc5JzosRxSTSuiO4Q6iDs?=
 =?us-ascii?Q?2afw/cYPRARu7nLytTBK/LpTJ6hKXOkikgihP6mmsW5KJ5vfVxgAOqV/z2Ue?=
 =?us-ascii?Q?rB9EXsi7RTqNUFX4/KNXnoepIV638EWClP1VJvSwtZCfu4XybRt4z8/vlts6?=
 =?us-ascii?Q?VetlCSHloaASy7BFsZBZs8BSeyTFs8KdrSBWRqOcYmazis5jI2xqelcRWGpT?=
 =?us-ascii?Q?HNuNMfgvKtCA1E/vGCtoxtPywCIGhd4xvj1cEsSF0CM+BALygXfZH+/KDQHu?=
 =?us-ascii?Q?bk7o4kfdK8+XWQkkZ+fQFqcF38mmNg/GyKA2DTHNrMWkFhLRAZrL/HMqXDaI?=
 =?us-ascii?Q?Mfe6Flw/ryu7a1C5WVwEfyVwvzh0A6CnvHfgcgpa4wsBxpZ24Um/OyZ4/gtp?=
 =?us-ascii?Q?pUbCLV5JsJCfWWQKrqM5l58UkqfmcSpUtnhxpY2V39e9y+UmV06rnKmYwpRR?=
 =?us-ascii?Q?2+2OQnJ111OCX6hclO38dCI0joOzG1PRcdSKRkMDKaSgUXZ3VWvwSOs2wItC?=
 =?us-ascii?Q?g0H8ZGKCBj/Ur5GksqzgCg41TgNsmQ1hbhUYJO9GTirto67ay3qeUF6wQpBJ?=
 =?us-ascii?Q?UFuphqptMr25kjhbiSRgKyxcfOj1TfzZj+mS/ES1F5wPiR8oTFkl8eA7Wnm9?=
 =?us-ascii?Q?R9wAeU9w+z+ypP10gmtJ2uokXiEfIQL3XHwQmaMwsbW9kGF+Ap4cMrvAPyPA?=
 =?us-ascii?Q?6dsKBgOln8JlV482Nvby12L9HmWCtjI2WDuvl3Qp+/VHhlqUTEB3f17cVNnI?=
 =?us-ascii?Q?t5qNoBVXgBb7eUCjwDHQ6T4v+xec8Ad0aCiomNRfhmMZkKz8SV/j+yrXk9He?=
 =?us-ascii?Q?FUnqCSFlTpFjjax/gCWUn5d5g93QBFZoEtzWCaqwgPEw7fjzj6624HgdgzXG?=
 =?us-ascii?Q?4KvqLC71b2r3Zyp6arZJJj31ZbDhIi/eCQLaZ+uAXnqJuEvniFHx8OwoNlLa?=
 =?us-ascii?Q?LOhzgJN/QB9Y2muuW1WZOIXo3eyq9t2x4TtwtP/D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425a3385-42a9-4278-9576-08dd66cd26d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 10:02:26.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdQYCfmOTLLC2TnvokBBiBOHETMy/TsftuUC+eX4XC2kS8WcpXnIiEwLlYgwqq0bjHoonutg9mWQHC6KYdWkew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7414

From: Peng Fan <peng.fan@nxp.com>

There is case as below could trigger kernel dump:
Use U-Boot to start remote processor(rproc) with resource table
published to a fixed address by rproc. After Kernel boots up,
stop the rproc, load a new firmware which doesn't have resource table
,and start rproc.

When starting rproc with a firmware not have resource table,
`memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
trigger dump, because rproc->cache_table is set to NULL during the last
stop operation, but rproc->table_sz is still valid.

This issue is found on i.MX8MP and i.MX9.

Dump as below:
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
[0000000000000000] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
Hardware name: NXP i.MX8MPlus EVK board (DT)
pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __pi_memcpy_generic+0x110/0x22c
lr : rproc_start+0x88/0x1e0
Call trace:
 __pi_memcpy_generic+0x110/0x22c (P)
 rproc_boot+0x198/0x57c
 state_store+0x40/0x104
 dev_attr_store+0x18/0x2c
 sysfs_kf_write+0x7c/0x94
 kernfs_fop_write_iter+0x120/0x1cc
 vfs_write+0x240/0x378
 ksys_write+0x70/0x108
 __arm64_sys_write+0x1c/0x28
 invoke_syscall+0x48/0x10c
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x30/0xcc
 el0t_64_sync_handler+0x10c/0x138
 el0t_64_sync+0x198/0x19c

Clear rproc->table_sz to address the issue.

Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 There is the other fix that I could do is to clear rproc->table_sz
 in imx_rproc_parse_fw, but I think this issue should be common to others.
 So do this change in rproc_shutdown. Since it is in rproc_shutdown,
 clearing table_sz should not incur new issues.

 The kernel dump is found by Jacky Bai in NXP internal test, so not add
 tag in public list here. Jacky, feel free to send a Reported-by in community.

 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c2cf0d277729..b21eedefff87 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2025,6 +2025,7 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.37.1

