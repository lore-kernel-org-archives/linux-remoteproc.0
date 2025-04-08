Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4D1DD526;
	Tue,  8 Apr 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124552; cv=fail; b=dAVpzNVPKYpna18dCaE40vrnLwDVAJ061ZDpVnNR16lp41iwZYFeBKhkCFFyrYx5JeuzSAAHcdjSlxZitgT7ap0MEV1eSDlMb8D9VAMe3EC4z4jQeZe/7v7LeveK5bAv8fkz6IZQ3K9ohhoGUSqZiWp0kC3pjXO8gJjU0rHTG1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124552; c=relaxed/simple;
	bh=vDNZJfmmsuz5pQSt9CUv+a1fYcvssb5KF/zAI528w7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hb1XTvipysDZTuBUzdNVZUgvrVG6nGpWfqW5stCnjNcd1YCobYscbMzeOLP7nghn6ER9NUk6QSZVh5W0Km3TKecewnze+STOmc4FxkXJVCAXsoenasH2w0/5yGjn9cqLiWfuagYbJVO0pldmAAr/aEdvZKv8JqFoeFzGD97Fzk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fCKOU+Wc; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fCKOU+Wc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T25Wjqy/WQZLVceum8kArbvlY94SIOIJYKjGzWcTBTV4iMASscH8baQN+mXj9MBcqrV4Dr1kQ6sTE5u/pZOnKknRXSQnigam2AzFqWbJEIwOV1UlF3/AHtv/CNLBW1PjoIHYMBVOirklxs23wmjasSUtQviMjm0Gvex9NVTYwzEFVmEI3LiQ7Uer0pjgdt+/I/H1Zh2ysfZMUosk8Iyx+yEUpFjXarPITI4W06pAYH/uAfbLpLyx0UM7BBrwY7zKUeSxGJYjj+yRmp0mPUxAwA6Oy2xtso4TRGBI7tTDwxChAFZoJRstKtFKRE3fB9CHVjiJ/cacMc4SysxpGq/sdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc9PwlcQkpyxqKZ99COoYBWXghAzU5tp/WFj8IwKwgA=;
 b=LREH/ToGg264w/mC0scwvvzb9QVGNSCol/U2ywvIISWF6/m6dDSpXKIftboJtDhyLXjYOisUgrgx1zXoUJRazyQxmLpgMR7CX5sB0SjJjB6X1vOgq0EYYjiJ2p4I6LZ3BkX2/cO4SkaOPG1m8JHa7M6UT39Oi/Xn3eJcBXhtM619lM20FvHebBWJcdTkDjulIujkXVY+V7iKf/kpCd2NUnax7NdpDPm+5tR+9z/oWbzQcV/a2QkaFv0ZWSsYw1sBsrVo7j580+D9R/N/W5B1dFrvQec3I10o4sZy+TWOyzKSKck+8BZsztwd5lbc3o/9ZRPQb1Llo/u6UTy83TMHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wc9PwlcQkpyxqKZ99COoYBWXghAzU5tp/WFj8IwKwgA=;
 b=fCKOU+WcDGFYQhdq7ZbIupQpsr6BrIs5P982JsMnXb5o/aH5wjm0zJfZAy0qLLumEYwUqw7hA9DEaypCjRrQyb6XJUfXFe9F3xiVY+gWB/tYQRb9GsyTkWw8rZZ2YYsUqhHlJeB0Y/Q68xBtvLJwyUV3EmyXhk+ZzUWgTWobM/7ZdUPwjJFTuguFa9m+3786ShjIW0ur1BQPyP03yo4fa8yv8CQL6dGrHS6o0YJJrF89pZgj0FLhSnRe21OaUduQSbCzzo/CFxLL5QTv9w9kK5hAmGWg02RizdQuOMV4NTWcQaXFo1IQ/p/DOfj3nx/sb1E77E6o8aUWHOwHcmfmVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10479.eurprd04.prod.outlook.com (2603:10a6:150:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 15:02:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:02:26 +0000
Date: Wed, 9 Apr 2025 00:10:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250408161054.GC31497@nxa18884-linux>
References: <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
 <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
 <20250403143239.GA22779@nxa18884-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403143239.GA22779@nxa18884-linux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0b850d-e73a-4672-5be9-08dd76ae5fd3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72/WTLSr7TFTP+aefNfugoJaV6taT4mW7Q6BarEq7ArdAVj7N0jpdH2y+Df9?=
 =?us-ascii?Q?WKLirfxNHm07+ZuagswPE8yCpAamHTDzHJUzdhgNGyEnyXIhjjB+Wp6MfaCD?=
 =?us-ascii?Q?kEk1qntfE62PpCfQ4wZ949jlM2VDb95ILZ7hRajipdc+tmSwU073wL9QnAPJ?=
 =?us-ascii?Q?+t6WeNTV2nVMu/N2Hud6Bq+yuC414tMimOSyU1VJ7qBVylmhjHusIXiu7j3E?=
 =?us-ascii?Q?QoolHzWGIiGUfvuuOrLTjFsKdueCrVeR5zthpuPz/o/yDD9ZXrv3XpDbHR3t?=
 =?us-ascii?Q?BDVb3YJD9XCszjg0f3VWHDrB0Om+BzOrzhOoxsZMdBxxRG7tYMkWTTnarVbu?=
 =?us-ascii?Q?GVLMv7V01gM4yzuqlHpDRWDWA/feI6MmMOJX7ztysIvtRuJ2ywbdHZWJyxCI?=
 =?us-ascii?Q?n2MgriLTitEFG1rGpUl4t1FC8Vfc42yinUiingkz+R7XgWLceeUoiHsEXGgg?=
 =?us-ascii?Q?FCsPfuigdsxPYI7Q1ew6LngC1PSKWSuB8ReqNcnCJGohAKkiT9cAbupfRrVd?=
 =?us-ascii?Q?VgPCwkRPTP4RwH7YK35kqV8prDLrE+8nfw6RbcpJzYwGwhNQqDMh9RmOd/Eq?=
 =?us-ascii?Q?lAjRePi30oh43ZR7qgSXfHgnpWJA5PyL4kL/T8oBSBfxq9MaYpSdnkT5qlh/?=
 =?us-ascii?Q?aDpEgKlEdURPVYylCAe5DBNcSprPawz0OMfOBP2f6GGO3PA/iChRJMx8VxKw?=
 =?us-ascii?Q?3oiSC4Ze8B21Z4DlipY0EdOn4vPsISN83BVLNu4okWwALzyaXo7mw0h6yXVY?=
 =?us-ascii?Q?lMlpVVqkYRnm64hhBWbObBS1/weC8b6lOWRTBYaPeZMoZP/EKaIRaGGCnVw1?=
 =?us-ascii?Q?Tp35EDWc0bsZfrsUXZ1ip4yVuuAcWiz5GxQJYM1kTsnCteqHW2OPMcdpCbRJ?=
 =?us-ascii?Q?wKrUcpGV8gnCn2Tn8hLOv9xwACueusMHMPPIoUNILlH8BrwkNTXDtnu2ZErH?=
 =?us-ascii?Q?eZNClW4j9s3S4hKiIOLUg6qDyjCYoyvcdXHtErn8HeTFAA/5ElaS2oyNxJXq?=
 =?us-ascii?Q?3+AJduvAUYSaEf++csV2GRbiaT0irS8fsvAczxiSLvViEGbC2P0rMqlWajp3?=
 =?us-ascii?Q?Lwbzx7v8jSXcBVQxQ2qqA3ft8f7273991QX1qUSWySaZaaUJTI1FfporaXKG?=
 =?us-ascii?Q?gD51To85hN0i8C8ZUajkEtI6n/yMP5jAnWpwYG3ifGP5Tgoa1L6L7l2Wn7c+?=
 =?us-ascii?Q?gpcggNsBWlSXHh1BR5xaYBmfaaHb/J5bC/9et6UDqW887Zd7GwceTvZFNFR0?=
 =?us-ascii?Q?b+PLBkgesKo/4q7QEpD4MVEtBVl56R34Bpf94b7Wtz2m/Oe4G6YZbp2hj+v/?=
 =?us-ascii?Q?NH5NbfLQYrkQ+4kseODgKwx10K3nKmmGBIOW4R1fEGFO4a29/m3BWAnHnvAA?=
 =?us-ascii?Q?8alYcice4qwZFktg+JmscnUrcJnqLGO2EZwIp9r6Zjyo9AZU9odyFaZyv5JP?=
 =?us-ascii?Q?SzTMlGigl3olJ0I2ZsChXgdVRE2t/3cI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sG3ImwN3ntFiwGeOqz18hFGhXaXim8mdIi/jhEX2rq8YmoV1/Ru8aycDR3EO?=
 =?us-ascii?Q?wfOumal2UBE0KUEoQ9lXV2evPuZlo68DeJQ0Os6V8m7hwbHZwpvZ4P3NdyWT?=
 =?us-ascii?Q?+dkmFgkBqN6pH63hmOQL+m0Z1cFH9WlnHTB0VFrEl3DrRi5a0w+t7dGoOTMF?=
 =?us-ascii?Q?3M9QwpqEa1vf8oreLCtk60Kw1mltgOwwfoHwS85WpLZHy7Ti3D7F2jskV8ew?=
 =?us-ascii?Q?Nt8Xc7DuOMW0CBa9NkXL86Bd6iv5kE10Xc/sC1zuIDOiViA1TV56xPI0NJU5?=
 =?us-ascii?Q?hn6d3bdEduY+yOFN85TYY5m1iN6XN1OUIA1sOEv1hpA66mI+FR3jWZKSlCNK?=
 =?us-ascii?Q?URNA7FgE6B3NQ5NJ92qrXP8F+yFYWsXe/W52u4UIfgU5w5+9JjdIfa5xroIl?=
 =?us-ascii?Q?FTbiLMeJk7LK5SI0L8ci4DwXGg9CNuKcpMo5WexkMnaS86H7ndNj7XbcsSov?=
 =?us-ascii?Q?zS2obm4cNvpK3oJ3n2yLT0R9O/f26uyoXiBokgcFDiXFMA18MkAxQcm2qdGn?=
 =?us-ascii?Q?B1G6nNL+K8YZZzIohqkztzL4T3eams6b1vI/m6FoMZw2UN4YQ1qRJnhHeAlw?=
 =?us-ascii?Q?QL388bqiayfQ6SXfIkHKEny0BBWLKRjynhcIHnlF+UHhRAOGmmUw91cj/FB5?=
 =?us-ascii?Q?WZKgWzhXCSHOeyZqWKB1r78nOA2Rs8Xz3BSs1G7DDFn+dWMPaZEcLD3FrT+i?=
 =?us-ascii?Q?UAKQh5QkeZfXIo5hFSAS8/bJXWMesXCk/sMv1BVacubuls4Vdu/Gz0KfaqsU?=
 =?us-ascii?Q?4rnsDxPpYwFJ8z+DNKT2mkD82Cl4wRV8eqYJHNcH5zLDyg0NcAAHMkMHdDC3?=
 =?us-ascii?Q?Xd0b5W2SRnx3pANWBejpiiqmJy605W2rbXyAWJvb89aiu528n+inkhb2LTQQ?=
 =?us-ascii?Q?Bj6QMuQ8pD/BCZftk0IT0sYgz4A8szkrM+nt+X+rH/ULB77qsfqfroujbN2y?=
 =?us-ascii?Q?KR07M3zrXIzn3SApxa5pVXGCVWxicIQdb1X92kkKDRA9ulbEDB7vNrXOgPt8?=
 =?us-ascii?Q?sXuoHlCiQ+28p7aEuuGradw8xiy+P3t6Sx8c5EkJCDMg02eclVJ0GPs8pqSv?=
 =?us-ascii?Q?SYAoD6rqG4pPkVW+f0JSBW7fwmOZx22uWRpcvnzyE/s7S0OMpXQ9TGy0S4uy?=
 =?us-ascii?Q?PwIkj7qOcjD9j2ozapbmk1+wxxomPOJwmbPwU7PPU6oyHw1u0v/lQV1RxrMx?=
 =?us-ascii?Q?CAwCT1vD8wOYscaQdOaFam9axpeVkx7SxX9azfh+Em0jgoA9Q5+gJlHvo5N6?=
 =?us-ascii?Q?uwDSwE6mDkFByxFAi/+IQFcZKHJDXFN+Mhxeojj2/vpgGr+fJxIAafOSWXYA?=
 =?us-ascii?Q?iyR3lcRiECTQhG8dWa/esbEgzGDqHg8luvlS7ncWW3lKY8aasf1wW2cozaFt?=
 =?us-ascii?Q?i3lmKNXJTmtkk5b5I2dz52UWpEe2x8Wty87l9bvYKKdlShNYG6NmngXMJbr0?=
 =?us-ascii?Q?OfCHXMvGZ81rI0xKVjOGNAI+zh0RLhpvZzI42Z6wkz0HwmhrnapXrDIn769P?=
 =?us-ascii?Q?4uX8H0w2FMVpI1NSB6pTZn1Kqq18xXBHCT8XkLU6rfDuYjdd5irxjxGBejMJ?=
 =?us-ascii?Q?/b5oW1xeFo7Kkeh1o+oyPpUij604jtUHxB8/cTvG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0b850d-e73a-4672-5be9-08dd76ae5fd3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:02:26.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HI2PSO59Ix5ImtFFysCG9/MzflIUzdelqlaYhq1XOL3h+Ea0t+9mDhGqfwrjuAwLvALVzzGF++LatIihxhkLww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10479

On Thu, Apr 03, 2025 at 10:32:39PM +0800, Peng Fan wrote:
>Hi Bjorn,
>
>
>Thanks for replying this thread.
>
>On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
>>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
>>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
>>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
>>...
>>> >
>>> >The core is already checking if @loaded_table is valid in rproc_start(), why
>>> >can't that be used instead of adding yet another check?
>>> 
>>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
>>> could benifit others in case other platforms meet similar issue in future.
>>> 
>>
>>I like the general idea of keeping things clean and avoid leaving stale
>>data behind.
>>
>>But clearing table_sz during stop in order to hide the fact that the
>>future table_ptr will contain valid data that shouldn't be used, that's
>>just a bug waiting to show up again in the future.
>
>Agree.
>
>Do you need me to post a fix for
>commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
>by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?
>
>To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
>could be dropped.
>
>But anyway, if you prefer a follow up fix, please let me know, I
>could post a patch.

Hi Bjorn, Mathieu,

 I will wait for one more week to see if any concerns or questions.
 Please raise if you have.

 If no, I suppose this thread is done and I will start my other work
 regarding rproc.

Thanks,
Peng

>
>Thanks,
>Peng
>
>>
>>Regards,
>>Bjorn
>>
>
