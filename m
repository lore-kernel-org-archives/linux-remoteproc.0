Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5D21B1AB;
	Wed, 30 Apr 2025 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004889; cv=fail; b=oghgF+uxShLFLLODQOQOFvKNirIlLEGmYEFjMsv3lV+XXmAA56qAdrReU+zRRmI7Nk0hWR4ePI311pUZhSaqp5wHsyWb6F+G9ZoR2RFA9rQaAIMDQUJM/0nSRdNm/sn7mBjw8Yaz8ajCRhIoDyl9Ize7GoQ3meufMLMVPSO61wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004889; c=relaxed/simple;
	bh=mD4hPoQk8cTYVGno3BbQ2r+p7ZMyqoqebF45NqiuTxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hrWXyN5BgkMMo5KuEqVmKCNKAZVlI/o2viJR9kCPUJcfSg5GokJjOM0IokiifhhvV80v2f2dmZPOnYEvM+AcW2/kTBabXI9jm9Ee7u/vn2zIxsPR4r7K+vCCwS4bWof20V1Y0wKoK3/BxO52Fi9WFGoHspN9aCmFjXB9ZJ1adF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U5KOv5002619;
	Wed, 30 Apr 2025 09:21:04 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj0jr6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:21:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7n4X12S2TzoHjdYd1HGvPcjvfPmk79rbLk7gEQ29VNvV+T/59mqZSwzPSHN1FpDJ8RsW1pXNneMCSwwRZGK1rFXAThajNQ+1C6oiUv8QOxMGy9OD6Rt/mnzxyKySQXUZVlKN35FbS0srkQI4mUN6fQnoXAcjQtF50D8TFxUixU5AlW71xrP/ln3JrsiWCDEqO54IqSW3rZchzhwvgjsOG2Yfv2R5Y5/jhxsgncCWFo+1UsCy7ET1i5qsldmjR8l5yM+mrJzN4lXIgHfIm0gQkJ8W7xYCVGkPWGTARPlwl0LTNWmlLnyEiw5IEXc16vxlKb7LKAlfppaNdQcugRt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTfoH+nM5LgiD8MXR3OqXFuzljhl3G1xlli8PQIID18=;
 b=sYDdX+EwwzmWAm7rwjmFetho1SDYaQjjNzuoTkIucQNTYovGDmuNqiBN193Kb8rE6xsKJdlRqiJdvluxreD4NvKJtmqKILAI/55qs8Zm5VVulPA6kk9c9k80KrOMVjcpvXeVc16r0qHoA1qnHrTS04tRU9G+Vqg2/lDCzqdr7WV4i4aC55shLivq4wJ5hL3PeLqF+oHllxJap+2VtMn4WBA4Jz9tUwdy8e5SN40BIVKynpGM1Vhi7R9gZxMLtP3E4oUnzuIS6jBMSQCqBs7iqQfmu/pmLa08cf6ItaoQLjrFwYENqD3A4wIZII6Nw+38Zc+m8laS/yKNk8M2yVioqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:21:03 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Wed, 30 Apr 2025
 09:21:03 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] remoteproc: cleanup acquired resources when rproc_handle_resources() fails in rproc_attach()
