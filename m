Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3BC22B8C6;
	Thu, 24 Apr 2025 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497428; cv=fail; b=ek/GlpHrfWBgMFCdsOfNmkFKyiKqQsYiYElkR+aKt1RaL5PpOF0WaQ/Uyvw2dZLBCci4sCEPclNC3WDQrKhMg6+bi0hkfbMUsCopaUPclbYiBXQCBzUCPZFd9o0m5yfszh4qlgJAm3jkgAwePY+mK/TsjwD8a50ZmNJlDl6iLpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497428; c=relaxed/simple;
	bh=x4zvc1gauxkQa9n1cAJRpZoLTvgDiQVTk1eVQkVEvkg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HvtOJupD9Z8FoGGUOhJNHqExaYLckQssYkv7kSAPcsH3Vnfs0Izlp5mvzADlQ6JxlVjnes+zjwor3zFTuvsii/agiUlpRSmmbPocB3qsjdyTs66xCh8Cpre47Exn/R2TjXqm9A2W5U4yqMTxal+rRrc1lC2wDc3XURXYo2di/9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5iMef011746;
	Thu, 24 Apr 2025 05:23:27 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhat8bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=essyqskxO5+IZkDbV0t9pXTx5TVXYSF794vZH/WNaI6ZLjkWhimM3xOitHHmlOayKnWtuJYLjowUnPE9DRxMxWe+LYvQYrndQxLQx0HzQZ1Z9Q1OVrkYE2Kc4NvnnjlmBtQJ1BiobwGhz+qMpOSHG/0aMBVpAZsOB3NwlEJOCxRcczLmQQ9RBl/sF/4go3PA6REDO1qF86t+/tgzZ/J0Y2w875H4O6Z2So+Vwp/ISWwz0Qe5Cz87PsUGnLhfKEG7nfo4wgs8ed8yY8Cwa9kIFI3r5Q+qkg1Pd/fc+qemeyuniNO6HdnEF+9+mwfL50vcv+Z5tvsC1s1EKTPa6xtIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBMNd0+F/Az+F+Sywa+uY0qFjAGfmurE8HS2VVZ4rv8=;
 b=EDiY3ZSkDwNE0/KPN/JHV9568Fq4H3cWQc7394VHrmuuuwuG+lOhGY7vLJZ+EPT63WTOpE5hQhHU8kSrqiC6Ox5h72VoV2ktqwx/4camMlZ5BJCBZ1UeUJ1nEZScfXM6dYbsNpQPRGGsb2YFBnWVi7neQZa240acpfo5oZ1JQAcTBmnn8NeVLoUTrKXjwLmircJTVYfCdpJHdhFS9a1apcyIBf9FZfJ2MexVi2pfEp17MU3xCOlqXXbFAnSQKeZZ3/Jvs3frAPPcKIzE4OZySjEQ5J8TwRicvFh8r74AKu9kfW2ChVjjSunoSYq8WJuHMGYi/FSKUp//0TKI8lEQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 12:23:23 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 12:23:23 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        festevam@gmail.com
Cc: xiaolei.wang@windriver.com, kernel@pengutronix.de,
        linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: imx_rproc: release carveout under imx_rproc after rproc_attach() fails
