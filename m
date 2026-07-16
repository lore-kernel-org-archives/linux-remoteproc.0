Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013055.outbound.protection.outlook.com [52.101.127.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670141F5C1;
	Thu, 16 Jul 2026 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207384; cv=fail; b=fcqBYjXlLfeS30FGMCclQjes3Ad5xobAVNd+rIA34YMvCCzXkyhZ/VeSoSrscsrOty53A0/CteeDxwMt3QkqNEqckYA+AT1jXnWGnIn5uub0PEvSKdtetmeTPYhUsTeCdrZOW1KvJGTddNmm5gePQx9b8rS2EFAOnlz3IgrzpDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207384; c=relaxed/simple;
	bh=kEkttOvXWDDGnJRqY6rze0afCdfXLC9q0oigYEm/E6M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WE27upSefhqYLi9M7/IfUAp1sLg5vV+nSgXcQLkAoBHWk32oh3qHtMRbCPu4B+/KvzH8gux6J6lnlAkHd+NLVN9cIBVENZcL2HFApayYOW7IZ8MUU4uCrAgtfFfC+NcCVGRXzg9qzKQYp8rRJbRPtymi3ulKmSgQrXM2DoKd/6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bDVfng2M; arc=fail smtp.client-ip=52.101.127.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bDVfng2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYsyaZ1YxrkrwCAkM+FFyQ9Iv9TzdRJB6zeYT8fW+Ag7JGDnmZ3xS1XNeAzBLUE1yAT47PFNagca9yIC/0BnfENV6gT6FzlYltaQIeNaBIKvffxGlp6+InJsOB0BVvxzVt1j+ZT/PZ7yJQDIrtko50N+BPE1FrG1EovqDxZgwwpbCJmMxi0CxQSuvVvvgOo3F7vMo7FbFlA94xC/pwYi/U23ByWdAg3iiAZbODACV5oegx+xu90dYTalzwrQHhH4duytEH+cNfVaQUtZnB1Zw713enuw3qji05TCp4AUbRm1zxTip7nxhRI6BIK33ttxc8Ku1fDc9Nn4DyJd9eXwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaQl3skFZ6VDI9caUDLKtcOG2SIyDqI91DWW5SDVom4=;
 b=PEGkxQGZ7k2NvztCvb9js2gMmv9pwm8GIvjZzfN75KcKPKQBe9OvQCiRnCz4Q2kPCwaK2sOsfwdWtouvzIieFwyZH9WSbUkwW/CXGeMgLhwUTEmnFDgBRxVtLQ9vpD2v69j2D0Umgr/9v7KxplJTCcY43L/3EyOKlZskkKxFO5gZsTvGaSFXVQZVLE18RNWx7oxu7tTUU7LPviff2LMA6OdosW3gWJVQRAJAnchnqLC7KT+R4m1NMM5SjCUORHtr/bdSH2URx2JQvU8CFXkirpvKeIvh23KuLZ6+tongopLjziBp2iJEpoqt/YwjnhZaR+izW/Y/pJ85eVc6yJ9xpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaQl3skFZ6VDI9caUDLKtcOG2SIyDqI91DWW5SDVom4=;
 b=bDVfng2MQ0cDjgnKdgZwqnnQTvRn8XfsoENa/2gaqJx0OeALSw7mzcWp/x5goy3dQ+pZ1qa8ffLFNv51t76fiAIngkPjM+fueXjRvxsOgQXr2JasCE4iJU2FMGIGLFro+i9l8FR3YNuNCtsjYv8UCoU0Yur3GT7vG5ndzW9xgd4OUmdILurWHS0pga5ASgAgVVf9cQRJaLH5c4h5vpf2OJkhDvv/0b3fFl6zEcHpLimRpPCnKCoALhv67qiLghN2FSf7g0aO+FmiNTFM/P9oTqK+C0NJZct4SRApggoFr6uT916ihZpTtimODA0ayjR9gCkQUot8gMaLxCeFLWOjGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB8885.apcprd06.prod.outlook.com (2603:1096:101:339::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 13:09:37 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:09:37 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/2] rpmsg: Remove redundant error messages on IRQ request failure
Date: Thu, 16 Jul 2026 21:08:28 +0800
Message-Id: <20260716130830.519740-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: ac93cb4f-bafd-41e0-67fe-08dee33b7cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	cEaqQY4SdVmrFhCrSAEvwotns8a1D7nNFkyphj1Uv2Q6V2FUWUB5NUUCOEZQ6VRC281pHa+HZ+9U/KNdiA+rgT4A1P3uxMvqQJSa3A7vsuL8sB6KjcTcmyug/fyQleLLgZr3NoDEmaYAyeX6JQOdd8jFiYkF2BZfF67CxW54f4f4ZUBs9oIvUa9CA4QbV+YX4wE3AxpkLyv2cMnQ/cvm4pFljMPNmARms7POW+HLA36ifEYci3t/G6vjQWMpd67KvWCs1rlx1+HFk52AnPTzDfuy/GGprTf53/e/AFwtGB59zXMZKYB0vdJoR6fF8m1e3c9ZpQC072fI1fnnpZIbhb/RzVNs8XEtMftCiNGmcBUpMc0JbgUPnQxawCVXJ52xFp6koc4xgfC/THzjrXyLp+WKa0HZR9r1NjBRMIUyxgXnSh2mS3pAttAwVBzuArfN7S5naYlQ7ttqtVj31z/GvpX3M5f1O4xHLS27l+EyQHAX/eQF1P8Aqz2GFEQcyAn1467GcKP2dbVpvkkexPEuLQuuQGaXIruiWe9dIs3jQVSxn65Zoaki6jkqqILhaKttgEltnzxGPWhdBcg4fKAe6XyM8LMh+W/rXaElfwHpkX29Q/gZYdmZaXRwrfKqCTNyuWda/vl+HBEFqxZsqe4H6sY5XyjFdMB/Z1hWb06sRoEC1DUy/aJYy/YHvo8oaZmXXDsKf4B0WXPhHZYQ+ETV1aZ1S4BW3eLSqUFqPJz+u0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HLEKf7W4j6DDR6fqI5vBtis6httBA9Wl3BRbK50rKe+7WNLL5mSVjZ8CdxyH?=
 =?us-ascii?Q?f9sg0mW8MJaY7ui9hepzfd+AMETlebfHxYrL3HfAsl92/0RMg4+Dt8htDOrm?=
 =?us-ascii?Q?KAz3PIwoIV55tr1SHMLvpTz8mWF2Cmz6wyoAnKvehUx1K+K6/qXNXIlUPPmE?=
 =?us-ascii?Q?b5tGArdlWE0WQny3+X7fFUxfcyYdfAtbq4pOuTG4sGeUJOfuiL09VnJFfjBh?=
 =?us-ascii?Q?ONyWzPrYCEW6OF4/3TuEXd9FZkKSFwpIbeRMnYEnvrT9pevDS1t5Nk4D+S7Y?=
 =?us-ascii?Q?QiO+XFGddkpX5THYT3nZMn909llRJPsh8K/y0Bc1LcDC6GGt69NO1fkG4U+O?=
 =?us-ascii?Q?mWD6FxJRyQaDUVtXM88TKT+vHY6dvgyz61oR2wybcC5Sd+3CQrf6OJ9920YV?=
 =?us-ascii?Q?l7UwjcJZuWrrfBH0gLdYcwW4mULtBCaEeSkWSQKe5H7jBmdOjZgzO5e5pa1v?=
 =?us-ascii?Q?U2j88GS0qxVMapIM88aroccSmR8jThodCUQMkiUxk7VscwAhZ+eZcsHupWvg?=
 =?us-ascii?Q?edFLSnXQstU50BvtyIp8SFxyfaLXAmFwChkTtIcDdDVveWMIrYDVkblqucel?=
 =?us-ascii?Q?H/OJ8cShoEDlP/qfSqk+KrQbgFfBWW4UdF5ZKadjSV9Y1rbsdA46q8eYAunK?=
 =?us-ascii?Q?Q12B+ptd9SaZDtKfL4g2g0MGyU1IOxD3iOr7vorcShwaDkIsSWbwVd8FMqGw?=
 =?us-ascii?Q?TByCQfeq9lfr+HcxBfFCwfuubWmbkbeFdkuRew8hZFXX6jVpt6FbmpeuzeAU?=
 =?us-ascii?Q?e8q3ksPhphHer0jIRmpj/F/kyuy75HuW9KNyPgp4mh80O4xpLt2ALeuay/WQ?=
 =?us-ascii?Q?VTj/thfGkm54BuhN5LsEW/B9E7QFKqdaGeI+0rUCseZaWLDxWrpyaUn5hpz/?=
 =?us-ascii?Q?4t11Su5t1N2bDzdtSa31lPdZW2AM9u1i+K34/yZ2ehmmKGs7b5TnT7qAe0AG?=
 =?us-ascii?Q?qohO5C0EBwU2S6Jc0F/9fCIrwu6Cic9wmqY8Ox4eghRTndMoXyTcEgeD6Mdo?=
 =?us-ascii?Q?0ydIdRi9MOxolC+Ap/xMveh9GKEr11zP0I7WQQ+Vrfp0vqcm1f56N6QW8QCr?=
 =?us-ascii?Q?hE/tgqWq0tF0qyP8nP/SMjvWWT2dJV5TB8QGy494r5uwA2ZHExs2Pg1/PrBn?=
 =?us-ascii?Q?lgUh8PZIrPGr3EYzaytqMsr21DPivdEnhW9WWTV6aWbg8WP3m/a9mCGA2n92?=
 =?us-ascii?Q?5MEtN6mSmmh+dPcjHEKMfb02M1KE28wRwTykp1q65vzeJAOCKQPg6q2BnEL7?=
 =?us-ascii?Q?ymodygaSnwr5oY9WJDPFgUvIY3SYXkl6t87I8ePlcNzGAbDMDJG3Y8A13Jsr?=
 =?us-ascii?Q?av9lKCA8CRt8NGYvoBJ2er6jhK2+JfacmCUyxR1wsbXd2ASx1R2PI9TrMi2x?=
 =?us-ascii?Q?V0S/Y6afCYvl4GsgY85+4t2s9ngJFOLdEMNitwm/XirWtUsS0C5XJOVpEP/E?=
 =?us-ascii?Q?2TXg4maX0FR5Aa3rUmwmkgOB2CF+ak88UCEPUjMa6nE4FTTpZ0cm+jO/Ozh0?=
 =?us-ascii?Q?+4EZ2ZP1ltGtAQKgeswUSo7GkV2z5CaL7mEWWRoWWvw+qfD4f4DACmc/hUbF?=
 =?us-ascii?Q?jsYx61opc7xhX9/4W6+snFRciasyBZtfenIyPpD1EalPAS1gcklxP7i8BkKy?=
 =?us-ascii?Q?+u99w04/IZjfrfzvb6clVTA0Ej5d2Z+m0IYVtk1jTLzczDp907NEHjF0w2fj?=
 =?us-ascii?Q?RJuVjCTXghuSR6iZCVSCov8Hg0SiIcANagoUsobfzW6a+Pp6INOliqq9Lkmm?=
 =?us-ascii?Q?h/aSFKzCiQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac93cb4f-bafd-41e0-67fe-08dee33b7cf0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:09:37.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqVi0aKg/ZRSlUiq6vY7tvPCQtjNu6+sYepGTFhhcx4lyT6dotvJTqW4Hu4HCLvM1tZmmYBhU9jqLvoZwzI80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8885

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in rpmsg drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (2):
  rpmsg: glink: Remove redundant dev_err()
  rpmsg: smd: Remove redundant dev_err()

 drivers/rpmsg/qcom_glink_rpm.c  | 4 +---
 drivers/rpmsg/qcom_glink_smem.c | 4 +---
 drivers/rpmsg/qcom_smd.c        | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.34.1