Date: Wed, 30 Apr 2025 17:20:42 +0800
Message-Id: <20250430092043.1819308-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::14) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 52551320-8497-435c-6012-08dd87c853c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?taaowfgakMCYoHiWxT67EkTg9JidB5U5XT1M9rykPlJJ0RyKkgGeeQtIvjb3?=
 =?us-ascii?Q?DjuS5qCknk0IccxCNIsABb+gNxNkKkNPRsxv/gDRD6JGqKZ9tXh2Mj9QVZQc?=
 =?us-ascii?Q?07YZTcKmzmG+AyElpvxA7iIsWKOCowV1iZTP7kOTfmgw5KrAHuHwdYJ1OExg?=
 =?us-ascii?Q?PScFOftAJpRcyDBTZovQd5RliR9yQktiDaYx592mhA6VC9NYntVY7EaC9Igq?=
 =?us-ascii?Q?pGIAX5ol/c9qdQnnyIcxk+MKFs0Hb8HFA25XHTQ2M9sHNWtd5MtXIwlx6ph0?=
 =?us-ascii?Q?SNCG5bcMzt8t7o2l6mQYfh7PrDmpnNVgtkh88l2zXAnrKkqz0vu83XV2Hud7?=
 =?us-ascii?Q?uxuR4Bjf8pqpDmToeAZH/aoiDHCGhvOafqL2prptHvdMRmDTseDNi4jpHfUJ?=
 =?us-ascii?Q?DELwPbxMjroPBnh2aWO2/sXVpFVVlNTGz0DKQcSpCI33nEPoBHz1y4NXPBbZ?=
 =?us-ascii?Q?PF0XcKUVkOzH3KeVnk9F/f4WTWUSUo3HVbCxso5S2FvN4zEUdN2qg5RYcE3l?=
 =?us-ascii?Q?oWg1mwd0Ap4A1UurvdOVsLdcWR9IwNQazX4exgxSHfohNHA2hJ4Op5n2BJEE?=
 =?us-ascii?Q?VogfkbIwarXz2H/w+KM2SAoLpnkcZDAS5XybOdfOh/u2ALR7USR9J/Vsq2Dz?=
 =?us-ascii?Q?1/b5kL6ohtXG8jWOMGpl1M3BR9/7oUlaHbwaANmhN1tZC6UnVRMpfs0U0u9f?=
 =?us-ascii?Q?quLFsbKgSl1Hz9ThF+8871G96I8QrAGggN3Nuh0u6dm1AvRQ1Ms5Go57j2tS?=
 =?us-ascii?Q?sTxmKJIdrvg+8bjMPnkHvSjiB/1s/pf5E6lkVN5EyJ6iXLADhJs/tkELQpR7?=
 =?us-ascii?Q?folfSySNXRdSvLsVMHNHVvxTLP0ebCJcUWLQauR9eSrlds8+R/fAzgK9fWrt?=
 =?us-ascii?Q?cQMdadeOklRkzizbHcH45jnxxW+H6VvJr3kodnwN+8De6tEchsKHyPEx1f1u?=
 =?us-ascii?Q?ASQMxl3cTaqx3jHlzg5XXp/dJcPbD/Uy6LVa3W1VYVX1PrfaXu/Wy6jgcKzx?=
 =?us-ascii?Q?yaJzNWO7NyXCVRkPdS9DldwowFtJz/JWxKd3Oc7OUELO/58c2BXOIjiGpk6X?=
 =?us-ascii?Q?ZKI1dXbGhK3AHwkSNeRgopUi6CbWAI6awCptl9gGZIVypjSBcBj5jJ/OIpZU?=
 =?us-ascii?Q?pZkRu2iwLok2nK2/EfCGk2a2Mpqy/FZ5cvObwSiUHw+EihnCTTFvaT3X1Lr2?=
 =?us-ascii?Q?DEBvcmhhe7TvmxB0mdcYuMhFEBxnm40uK3dBZm9NtyWrRfUIYM8Hy45BAlO2?=
 =?us-ascii?Q?PPLlfywlc3HjZiBo90N58QMAi3CI8yX5i4vRo0D3lXqDCuXGa5ZSs/vjWn2l?=
 =?us-ascii?Q?Ky7eQWKcVhx+GcA4qkSCHl07A23n71HogAP4SYHxlyXb6+MWqOnbUhBVbQOn?=
 =?us-ascii?Q?BH5O+Iki0ZMuNtrPsrhMYeU/55l59PFA+WQxgTxYP7KZ7gvkcbWVUv0L3RZe?=
 =?us-ascii?Q?2hXYHEEWuuj02h4fRJYZ9R4pLIbq6R+W+eR72OWwsglmyUc5Ko3oWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IQsXgU8/JdPCiJTwLujmtf2Wpow7lC8vYBTfiohW+xX01CjKiCQ1R4v6eklm?=
 =?us-ascii?Q?jbpvI/n7V4iXBSVSS8JB9tCAsYvy4mq6Gi2+wAvL5li5j+yvp4Qes7MVSWgj?=
 =?us-ascii?Q?s2rja+A1qq6j2+s6I198w6RXgGYKS+O2fNlhfY8ElAwGLRWFrQBtFokK8MXa?=
 =?us-ascii?Q?7UhGzBwCgcTHDjuKNXW3p5yuy6GpPKBuvvAtxr7Eoq3xxPXFiVMyoXbTimMO?=
 =?us-ascii?Q?rVJflED4cB800ryt8afOP5XwU5M1htUJFul4SBTnA1Sq4DP54om5woK50uuk?=
 =?us-ascii?Q?JBsk9tQaI0oK3EcM7wyqmlh4R4Hk17+EzCeKzxmblyBv3u0wpeIEtzwRX2Jf?=
 =?us-ascii?Q?vnE02x4n9+0udQiQ+TxEqVdD6yv1R3b9oGxiHplwijEz9HoATYgJGARiddxX?=
 =?us-ascii?Q?J5tNWFP7R1cbtpMEaKC+W9T6assiKT9lpPiTvlrDV6jP9x9WJJxGNqRa8z5s?=
 =?us-ascii?Q?gr2Z6A02j0kg9TV78l73i3Pw6HW++fiIW18y0qJ7rHcrbhknrTKvhIDY+Ovz?=
 =?us-ascii?Q?p5P86locrFRLjc16/+iqvSYCY9Qu4rV0mF3EFDInbkLVJ+Nh829Or77L/kBg?=
 =?us-ascii?Q?AV26vQqOmhdrggNFfhcOfCXreAESHs3HSfGVxDQU0L5jjqc2yernxuNPMdUc?=
 =?us-ascii?Q?HwmW9b9EPOljoJK7lTyOqCB2D9wrQ65g8FSolEX1ldsdEjZRsuyyfHyPV4YZ?=
 =?us-ascii?Q?BU9o+NINDBr7+WAU7EOlihu3U4CmIpe1RpEipHIMV0kWJI2Qzl+D5FGfOOkm?=
 =?us-ascii?Q?AxL5uAvfq1LEXCv636QnqRs6W2WfbXwIiGwR1u/2rRsDmPH3tcSVSItP2YXH?=
 =?us-ascii?Q?srTVtoYW5u/0kBHOy+SFG3hNTv4SYOPa3F+EFlIAU0E02L6PFlWDUzMkqWCc?=
 =?us-ascii?Q?+tEsCosobwQ6K38HyOEnP6APf+sqj8AKpHUL+lrV3KxGA2jn6dJjC9JFLuft?=
 =?us-ascii?Q?w3dSuNsbOxYo0X22fpn8y2vQ2AuvJOb2DZmhIvv+qPSzE6UIcTC/z9EKGggO?=
 =?us-ascii?Q?RP+jj30a2LwtQoqhAhLH/PasFy/Kr7JUaH1ykeZwz2TybRCWDEcGJhR2Kz6q?=
 =?us-ascii?Q?6PM/1D08X9B333zHir38ByErZR7P6UnCRNqvAw8nv3O/68yekrIJzwFEHhQ9?=
 =?us-ascii?Q?M0ssRSNT1N+BJp0pu9dNsuPx3lRdCCOFrv6aobmRScNWqURDJIAUavLQpZcY?=
 =?us-ascii?Q?btM3GL664zfzE9CgIiKtp36b8jbmSkLHwhaL7Mvar0CWwMnHFxrcQOzCPhty?=
 =?us-ascii?Q?5NWma4/Z2Ixw1xtz9NsUQR9mhgPmtsNTUyaRC6s9MxUoOiQj5v+kXEoJ8F2f?=
 =?us-ascii?Q?v/5Tzea87ALGRqVvqnitLQAC0OpbXWfP2PnSsbSzzOKk8Gfan66fuCci0LU2?=
 =?us-ascii?Q?ocb+V7pvxFt/PPgbvwLdd7GgNxg7ObtiCwsCO7RBEIqmG8f0vhiRXXjE7jsB?=
 =?us-ascii?Q?ul/jdrczBAlzF+UJGhjogwZspw3yvzr0YppEPUSwBDaCPEi5hmuGCkNau0cr?=
 =?us-ascii?Q?2/aT5H1MI+yr3kSPz9+B1n0vGNuk9NGeKR8ExHedsamXwFRrSy5iKCUk0FOl?=
 =?us-ascii?Q?82loVb5PXMaJCevnQ1c6aDuJtsW3c0XXoMgIfbZzh2rnnBEvhaCqgkC/QcEz?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52551320-8497-435c-6012-08dd87c853c4
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:21:02.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g6sakv+7Lk5/motOJWJ/Zeduf/fUqVzQpBOPJ3GjTr4kTzoJeDkEljtuOVBKn8Gh9pOdKuigx1YA5aFwzbDzMtYChyRPELQ0jAA9rhWv+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=6811eb7f cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=KKAkSRfTAAAA:8 a=t7CeM3EgAAAA:8 a=_XJw-R629XSZL9TPnesA:9 a=cvBusfyB2V15izCimMoJ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KPvQ5xsYbgW2HCLKzMyXNZJarZpnewN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2NSBTYWx0ZWRfX0bznfmqV9Li/ MuFgv1L0NEIMkonMf5gZoV38EqSOyy07TO5spmHLD8DU8iEAqZaRTV8L8B2bGbDTuTNEVyGuE+3 6R6RF+rW057o893QWSNWe6toqXLdeXEXhYtQJkOln9KF/RMclxN2NJW6W5a2ujSPipEbYK/iI6N
 FvDCNSwMViGep/9a6XSniyzQghCz09kHUpAOTeACoEPcrl1ugimHxV2sadKDMWEV9zucsO4oKLp 2Ggr8eAfQPoGOulbJnl6yR0TCfaqSdUnj6oH+TXEgtycWsEJFa2Q5TaftFjcQlCqZVI3EPxZ1rX 2wi9mWB7DM1JNV4DcAPLlIPxtLq2129ApT9Pn8TrXYkHZGobcNkyQ3sX2nEuF5yjftO+u+kVtVE
 ceAegSKrWsnBe9wCCZyX0iVtzK/7SfIms25LgyAyOURChxOfPqL0OhpfJ1N/A+Rc/h3SCB/E