Date: Thu, 24 Apr 2025 20:22:51 +0800
Message-Id: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5e6479-2678-4cf0-3eeb-08dd832ace95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZz9ygHQP8bI7dQcAmlVLfhQT/4UWALigjT7GlcLywuZkK5R2Fut3oqi6+tH?=
 =?us-ascii?Q?iJblc6mQ4hcAAlnzwKN5slYvLvAf/bASyd1sKtHA9IGxIOW0vNrYDbeny99x?=
 =?us-ascii?Q?SqP0yBQYCeDTtoWcnVSzygISmspG5adNX2Kk5aHJ+hQxEbjbWlkJ4DhKcUle?=
 =?us-ascii?Q?07c8JnLHGnN8Z0vATEXN7/heayHrVTyidDbfZblvsNiM0Lda6Q7oGugz/w//?=
 =?us-ascii?Q?QY+crzpwgT2KXKRQGfxRy47fYPseavNWazmHFsEGGtVotR3hXOyxjd39BNVt?=
 =?us-ascii?Q?0vHhdjc9WdtdNrvTiZyRNpz3qVtGgJQcObV7MzgNlrp3Zjmli+wcxV5e7iWO?=
 =?us-ascii?Q?BGCsAcbdMuSLVjmOBB1HnJJVpg5pGRyTuSyBwYpop0KsvK4uROW20SRzJypA?=
 =?us-ascii?Q?uUzmE0QtZnGrxjF4uFgNDXfYvEFo3qKEWcI4X7pvN073hLx19dK7Mqyso7/0?=
 =?us-ascii?Q?nWhstg6k9JD1WcuwSA0JUnGdK26YLVRT8Esjr6okrGaENE1m+czoVMOJqhjS?=
 =?us-ascii?Q?T/90bLNiML7EoLNIvOBnxtEFmEQL4JIw+7XM3keNuSl+8MqJPjGZstetVIgN?=
 =?us-ascii?Q?5La1KtPUZSS5XW/EvrScfemMT9GBONs5LvAj7CcPLF08PeVjaVMqFCz0DCbc?=
 =?us-ascii?Q?4ult+NnNhhtT4nKi0NgSUkBMQNYg7cXbgoCIe+pFfKqpLi1Ee7IfLQfH/98o?=
 =?us-ascii?Q?4NM5gI21Y3IGbAYsvprUZ6B6O5L4aj/7Bo8VxH+LZrBPA/bYYnxSL8eqNDrK?=
 =?us-ascii?Q?ewWQSIXZqUq4ci0P0+KTS17Hoi0vqWjSCuLdxIADPaa/iqQGvCSyvMmEv+Ec?=
 =?us-ascii?Q?GVPhiAeziKKRaThVFzzdeTL0r/riL9/j4PbdV6vULayziN5uY6004kBJlBI6?=
 =?us-ascii?Q?LwWNfyGNMAgbdQUvB8wtvQaN4F4wp7iTkYk6zKUWeZsKkfubY034Fv3lzgsW?=
 =?us-ascii?Q?798mFH5EXFxt3wgKl4Qbml7z2/Wd6JK4gykK1fHxv3CNaqjinQW0CIIwQmRs?=
 =?us-ascii?Q?kBy1CCyxZlhnu+KO4X7yMiVtTWxUL1Errf8HMLG8mp0Miw5nP8dirbfKxKos?=
 =?us-ascii?Q?Xrdqmn5JnFPdnusO2SLVWdfs95JWBxfcP26XVmBrRd5KI4ZhGc0Ylw+fAfqW?=
 =?us-ascii?Q?RyvEB7Kkyyff+bTk/s/G/RLmWkReOTS8OBY0Ak7qWI4NBQxzOmd04tgHvf1X?=
 =?us-ascii?Q?bZ3xTzKKSh00HKknP2u1Npb4B43oaOKDovg/WGrI2R/qwrsTDjSHZhbSIWFj?=
 =?us-ascii?Q?O7EEB79N7drBjybAWAUdSOGyAfrGd8aAw4W9RP6ZYd2gl+TaXGifeR8i21aM?=
 =?us-ascii?Q?SBxUjT1rq+89V2KojAr+nkByCTPB1Z5369cwQJHFhEFwpZSCVznCDmJPXW/t?=
 =?us-ascii?Q?sgrbqlSidHd5Cx1paMyM9CfpxlK3SvNWTQzuItPC2eCTTZSZG65NWW5AxhYK?=
 =?us-ascii?Q?EV5avTvxRoQ1ZBzwzzXVL0pkvl2jaRBzkBMdziMsXkWDg/Brfkh7Zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3iD2f4dazCztrHKW94C/EVde7H2oX4Kv4jPwH0lXAx6bCvafy59hmcS0rSM1?=
 =?us-ascii?Q?7D8BCvOjioTKKN6tiq4JlYIdo29FrHL/rckQJWP4kSEGsaykLnIN3i+pHwxk?=
 =?us-ascii?Q?utPSfW1vOe+POZL5NgLNV0INHFpoogFUybKglXDiYDRMN3e1KykU8OKI+tc5?=
 =?us-ascii?Q?GnMLIMkZtd6pXsT63dTCZh4xhMPF2wLHgE2SsQfaFO3E1FR0RGhGbe4Hhqyf?=
 =?us-ascii?Q?1CRCQuPpeNJDdn+vPga2DDJr/19IMogGoGo7CmUQ4m3yezE+IcGnexzUfOdi?=
 =?us-ascii?Q?2Ijw5NwPQujWIivpySaeRReo3MzSTscd9/WV7a6oAD4FqGfu2UBrCRAMHI/1?=
 =?us-ascii?Q?t25zpcq14EDqlG7hSFCZw+Vy46GqrNl1zUKA8RgeJZszv72jqMVy+JLbb566?=
 =?us-ascii?Q?m6kX6+JUvVDVfKA24LgUnrfs7uYlk3DImEp3k3ZEXEX8YNYy2DChvIWSYsIl?=
 =?us-ascii?Q?SNStx6SEMSgdhBT/jDlJlWskKS8LI65zzrUmKvt4WVSiqRFbAOM+UDn3UdR7?=
 =?us-ascii?Q?19eQisH5/pK/GzJCio8T6v/QEYOhHIHml/2YBhlnj8NzzLqZvKfd+snGa8Md?=
 =?us-ascii?Q?Lrc+zXRMnRtU6FRRzAKF1/DQVzypARbKaqMGKUKSicJ+1uKNJHLh3HG5gSue?=
 =?us-ascii?Q?308eRR2PlY+MkgPMEBfgNz4O3BbW5fFOhoMiM1BXRHl3B4iGDPnb4VVvA3om?=
 =?us-ascii?Q?iu9v0g0ORONbA+IJcPE6vYd0XO9xs0L57mr8wC1q5ykBi46TOtqZPf5ang3x?=
 =?us-ascii?Q?xiA3e7PtnXGHUJ6JfxqZn7enKB7eB06V203tjQnPuIUXuUYYvGwkH2i9XkZH?=
 =?us-ascii?Q?JtLpfMc6khQNfoHEU69KGY8UNgFUO023Wwk/vNES2qeJ0Jx2dgYPHWzzLI/q?=
 =?us-ascii?Q?DUHuQwVs0aLNeJlGZyIWGtd4TSZhdklt/Zn5KbuIvMetomkOqz0wahBOT/cy?=
 =?us-ascii?Q?FazSIFXlHQt+ODhojk5E21i12/j4IPvngiPz8JOkHq66bfyL8/p5iOref2jk?=
 =?us-ascii?Q?DWcdE52paQWoT+ADHdImta3bcM78hyqeW7DRP+Bsz8LfVLYyRzMlxcnZVpT1?=
 =?us-ascii?Q?ZHOo3u23yvVdVTDyZjHoCeeDxyWXa2V1p0F4pjmbcjLcUKbALdyhXiQv8TMg?=
 =?us-ascii?Q?34K2WGvU10OsO04yx6Wk/X3z4CA3cxTqYQzggsM8H/HSPKUYvKkUvr71sJvb?=
 =?us-ascii?Q?RFytwQ3Z86Ek2I1yNCHfZhOxQ1UBC4CRMh9vDO7Bt3TBlo/4s3vsoptqe4k9?=
 =?us-ascii?Q?dTExycaR/62wyZEjG/5D3v8IqBdTMocXSsubLQKlcO0GuuZ7W3cnWPwp1m/I?=
 =?us-ascii?Q?tLj23P+uhw789wk9VM2BdjzaUJHyX7rvBUy7oLR6k6jb8kx7aJwZ6Jq95SHt?=
 =?us-ascii?Q?MQaM71pssNMv21mOuVTdSWHPHtv1L0zzH9smSMUY3N/cdzMOn9NUf+QybpcC?=
 =?us-ascii?Q?9PKcUedECz8vi5zSiUoYlR0j0V1Vf7uoKFbuX8IdM+MpKDlb4ibu+q0UfM89?=
 =?us-ascii?Q?+Hc5MwpfkPpkk8RMpkIAna8cYXtSY1FSTP9K8ZbJGNslwHMn0pLzngIP+1yT?=
 =?us-ascii?Q?UdEe5vC2Kax0e/2IC4eTa55bxy/U8h4Yzw1Dz3G8lxJ3pMPfiAeXZGYOM49D?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5e6479-2678-4cf0-3eeb-08dd832ace95
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:23:23.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaJvUNXYoAoLYpRS4ZCmzxzGkiUtmU1QN65MgGdJ4Wy7M1YpTlfzdd10fu5TIXBSagJ0K486mvuKTl6MLw5rLxhduA1FBorXYAYaXbK0bqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
X-Proofpoint-GUID: 8zz2EpXaoIiB7fsdNbnwKnTDWaPsot3I
X-Proofpoint-ORIG-GUID: 8zz2EpXaoIiB7fsdNbnwKnTDWaPsot3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MyBTYWx0ZWRfX04XPtg712Sas atatxOikN3goGtRXPn+gSXKA2JeMmfb8vXWo6nAqk+8M5T6NiT03nnH73M8GFaQODayivuT4QIV 4iBnT/JO9kU17cg9bN9M4QfpAp187cCDF98eVQkhUs+Rr91v05ppN0iSSmNOn/GRiBherNmt/xD
 09hfw/XZTtnlLQ/osfs/8ZpVhYgry0a49rds9MBpwIPa5BYmpSkjs/2TZKTvYcU4UVLWNo7rNtp a+a8GyMV7PoqpTa4rFuJBWSlz17GygsO3BUA7CwRU2gmeomzcmDM/MhshuZHX6+sVRpQfk1hY3f aozC89SjSPgWo581Dut+skEK4KBs6Dmg9Mo2FLomFhhHmFS7gNxVRqSQY84mLffhDex2LDe259d
 oCd27+s0wt/qvpnP0iVIt7JA8vwG0au52QQprvMJM3M57a78aKng2vCyXLudd3jPXou99BVh
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680a2d3f cx=c_pps a=zzjaJ2HwkiRAih7KxKuamQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=sRq--HnLeW3Vs69c_6oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240083

