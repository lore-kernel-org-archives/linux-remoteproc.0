Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867846BF;
	Wed, 26 Mar 2025 02:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742954617; cv=fail; b=ds9I9nXv+G+mqEvRP3RW/UMwpCGCLH3kcXJvwHRWeB8/uRdK8XCk9orRVI3QVRYdvj8A/w0RT5kapQ6IMFPrQjdZTnySKoCKEV2Co1Sd8z8ogag7Hngt1TVxfpz37PlwbYBaZCRyYogW/rEQs2vlRijNW1SF//ePej5X2bvt+F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742954617; c=relaxed/simple;
	bh=CxDhcO280VUqZSiX9t9tKQrZNRsfZ42QqkoGSs7Okcg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nR9XIYocC7kUHO7j7aFzK16HX0GLCmnJTQiKrPxLe9WO8Wcxbf7Ry74xWuRKd8Es+qWcRFQLjM7XexLX+5/neNygunqOn3PQmKySJBpTCMyc/48Ci2Get7y6v/EvTqs5/RyY1xzU3n+apQoQjhigWN8l79lkJ/eb4Dpw7+vJWAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mTT6fTOY; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mTT6fTOY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxMue/TNn731lEA06Z3LsvbMr193uSSyhHTvdCPKFhc7iq0yTV+FQpzFe0wNrMzXa20VVZy3Jo7ppfSDTfHrbGuAlFUa6xOjSPLNBa3XEdKVz+pMQieZwoKLYkUAbLtBJucMf4j0s48Pz+lKacvJp/0XvCvwzmDWBCIGGW6mTp1jSblFVG+sjAkGLMpEdsgf4+IG2gE+GiDQznNkxa4xvEM9euhZ7pKvwwdoFJt88fG0Y1n6+r2q3BTeYK9O3sDs8+UreZoarhA3gypLUvkkwsYSXifco1O18jpc+80wpDeZG3iy16kaS0qOJ4EQKtneUEyn03p5nZ85OjpIdgGHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ns9THAzNwEoiMFLUvpYRaJVK5Uy/4JQ9bLoxBkFcNoE=;
 b=lNRXI2sgOnyA80RWEi/g68d6YzhQQHk9ZAs0k2eAXVBAy54NGTC29Q5Kj/0IXsvbw3pGPMvsKosx5o2Koan9q/2beI5DzrH4b3sosMdfouWdegYnZUE0Kpt+4L+1aBV8M/ghiAIA2tqYTE5kMe7MNcpVdQ1Kx14rdTWjRpJ55KNpjWNkTBKCv2twzS5rYrszlH1he9uyI85utYQxPVom7zGP7bnOVB/vpGmLQajKT5flG8ibkbdamQMR7DxyQuF19CCKLcm85C+9A0swchtK7medulBcClaST69Vgvy6H7exKYFApluRXe7FEt21NC2xcfway9rvWwYS4H66VPQG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns9THAzNwEoiMFLUvpYRaJVK5Uy/4JQ9bLoxBkFcNoE=;
 b=mTT6fTOYw91Q9D1/nP9w5/Df3rfN6M7HYOcLYv+XmvqYtvggo28EK3csqn7+voiXgNSIWlRbfCl/za0nFefd7vYVE4zMoI17ZMY6L50PAr+X5Ykv9k5z4g2f8bJxedna5j/MFLU1XFG6EqUgnuFyablnP3HMCJDSYuxdGCgSHppO0p69610tGFExpJIvmkuuut3CbDgsAtTtcGYeN9vzEnSHwJ3VeP6+GD4GPERzwuwv5RiPYGriJVsc7xn92nPhPI+RnZMkEW/xjXj+9Rh3CTQOFEtKTfSI/LhRQnGxwuumh4uIjSvQjbsFY6dAmVoZDc76oaR0VsjdCjUrRIe7+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8934.eurprd04.prod.outlook.com (2603:10a6:10:2e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 02:03:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 02:03:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Date: Wed, 26 Mar 2025 10:02:14 +0800
Message-Id: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b899529-dcbf-428c-dd14-08dd6c0a681f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M6cofbm7aDfV9lWNUwuFp9CkKFjxj1BgCZxfH7b0U+Jf+Mx1vp+LGUQOQCZH?=
 =?us-ascii?Q?ki8Yaia5kaG+g9ftIhdtkvANKNItlJ71xfv3/13+QYfgr2i8LPdIQfG/n/he?=
 =?us-ascii?Q?piNU3uI8Dntr93XZ9iIT+aCa+b71fwJNLKovdBYufyv9H7KwpoVpAQMvQ9Sp?=
 =?us-ascii?Q?sEUxWvFPgiK2W4xOVBAJApp8MmfFKWBz9W1y8PRLPj/x55irEIupowRsl5//?=
 =?us-ascii?Q?/kmGJgAl4v05I6NuvtVd6krcigyj47Q5yr7Z/spFhW2tT5gT1Z8tRvLnmYgG?=
 =?us-ascii?Q?RdVjOLhn6iMapShcNw/zT1DTiCEnTFe2OnyRhi1slaalVUwv0M6oYExFNhV2?=
 =?us-ascii?Q?fniD8fJcQ+ytI5ORjDMmegzQ5XPJYGQAcmmU19hppGb9oMTgMMt1vMdyE3me?=
 =?us-ascii?Q?d4hIu2bSUPbTZd8EWAjgDvmnaPOlFZ4g5PArklTqoQoQXJDglWjQ6Q0DE6q3?=
 =?us-ascii?Q?MHI6mHHMq9xcHkQ85oODEZcuiQ8MqxhXZQkIGDZniQm5K3TL2GslyLnb3JtN?=
 =?us-ascii?Q?IKiCEM5TlT0uohW38jqksCLzmI73/9hfS9wiFWC+zYXx2NOQBSrB7dEpoJGw?=
 =?us-ascii?Q?lLi5i/19YnyGGoq27JPUMC3R7NbS2EfRDOrAP0iTfIdJ3QbR09/owhjlAE/b?=
 =?us-ascii?Q?ZbKYbJQK/UZCkGEck2zn/V2PGe1T9XSRiWjgQHmraIuj/Qw2tbUd274aW2pH?=
 =?us-ascii?Q?7JOvjv5HBawCEzXKxMr9xGu5UQn20NRWMKN6TV57Z1QwBMgxEEr3BkU8Z6MI?=
 =?us-ascii?Q?4mO9cDKU77SxSvc+unMRN0u5hbIJfpFCkN8Bpb4yUB+9/1n3dCxx0UNj3YlI?=
 =?us-ascii?Q?KzUnK3fAbr9d2gCDya9ih/cCLDtCr9KWiOuwnCVBt4/XOYltOVfsEz3Ts3Wu?=
 =?us-ascii?Q?aYCe19iD3MmkGrZe3rbMeHzcVvJY+2JK/wbnSEqB2986TT67TPlj+r4OWbGc?=
 =?us-ascii?Q?24cQybgLLLSx+v+muqbCuRdWNSrCuAzrFo9kZfK/UHLhby5rxn5BAfBA1i6L?=
 =?us-ascii?Q?LcU+8rO+/PEh0Ds5px8Q+5l5Lu0heojBMX7AG4RAAmVbfEunL80Bvw/HJRfh?=
 =?us-ascii?Q?BOtGTK0apeUcon9VrZQq/qTCZXH/21MURK2jWn3HZf8dIU1dG5GSrasFOq32?=
 =?us-ascii?Q?e7dlGVr+rZoIOegtPcoGda4I3Ij/thHX8s7Oq1j//b+ozWuCZfC+Y7jovsBV?=
 =?us-ascii?Q?6xtn+WCPH+xhjqfrzvUMfr4iTeXABTSvOFEUNAMJbTICFBcDHEPIHADdzEFv?=
 =?us-ascii?Q?Tkb9feQOw+u8Af+rC4lTlXFzRBVA35ugntQS45gTJow/piqMr0KiejQP1Dol?=
 =?us-ascii?Q?x1cnefKme7MiFed8jBWxmtHjX1iwH2aXcLnGc0EAV9TfzRMXKIdxaMt+jQYN?=
 =?us-ascii?Q?vLuD8r2lvKQQBBpVN2o3x0M/2JWZudf6b2n43EIWNL7bbJbkoPXO2KA04wRx?=
 =?us-ascii?Q?XZY4GqX0YN4NCXmtwAEJ6TVzjF3zw+03?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Me0miDFWVJTbmbFki8W9BqvGk2R8G3ZZe6wB5IhVNmXWvwYO7GxkJz9Z+zTH?=
 =?us-ascii?Q?IgFc8Yrc2/WEtyN7p+V1FQmAZJJ1Bp/NOwAMZp69r/vBF1+737u2eVYWio2c?=
 =?us-ascii?Q?Cn+M2HWI54z6LDwr9EWFQsDif8wjNG45pJ3AlT5nbEJ3qOFlwfGqmWo1BMOX?=
 =?us-ascii?Q?MA7dTc9QMU4Thy8ILNwmV4clJA6IZPQps2CWtcrLKh5LOQgjGEw8PQE3wnq/?=
 =?us-ascii?Q?gcwL+f83+ytXwrcjZ1Z2kt19tsI35+njc51KMsZJ/iMfL0/cWeLntqZgCdjw?=
 =?us-ascii?Q?jmhvjnjmU3miWdKWlLSBFxV7GJwtw9hmBRcn7uNznxiB3I2t8mY4dapblww4?=
 =?us-ascii?Q?fmsJqthJ07Yp7oIoN6ErL2YnApjSR2+9e5AWy/m5hbKKvW6+GsV4Rj0EguBO?=
 =?us-ascii?Q?t3Acj2ckU2Du6InZHj6vRPF0CFclfa1L4Rz1qCgTnvRTPOrYnPDPwPNOr7jk?=
 =?us-ascii?Q?wDjpDR1lFcXUmzC7ls+bZTGkwTbz8Kr3kiF2P642kuICxPYYYz6U4NRqxvJO?=
 =?us-ascii?Q?vw/vjZ8WH2GtIYbfUY06LBTOtt3L/yMM195WB1UJbT6eeNM9lpuHpLKt4JLc?=
 =?us-ascii?Q?8s9+8Zea5HWYIF44nYTOXxbJIWoBGshoJq5zHODcxPDFQrujQ22oATxANtQa?=
 =?us-ascii?Q?z9vSEs5dA6i9FvaP59d5qAH24sxyPWTN+pQz7Y4OnzfDhEPvN2tZGIqRQqLI?=
 =?us-ascii?Q?6LoPUIxaI1hAK/jHMsope0mLrn+PTHjNx4SZoGhb1tj985+trpICQnAz0TcI?=
 =?us-ascii?Q?0S2DQpuPczOjnp+HSxyU+4XLn+uhJ4c5ssskH59uwoHgQdAQ9Y0HVrTpNX+5?=
 =?us-ascii?Q?0VEe5lfCaJ6Gat776Ngz/hH5LpAriIG8cT06KdEb2HQT7Bl9r9/GNtIr3SnO?=
 =?us-ascii?Q?o1nEg3PSp5RlWWQoqdBH/Ls4NiPEc6LSJ1840ZEuLZJwCpVZAPSPwndJrC/K?=
 =?us-ascii?Q?CJcNOylUI/JOpFM1/0+5k82j6SaZWHv+ywE7j06OWEjwZSlc8OfDZA9jZkdN?=
 =?us-ascii?Q?tYUSlsmr52gym4hKzbFi7NAGLKbIbVQYoPyDxeJbhKVW+JyyR8kjBpTtxyGd?=
 =?us-ascii?Q?wXYHdlX1SCy2k/DaVirZ1pmduF81ZUonentuCLa47u5LEmgu1rZNPH1Gch3+?=
 =?us-ascii?Q?sp/OujV3+oALIPtnae6C2T/aVH4Zk0tbTneFERI8YQxnaz3zbqgEQlgteLsT?=
 =?us-ascii?Q?lPQLw7ogmS707Q1W2ZdeBTbU2euPQtQd8Of8miAGtg8ZuoyBYSNZiPtdaBZs?=
 =?us-ascii?Q?wfk3euj96Q4srUHHa0KuYvbOmiFhqY9j/xegjTlEUNQfMRn81mmFj8TfZ4v0?=
 =?us-ascii?Q?dt8zmOC5RgKixHZWD30vD4/LSqAj6BqI7zTdUrHppmY0fkOOGOIxknsKvy2k?=
 =?us-ascii?Q?oX6HSa6X10/zlwtd1mmIKL6RNTBZTzUOSFCJzldJaCMKpY06GG7osb13ryo8?=
 =?us-ascii?Q?I6jRQPUtUxWp0gQ0OfGwt+0oIrHN8lQEGDqMrjPbhtflbudZNAqT5U8iBD6t?=
 =?us-ascii?Q?CVDr79zEkfqAuu00FELuW/Hmq/4oXYRhwfCdFj0YBUbOFM3SvNkGbePI9y10?=
 =?us-ascii?Q?KINtZizQD61xgTRYiuBAt16hotuIqAoEptZR0za/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b899529-dcbf-428c-dd14-08dd6c0a681f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 02:03:31.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DY2aQXaiteW7wYTmR7ALemKPxKOUkP1RzlOVcZ2h9SH/8gFxoGFMNyWGnqngrDm3UhRHSD4nS0gjqcARax19BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8934

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

While at here, also clear rproc->table_sz when rproc_fw_boot and
rproc_detach.

Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud

 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c2cf0d277729..1efa53d4e0c3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
 unprepare_rproc:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
@@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.37.1

