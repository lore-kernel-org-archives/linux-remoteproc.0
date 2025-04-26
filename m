Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C71E2834;
	Sat, 26 Apr 2025 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650468; cv=fail; b=L3nZbP3E5nFjcMuO+86gRaROupSAtXqS//GQaiajwHHXvOiicd8eq/y0yXUiIOcHZlMWXFISQGAlHUhw41aWIppW0MuLkKD0mqNurCrfHixkqL1sLaHBQrHk+N0t7AYjj0uLYX02bfMgC9PMzo50FkrK4f/d6If6Q7ehBXgeO74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650468; c=relaxed/simple;
	bh=YzNvUrySsWr5LADc3GTR4Bv/zLfpfqoplm+bWK6tL9I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SAMI5Qvq33EA7GWtLXa/vAQwHIf12RK65NrhfBb5GDv+dNbjGMjH5y7a8vtkJQeYzWkHDL+8MRGTlZ0p9TKyUSUg8LnrZoW0u2mKvRzhNPIJNHrU/bI4IW/5N8Vk5Tz+wZwbFNsatKbsGqMXDTuoHQcM7Idjir3bQ3sxipdj2k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q5vQPb013528;
	Sat, 26 Apr 2025 06:54:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf9068w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 06:54:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJvkPMXRuNN6dDzo75TRgzlffEY2lmjVPdehbpYB853YlCaWTD4tRck+q4qDMOcoMHQHza1S+oKv110LvbeafCOXHIUvk3DzgOcpoM9fxfbSZZiyhF8xfIVTCAhyXzFzQXRSitTCfKmAX8KgMXKukOcii1Pah84/Cgfajwx/NDLRbg29hpXst8R6vQrDCQo52NvZiiziIoeLXYkC7dqqUnAKCHOyAm+sLreXbToUYvKOHC2/wNXkwM2MHlkSIp07ZCAeirkARQqtwxyzQw52Ik5jurAOWV3bsylCXpq1VdO1rez+SleF65D1591VkxblPqwPGDEiyACfT3gdwp6+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXVqgQVZ7fntI6pGD72dIAGoxNnbUd8xQklRdoYXud8=;
 b=zIy9Es+kiajbynoCnhwwn8iTjF4wzYyasUhYDbu9uA7DxfcBLZvyF4z86mT3fBq6GgYeaQ7KeuE0nZvfjWrA5swlwqXsgY59O1qjHx0PSlERZL7PynwACo1Fl/raSdX1VK2x76P7zTxkYL3oEnRnvjVy1b99I5SiCm/Mrs1Jo4QRIpvxkjBGxWRQIP56zSjqRCWOeXKV+JrNEey79HJr6Kr4m0GfeyfTwdqw9gNukXsnMS5GrzLpZj6QijtLXe4ny3dUK4TRSOnpnMuKGcpLU35Gf3RkQwIg3OaHphb3ejZFoP0J7cHcLBpdcyRSWHi8xPHY17hrlea8JD4HESxnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 06:54:09 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 06:54:08 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        xiaolei.wang@windriver.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/2] Fix two memory leaks in rproc_attach()