Release all carveouts under imx_rproc after rproc_attach() fails to solve
the following kmemleak:

unreferenced object 0xffff0000861c5d00 (size 128):
comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
hex dump (first 32 bytes):
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
backtrace:
 [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
 [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
 [<00000000521c0345>] kmalloc_trace+0x40/0x158
 [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
 [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
 [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
 [<00000000e7e994ac>] rproc_add+0x124/0x17c
 [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
 [<00000000efc298a1>] platform_probe+0x68/0xd8
 [<00000000110be6fe>] really_probe+0x110/0x27c
 [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
 [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
 [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
 [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
 [<00000000db3eb243>] __device_attach+0xfc/0x18c
 [<0000000072e4e1a4>] device_initial_probe+0x14/0x20

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..c489bd15ee91 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
 	return  0;
 }
 
+static int imx_rproc_unprepare(struct rproc *rproc)
+{
+	struct rproc_mem_entry *entry, *tmp;
+
+	rproc_coredump_cleanup(rproc);
+	/* clean up carveout allocations */
+	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+	return  0;
+}
+
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
 	int ret;
@@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
+	.unprepare	= imx_rproc_unprepare,
 	.attach		= imx_rproc_attach,
 	.detach		= imx_rproc_detach,
 	.start		= imx_rproc_start,
-- 
2.25.1

