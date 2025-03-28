Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328E2F30;
	Fri, 28 Mar 2025 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743133333; cv=fail; b=JsIGpfNwoPtAM6oDQ3g5oyZJ681Wp7QDxW01i9f39dv3hc8cZ8XlJEKSFcVTEZrNAKBmk5xQlMhkT5UxtKRN/JfxleRDepdcqvyEu1VgtVMrKmCacYdsO2R+ZWRMmJz3ER88a0kGX2wCV1iaepBv3YmJ+khxZrUtJrZCBLP4HzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743133333; c=relaxed/simple;
	bh=OXZzDFFvJUEjI8NPXAdb/2amfql1Nw51V+iMO54H4kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qmC+x2fRNcS8QZI9h9P4A7z+mIGjCb37punytLB8pBtyLA7tH6zF5E//5/Uk+lGMZGvOhglr8/ASM5X7KLfAYv+1YTl6Oe8Pro4MPlEWk6YlTkl/KaUpfFi5Uqs+vVqWtS3N+IHU5N7vkptwbPfAFgsxiw3TzOLEDA3X6VN1gow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dYZj9Lqt; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dYZj9Lqt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoA98oRtbtamXyF/GhfcL+wRYxgGtm5KntUBgcmfol5/64fe5o/LDxRUiebkpprVGc9z2lEomNi6yT7uUS/v5fXxoydvSJwSM1AAK7vWQgDsTNwGaMqIllWvQGSjVDCiOne5w/omUte55uN2xgy2V9aK6/Zy3iKDpCIg+TvxmeUj7jEEi3UodrnaI9hElcuM9L7+jvRXAjGx2Kt8/oLupYtTEhBl6/ZD+4WIrUYVMEAp9omfsA5sG4LKPNkIy/ekTHv8i0cKD4EkH7xRjzuaqaKCAujRKoq//xNyR2v4ITRYkFexSrhNABEn1D/gm4FsWQdP5jbQwh0nqIEx+UaQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzDRoPpeWZdl2C+hWIzgc/XKhq2YJkLDUGkpjxYwxNY=;
 b=VX7m8e3V1lYsp7z6a6h93W095GcXjQlh9LOsPOh7v986a6DHQWBijQLJAOvyVVnmjYQbRrRkRvvAHzktGFgwzadNSYf6GcZsgAmZYcP4VCt3A7RWE+WeEEamW2BW3eqsLCd7SRy2wBxqBpF1piayeKy4cke6UcgIBFaoxtW3z+St89fdTE6+7nnYHCzKsfMp9RELKt2jsS2PAnztwd3Q6Pr9BbKHSouzXiPfviHwUfXrz+D15QecHUuGTTLOtoUPeCXKMiEpPgWZyKhd0qyKTOOezfSEWP+DnNe31nR4ykO8B+46DDC+1pJ6KJI+LxoHpm8swzIZD6T07szE850fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzDRoPpeWZdl2C+hWIzgc/XKhq2YJkLDUGkpjxYwxNY=;
 b=dYZj9LqtF05Td10VYYRB8LKaKdQuszbUClPd2tciSsPni/71zvySlqRTLVpyy6Na7fP/ITxGm7zRYQglyAZpFy8bFK1vpS8QmU17ABMva55bDhUSmRkQbYMrdEGVvSf16emZ9s3m6fk9Sy9T9Bo4FFjr/pUaCHamht4B3o3StmL8yfSu8kXyAq68vr+tfTz8IUQ8IObAmffO0cCqYvbTbG8P2zTuXlTgTWjBWg6R7gyrz/9kxq4E+ynvSOmuqMcecAHXe5CoDDuT+AcHKFbgD6Fh5q8KColeEv+ElDEsc7hBfEKdg1FZ49MA/nXhEXeZhK8B+zDHd6RNm0LU2MSPAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7418.eurprd04.prod.outlook.com (2603:10a6:102:8b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:42:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Fri, 28 Mar 2025
 03:42:05 +0000
Date: Fri, 28 Mar 2025 12:50:12 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250328045012.GA16723@nxa18884-linux>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-WO-fhDJKyG7hn2@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: abafcf1d-0830-44a1-d8bb-08dd6daa8257
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1riKaxxPbWVnMXVwlZgrpeK+HBTPftTUVA+ArDAxzFHrBcoKu7B4jqXordNl?=
 =?us-ascii?Q?W5BTeXwTq35nD032uoGD7rYyiGwcqBSQjLDI/UJ3ygN1pDZrLTnUuAyOaFHD?=
 =?us-ascii?Q?PB0G7cAujzngVNLhkWJ/9QMJXrG/bBk8U+BxgSOp6ns6/SbuFAJ6iudbr8hy?=
 =?us-ascii?Q?5FaQ1PW5qyd0gQ6uSavR47ehKfEUUf07HpEP1tlzW+GZkQ9+jITrGDsHXh18?=
 =?us-ascii?Q?WVB/C36rMIGHRCZc2Zj+MrHPFtDbmQiIvU9T6KCzpawCACWqxGgVx2cgrHVA?=
 =?us-ascii?Q?208Y2+/8MIEl45+u7y+nXx67KVvmEGZMPimQhg3++d7nA4pOqhuI0PIUqBYC?=
 =?us-ascii?Q?EITqzQq5W+dZhnVl5Uq/lHaGpnLlxb0bo05kLfGdIDq2+xIBEws8U7OtibER?=
 =?us-ascii?Q?3vWwKH/3s+aYljWqQEN7lyCvRI+3sR7EU2fiKT1+RFKRZuxTAEgGOrN/I+87?=
 =?us-ascii?Q?ubrd+lll26nIEZL8KAq0Puh/OfO10PuuTCs6/K3Ntq/zWFUYeixSkCcKovpf?=
 =?us-ascii?Q?wvpfzV9kM7slru5fEbh3teun5fbDV7Uw6jwYtaSyladu9f9ztFIsnDtO5qVY?=
 =?us-ascii?Q?D78hw0xtS6sp3sA9/hxvCOhgzsrcfQi00zKe1ktcC+mz3SIp3bKuH9KT8QHT?=
 =?us-ascii?Q?tTZkK5RwkxtOzxBnD7NEcAXKVlQAS1dvLRkuLeSzaTIL9jZm3AG3oB8oyckp?=
 =?us-ascii?Q?zEmFc+p3A+iRJJTi+T/fdlcy5nQeuMFdQ8oQkK8HeF5DjurwzSHI3NIxzl5I?=
 =?us-ascii?Q?52AWMq5u3YfG9Wg5S5Eh62z9GbjEqoR1huUiPIYINoAllkhguY1g0dH+y6+l?=
 =?us-ascii?Q?sWL6/11sDodhfb69MPpEZxeBv4MYPJYjyMC4zGlPYDMloJn618aK/ZK+1Ad+?=
 =?us-ascii?Q?m+VOHG8OToyYfQ+1tdSrUDLeOyNCfzL+j6cGqTwxFeKzzsFrt+mIXfuTNICu?=
 =?us-ascii?Q?o9JxBNAqZvXhhyzE/wXRapgP5WIghgynhC7G5LUyNocvVKaZWqHD/H8rr1m6?=
 =?us-ascii?Q?HL72vdslUGN6Y/eLYnl6bcXmhvH3bNW9nAeLCN3ytkX0yKX28UrodZyNop0v?=
 =?us-ascii?Q?XJt7AvzWQiPfM+sjgFwQrlVV37wX0zQSKULLyDkYLWzQVKtJl+oQ6nRlPz8n?=
 =?us-ascii?Q?vGmm1fDnjZYxL04FCcoe5vyNIK8u2mCa859SxjsKLDfAch9L2imHwAccp5IW?=
 =?us-ascii?Q?GiFRUpf2hSKQ+XCTmc0fEv+1YdfG21CBfSPAumBfDHZUCUW668NFfBebpNHs?=
 =?us-ascii?Q?Zin5Js6f7fo1ScEbVjjVCvS/E177AMPnpXifmpBYdWQL7dQZDPzSi0+2FbG8?=
 =?us-ascii?Q?d/Hv2ZPAf/Ou62Lm9pQAIIYusbO9ebf6bYskHTZaU2pARolLg3FDQhdAIlMN?=
 =?us-ascii?Q?bYH4wWYaLzwXEoiSclL7VhzMHjw/WSl1OodgakyloUevoWU/GLLeITBMP44f?=
 =?us-ascii?Q?ImwmanS9Sgs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eF825IdJVE6ZWxkjmX62gdntZgp7G1kLQ0BDV3gUUroCuesJvQ0nvMF5GMEf?=
 =?us-ascii?Q?9txaGTjHAKlUUJBO/VkhIzGrJ0ZrLhoIyBJgGYO2oCqVRlYtTYWODbRatkyu?=
 =?us-ascii?Q?59mukeDOZ2gKgGcueJWf93cCerHWAUiccjsyfHLlJGExJSNw9Q9TKJPIdPoT?=
 =?us-ascii?Q?ZTf/KB5bYZrm6u3TMBOfXf6ZTPKSvvZ5yTCIYTzkSfe6M+1T41bsRVVXAUS1?=
 =?us-ascii?Q?lqYNArVhbyDmkHWzrykHFjsvw9LgEeAAlW94z6Lq3m/uuNWefbvUSPVvJ2W0?=
 =?us-ascii?Q?3sIrlIpaI9Qodv1RdZ+b+Z4wJLlRnoQ7HcgAs69nRn3cs4TcHJS1f+vQlYFv?=
 =?us-ascii?Q?eM6oNcajC/93wfmiOO4NbPHCW5zkVR53sdhPiGbKqOiI1TG3O6pwBmvOKDrn?=
 =?us-ascii?Q?lcgivFuTVgqHC4YI6uFJscUjiD59DthFnuWqsezijE0RPtQxtiaMwlnxJrbl?=
 =?us-ascii?Q?FjxoV90yFt0RNWy+ugirOk6LfkOo4CdCN5yZUMPUe5b9gOIq181RDjem45fH?=
 =?us-ascii?Q?0zlThRyDQrjGXyvqtgzReuSdiv3JH20ig8ZnQd12/9ad+0IPG0EooPcvz+y1?=
 =?us-ascii?Q?BWJhFg//jdIb+g/mLmBs/LB2+mN/alSgEAdajrGILaifyhYWR5zxIi8+DWTR?=
 =?us-ascii?Q?0E5uBODCrT4TZ25s/SoocU5DxlQtVAvY1/AoAINi6lC84wJosAcFw160Ws9W?=
 =?us-ascii?Q?FVrKro2x6bg5FKQHJdC8Nucw0IXnxbUdAqZI4YWaQvoMm6zKn3NFg1ttZQ5H?=
 =?us-ascii?Q?tFkb9EZT8JyuYcpAH7TYvo9Tt9jVbwSnUnfPpHeGT/lp9tIZo1aSg0/dCgcl?=
 =?us-ascii?Q?nNKLXFhHlGZ28N6k8qE0hKxyYP1TfteiTNrdPPxKN4c8Fs7oUg95ApMqmcu8?=
 =?us-ascii?Q?1+Bo/khBlw+f5G8H4jWKqBAVhq1g6LIoh2MksLgpr5buzIInDAdxUyN6WwMg?=
 =?us-ascii?Q?nkgCmIMyspP+nHAzxgmrzGagFx8LhfqDVdfAYEaFWoSwhS0oMeKSJ9oD1UN7?=
 =?us-ascii?Q?QCyCBvd6FUFMXK9YmUG1izYSHeIRC5RBfUPHVuYSTXPvFFcLlMW8JROAf/2J?=
 =?us-ascii?Q?jkKzzeKowmCqTMTIOxM72iTqPYHTsBAmX96rRC/7YsWLdcwjuUrG4LcldFpE?=
 =?us-ascii?Q?eVzpUmH4x+gS4Y+yU3T+ssM3V/nvDB7fJe/qZ3yaYrSOsnT2IGniN6r8rDLr?=
 =?us-ascii?Q?I2SuwIuKZKepWgeQ66sLOgT+LsNMeF7qXUVQ4Gv+fj0mN9SPMK7LOaRe6SQP?=
 =?us-ascii?Q?pSncR/49V+LuFGyRyq1lk46aQ+O0K5YyWKKepTT04WK6uzq0A4WtuctbmoMc?=
 =?us-ascii?Q?RcO+t+kszb/NUMyuLSnNkO8kx6H3TqMRmVsYnD9x4N2aXGJQO2g1eTw2sc85?=
 =?us-ascii?Q?PrP9aAp005PcEcsqilh4Hekm6WskF73sCfk8ay8fZzkQjFQ+ESQQ2qKx6V5d?=
 =?us-ascii?Q?3cEafT5vmwWmy1Rl29ebV1czSDfzjK25qrFL/XEDf1f7SETbX3n1JEVGTS5D?=
 =?us-ascii?Q?1vmuwuCif44d2qCanmmW4qnwCqRrszx19dUtpBVqukuy11UU28pbh+UUIc8M?=
 =?us-ascii?Q?U4t/RBsreLT8sJPlDYbCc7+d7zz+0F2Wd/q5zrCm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abafcf1d-0830-44a1-d8bb-08dd6daa8257
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:42:05.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoIszoSW2/Xv37A2hI+zIkL3+yqmHaoAnYFggLfBSo5tznFMmFt2jYkdXt4np6cU9cImHCJfvuW20Lpjs84uig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7418

On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
>Hi,
>
>On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> There is case as below could trigger kernel dump:
>> Use U-Boot to start remote processor(rproc) with resource table
>> published to a fixed address by rproc. After Kernel boots up,
>> stop the rproc, load a new firmware which doesn't have resource table
>> ,and start rproc.
>>
>
>If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
>will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
>remote processor won't be started.  What am I missing?

STM32 and i.MX use their own parse_fw implementation which allows no resource
table:
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598

Thanks,
Peng

>
>[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
>[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
>
>> When starting rproc with a firmware not have resource table,
>> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
>> trigger dump, because rproc->cache_table is set to NULL during the last
>> stop operation, but rproc->table_sz is still valid.
>> 
>> This issue is found on i.MX8MP and i.MX9.
>> 
>> Dump as below:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> Mem abort info:
>>   ESR = 0x0000000096000004
>>   EC = 0x25: DABT (current EL), IL = 32 bits
>>   SET = 0, FnV = 0
>>   EA = 0, S1PTW = 0
>>   FSC = 0x04: level 0 translation fault
>> Data abort info:
>>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
>> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> Modules linked in:
>> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
>> Hardware name: NXP i.MX8MPlus EVK board (DT)
>> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : __pi_memcpy_generic+0x110/0x22c
>> lr : rproc_start+0x88/0x1e0
>> Call trace:
>>  __pi_memcpy_generic+0x110/0x22c (P)
>>  rproc_boot+0x198/0x57c
>>  state_store+0x40/0x104
>>  dev_attr_store+0x18/0x2c
>>  sysfs_kf_write+0x7c/0x94
>>  kernfs_fop_write_iter+0x120/0x1cc
>>  vfs_write+0x240/0x378
>>  ksys_write+0x70/0x108
>>  __arm64_sys_write+0x1c/0x28
>>  invoke_syscall+0x48/0x10c
>>  el0_svc_common.constprop.0+0xc0/0xe0
>>  do_el0_svc+0x1c/0x28
>>  el0_svc+0x30/0xcc
>>  el0t_64_sync_handler+0x10c/0x138
>>  el0t_64_sync+0x198/0x19c
>> 
>> Clear rproc->table_sz to address the issue.
>> 
>> While at here, also clear rproc->table_sz when rproc_fw_boot and
>> rproc_detach.
>> 
>> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> 
>> V2:
>>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
>> 
>>  drivers/remoteproc/remoteproc_core.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index c2cf0d277729..1efa53d4e0c3 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>>  	rproc->table_ptr = NULL;
>> +	rproc->table_sz = 0;
>>  unprepare_rproc:
>>  	/* release HW resources if needed */
>>  	rproc_unprepare_device(rproc);
>> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>>  	rproc->table_ptr = NULL;
>> +	rproc->table_sz = 0;
>>  out:
>>  	mutex_unlock(&rproc->lock);
>>  	return ret;
>> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>>  	rproc->table_ptr = NULL;
>> +	rproc->table_sz = 0;
>>  out:
>>  	mutex_unlock(&rproc->lock);
>>  	return ret;
>> -- 
>> 2.37.1
>> 
>