Date: Sat, 26 Apr 2025 14:53:46 +0800
Message-Id: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb41cf9-1c6f-4bd7-5a69-08dd848f244a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?huhCOrk07n/PieFJMPlxk8KwQ4euHBIKmapXepibrElH5RgJWn20y15aTfW+?=
 =?us-ascii?Q?RpUw2LBzGBbw9MypgUH1n63ZtpUVRiLJrzpD08FS9rSSPFzedWtSc0D0NUOL?=
 =?us-ascii?Q?kbPcJ3DbFnY5jcEngfde7JVFdcNPoKF0PReTBlliUXaflDkLyuQ7QwftbND2?=
 =?us-ascii?Q?WKy/IOhOgGnBkXlIVCsuh6E5LC03WHGYJE5DTV9k2g9D1dRIUD6d+YxQHCHi?=
 =?us-ascii?Q?GtJVlZicy1X2arnRFoOWEUzRVzkAU+xQv+7+FHThGe32tQ7OygSzLUW17aAz?=
 =?us-ascii?Q?qAHZhxCXdGVqDxRXnHqEp1mPadQB57riEFp02K7wsFLSAaeYOUpgGfgbnQpO?=
 =?us-ascii?Q?sH86YmHDYJxyEJrh4g4tVwvNHFFRjlTN248Xc9T5xTy+r2T+KW+BzeYKpdS0?=
 =?us-ascii?Q?oEH7Ai8lFbjmksfsV4q07gZnyNabG4jAalvGfu6z0qACC91jOwMi8t/C70z6?=
 =?us-ascii?Q?EORYJwq7nEUODpvE+KcGj/3LAR39RRTfZFxtbLcoY8Oz/mMeeH1yn7kcyhhd?=
 =?us-ascii?Q?I/bR5ZSogzu8XSXtd0tKmzRv+Do5fWVMs2+SI3kTHexMDOppq6prhjCY8HuV?=
 =?us-ascii?Q?rFYLSTWCrrMQgyAPWGgta0Ie+AhGXeSLLU9P+/HuVP5cxb1keudgQOG5WaAq?=
 =?us-ascii?Q?axOUjD2qevS8lSIYzyDHval2vpCTBw3iAfU1dT3+VD58U98qsH17uf+bYw8A?=
 =?us-ascii?Q?hyGps4vJAWrraQRGS1ItVcuAJ7yrPG5JfdwptbkV4HyTZ/2KybAu9fjxJNZc?=
 =?us-ascii?Q?CAI3WVKtpjUljiJnArfHdf/Do35DP+5h5TfsZAfGT2p1dVrU8exK2gyF4f9n?=
 =?us-ascii?Q?l2bRrWrmhOOE6oFzOBRZ4QXmdgZ7z1zMdUiWuYfYyvZj1NxVP680QfW9xbU9?=
 =?us-ascii?Q?xdUKGFnoWY27mdi4FfSiYHdJ6gg9qu+b87AnavgCh6EIVkxDJHImwzxGN4wI?=
 =?us-ascii?Q?2Y6wSjw+eKBO04NdMzy9nV7YJgvxyzU7QlySevbd+a5x2ztAnAHoDsWrlkFw?=
 =?us-ascii?Q?y4+h67Zngbgmks2G3Z5ar2BH/JZJHEpvb8EMG3qr3ZemoqahWu829ipledQB?=
 =?us-ascii?Q?5wPnsHgWf13WWIAOmqNeLb4u0uXl07giC01sjBzSR068Gvl4C1azwjGG9jvq?=
 =?us-ascii?Q?R0wZ2HUb0XXw5bWV0DEqlTwWLJkSgMv0m3pqo0A/ot/WSmluhYbzx6R0+43k?=
 =?us-ascii?Q?Ihz/h0SNAQpgwrZ/l8VEZ6549fpASmKLoDCnQRVswjYWnmSYAbDETfEKZvWs?=
 =?us-ascii?Q?3zjXDUTtWC5sKOb3rffn+7DvxJ+/WK6PbGUM38E+51Dt9C4hhVRebFK5nS7n?=
 =?us-ascii?Q?8DRyOmgliSdCUJXWBE4PHD6vGcW6V/mufRbUGVOdRovOy4rHEy9FO+MdCpx/?=
 =?us-ascii?Q?fDn7zSOcBw2i9lWI8vuzJG3sCduFikwGTVVy0ReqUQP4qZGyMRhyxvOw3xMl?=
 =?us-ascii?Q?PHu+XsyVgutG0y+LRcO03K7PvSffHkL+vYf2lrTPqv2qzCjF6Vpjf+W+AAMj?=
 =?us-ascii?Q?gxVbA75N7DPI9v8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zp0fWQriGqDaoYDPE0DBGGbUkDckS4V8Rn7MIvAW8L20QOkq9ktgiAUFDZYv?=
 =?us-ascii?Q?Q6iE5jDQGjFfOKLFAAktYDkO8wjj5Nruit4Pa2TzKmkOmVqOVj9+uPyVY4hU?=
 =?us-ascii?Q?fQuJQNYTVIE0QyPuQYUAlYYlwlUy7UZz7mhq8aaxR2+oAYc7mwx0pq4hXZ8m?=
 =?us-ascii?Q?v9DFQSeQMBp4zYEXfXJ71pgVtaeBh7KfTWHC6do60QyxB2TTcYjuDQTlNJlk?=
 =?us-ascii?Q?hH5bYqAHoTPhBxUfBmHgKwKraZGxBxwWSs4DWgFJ5Vs3nOAUvP/f1wEnzmO9?=
 =?us-ascii?Q?4IqjoN3F1qFD54TDy4KDsFqC4RAcYHk3GU8URsbxMn0XI3gXxF35qqpQ7cIX?=
 =?us-ascii?Q?KxfIzKbUaV6rvasDlqTJ+TM57IkDF340tUVTbsgToHeZ+yf2wO0iK76xNX0Q?=
 =?us-ascii?Q?Kscw1dpH6lqtxeEmzaizNYob3tnNWobsuVGrGxjCh3iqzWALGwcNrKCklYPd?=
 =?us-ascii?Q?fUzpFd69KwD5gmE61jGLbVRyoVwYXTo+se4IgUEvrMHtVm+Hl0FjUKdx3/ko?=
 =?us-ascii?Q?Mbc1riazNCk2uvZ0oK88VoB2cCG5PxloEceBSD8roUAjohhl3A3ryYscXg2t?=
 =?us-ascii?Q?6ooAnfTD2Jd932DX46QslJoa/XViyIUp0fGUd0sRcWyElXse8of8Rtgn/mVG?=
 =?us-ascii?Q?ReSHwRprpkQj7f+i56u8z7eoJM2kjeuh8mxiHqq92H7sWtTXGZeCQTZdRPhA?=
 =?us-ascii?Q?8yTGxOKkETgapDWmeAOZ4BxYWDKIIQHmZBUkmT/VDv5g6+a715PBGR7YDCKL?=
 =?us-ascii?Q?VmHzWoVgiAwPmKkuRTbMe16Q9Fzvl3qE93HFVFDfhnXCPPHx5FXWipB+8t9I?=
 =?us-ascii?Q?H5GBYT2I/W4QNTbb6/Y9il0IDxUxq9MVS9/YaVC3mLUALsppbym48NQCSrb/?=
 =?us-ascii?Q?q9Vrfctw6cFSWGLDEBpZL5VnlKUl9hz8LZyMbP2qW+Di7jgnAb6mEXMaLQKq?=
 =?us-ascii?Q?Suw1R/nz0kvSnO53XlDZmmwwLqReFEEZR4n4oqhTkwD+i/EIX7BHBVAZStEI?=
 =?us-ascii?Q?KJn/aGlSfvQP2T+RUQiqX4PoKpusq/n/14XphlfjreU7j2GVCKTMFpGW7g+t?=
 =?us-ascii?Q?tbtw0/03n/7VgDt2EvdSq6d6DDoT5Kd+sAOL1GZVZOuMUvdxLnx5fV4P4t1W?=
 =?us-ascii?Q?fqFZMgF8z8xfIZonQoMCaPP/PfpQNciGzBqEssnDZBEnDitgFrA2ycV4AzNU?=
 =?us-ascii?Q?uxOdFAB+ziaiU/45916fKFt7dnZ80RPWZcyngeMMbrKpSOArYMQE+s0n1dJ/?=
 =?us-ascii?Q?Lt49EhtM8f9W0+h5yvmQ7zpNqRmLJeF58RZvaeiZJPz7uTkFCo11geiGGX41?=
 =?us-ascii?Q?tp6tNF/75jkgMBNhnONJfcsq+dcOey+/wMrg0PjkHy0oxFYbRqTPh2W6zYb6?=
 =?us-ascii?Q?eVeTvAZVb0j4SMj1aDCbJrKNsuGvLtXv84yxFIBILG8YeKlbqAyNB/aea9a4?=
 =?us-ascii?Q?ShzAJTV3PnMjc909eyh9FGEa7bmvTHypZCuukG0EgoPmuTl+r/mssLuj6HHw?=
 =?us-ascii?Q?bep+/tqHMjSgwWlhS7wN3492VDf0Gikl+Oh28L+PXLuVP9K6hvh7kThelx2F?=
 =?us-ascii?Q?sfpRlpq5sLQPHr6dl5zLCsBx/UoJvbfnjZsfN1XdAmDWS6lELrfOudYivKAe?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb41cf9-1c6f-4bd7-5a69-08dd848f244a
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 06:54:08.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWSDetSfvP5GAQO2lZde44QXQUBQrx5OwIrZiugOuKm+E8TNWF3OPsX7tFB+KC9xYQKDRlZ4cfjLgA4tsqp1StIUsPpkmfWyqdkHnktH1ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
X-Proofpoint-GUID: lLpPx45IPBBNYu4DMV-9aSKYi-gwkctO
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680c8314 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=P2kPg5W6o2W3qpvOAPwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA0MSBTYWx0ZWRfX+gCxZ+wQNi4G mXLhOU6jEzc6QJ6bwh0kZoKod45R9bJHdrcTpmr+TQmHFX2KSmDaui9bZQ2QGp1htivHT8iEEj6 V4B0lnS9j/Xith00x2DJppKZ50cgADsFgOKWsTmuziUGAT81MIuvkLXfCGdfHIKahjehi8tcQLX
 kNZCpS0ysuisMt8GIPDy2MRMh8AuVqUKXL9b+msVxQTi1l1VkMm5xRimgYwTUSlXq/I1oMw72m6 xqRtu6lPu0EhUDM9wTg7TrcFTb0n42hXoQgl+TR4+bFwDJ6DELq2Ta1cSbFtcleQt3XMsEQKF4D HbrR5XQlX03hZ3nUQzgqNPEfBHzUJ7biMI5Os8PpCxMaw4WYfG/9KGQRkMekvz/jFPtLhM+DliH
 g3sIUUfODnFsaESEZge1Xn43FR4IJFVpmcLJur8BScmbE2gWQkvbyJGcG2sXiaPh872JsV+V
X-Proofpoint-ORIG-GUID: lLpPx45IPBBNYu4DMV-9aSKYi-gwkctO
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=853 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260041

In the rproc_attach() function, if rproc_handle_resources() returns
failure, if the rproc->ops->unprepare callback function is not set,
the resources allocated by rproc_prepare_device() cannot be released,
and rproc->clean_table should also be released

patch1 adds rproc->ops->unprepare callback function to imx_rproc
patch2 releases rproc->clean_table

Changes in v2:
    Updated the commit log of these two patches
    Link to v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
                https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/

Xiaolei Wang (2):
  remoteproc: imx_rproc: release carveout under imx_rproc after
    rproc_attach() fails
  remoteproc: core: release rproc->clean_table after rproc_attach()
    fails

 drivers/remoteproc/imx_rproc.c       | 14 ++++++++++++++
 drivers/remoteproc/remoteproc_core.c |  1 +
 2 files changed, 15 insertions(+)

-- 
2.25.1