X-Proofpoint-GUID: KPvQ5xsYbgW2HCLKzMyXNZJarZpnewN5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300065

When rproc->state = RPROC_DETACHED and rproc_attach() is used
to attach to the remote processor, if rproc_handle_resources()
returns a failure, the resources allocated by imx_rproc_prepare()
should be released, otherwise the following memory leak will occur.

Since almost the same thing is done in imx_rproc_prepare() and
rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
to deal with empty lists so it is better to fix the "goto" statements
in rproc_attach(). replace the "unprepare_device" goto statement with
"clean_up_resources" and get rid of the "unprepare_device" label.

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

Fixes: 10a3d4079eae ("remoteproc: imx_rproc: move memory parsing to rproc_ops")
Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b21eedefff87..fb7515ef155f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1617,7 +1617,7 @@ static int rproc_attach(struct rproc *rproc)
 	ret = rproc_set_rsc_table(rproc);
 	if (ret) {
 		dev_err(dev, "can't load resource table: %d\n", ret);
-		goto unprepare_device;
+		goto clean_up_resources;
 	}
 
 	/* reset max_notifyid */
@@ -1634,7 +1634,7 @@ static int rproc_attach(struct rproc *rproc)
 	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
 	if (ret) {
 		dev_err(dev, "Failed to process resources: %d\n", ret);
-		goto unprepare_device;
+		goto clean_up_resources;
 	}
 
 	/* Allocate carveout resources associated to rproc */
@@ -1653,7 +1653,6 @@ static int rproc_attach(struct rproc *rproc)
 
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
-unprepare_device:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
 disable_iommu:
-- 
2.25.1

